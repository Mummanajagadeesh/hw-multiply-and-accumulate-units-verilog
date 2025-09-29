# Hardware MAC Units (Verilog)

![mac-arch-diag](mac.png)

This repository contains hardware implementations of **Multiply-Accumulate (MAC) units** and their building blocks, written in **synthesizable Verilog**.
The objective is to study and compare different **adder and multiplier architectures** in the context of datapath design for VLSI systems.

Each variant combines a **multiplier** with an **adder/accumulator strategy**, exploring design trade-offs in delay, area, and power. Additional pairs will be added over time.

---

#### MBE–CSA 

The first implemented datapath combines a **Modified Booth Multiplier (MBE)** with a **Carry-Save Adder (CSA)** to form the core of a MAC unit.

---

##### Modified Booth Multiplier (MBE)

The multiplier employs **radix-4 Booth recoding** to reduce the number of partial products.
For a multiplicand (M) and multiplier (Q), triplets of bits from (Q) are recoded into signed multiples of (M):

$$
PP =
\begin{cases}
0 & \text{if } (q_{i+1} q_i q_{i-1}) \in \{000,111\} \\
+M & \text{if } (q_{i+1} q_i q_{i-1}) \in \{001,010\} \\
+2M & \text{if } (q_{i+1} q_i q_{i-1}) = 011 \\
-2M & \text{if } (q_{i+1} q_i q_{i-1}) = 100 \\
-M  & \text{if } (q_{i+1} q_i q_{i-1}) \in \{101,110\}
\end{cases}
$$

This reduces the number of partial products by approximately half, lowering the depth of subsequent accumulation stages.

**Yosys Netlist (top-level multiplier):**
![MBE Multiplier Netlist](./mbe-csa-b/mbe/mbe_unit.png)
*Partial-product generation and accumulation using Modified Booth recoding.*

---

##### Carry-Save Adder (CSA)

A CSA is employed for fast accumulation of three operands without immediate carry propagation:

$$
\begin{aligned}
S_i &= A_i \oplus B_i \oplus C_i \\
C_i &= (A_iB_i) \lor (B_iC_i) \lor (C_iA_i)
\end{aligned}
$$

The outputs are a **sum vector** and a **carry vector**, which are combined later by a final adder.

**Yosys Netlist (CSA):**
![CSA Netlist](./mbe-csa-b/csa/csa_unit.png)
*CSA datapath showing bitwise sum and carry generation.*

---

##### MAC Unit Composition

The MAC datapath integrates the MBE multiplier and CSA as follows:

1. **MBE Multiplier** computes the product ($P = A \times B$).
2. **CSA** reduces $(P, \text{Acc}_{in}, 0)$ into sum and carry vectors.
3. **Shifter** aligns the carry.
4. **Final Adder** resolves the two-vector representation into $\text{Acc}_{out}$.

$$
\text{Acc}_{out} = (A \times B) + \text{Acc}_{in}
$$

**Yosys Netlist (MAC):**
![MAC Netlist](./mbe-csa-b/mac/mac_unit.png)
*Multiply-Accumulate unit with integrated Booth multiplier and CSA-based accumulator.*

---

##### Extension to Higher Structures

The same MAC building block can be tiled to construct larger computational units. For example:

* **Processing Element (PE):**
  ![PE Netlist](./mbe-csa-b/pe/pe_unit.png)  
  *PE integrating a MAC with local register and forwarding logic.*

* **Systolic Array:**
  ![Systolic Array Netlist](./mbe-csa-b/systolic/systolic_unit.png)  
  *Two-dimensional systolic arrangement for parallel matrix multiplication. Lower hierarchical blocks are hidden for brevity.*

---

#### Key Takeaways

* **MBE reduces multiplier partial products**, saving area and delay.
* **CSA accelerates accumulation**, deferring carry propagation to the last stage.
* The **MBE–CSA pair** represents a high-performance datapath style well-suited for MAC-intensive workloads.


Perfect — thanks for sharing the README. Here’s the **extension block** you can add after the existing `MBE–CSA` section (no repetition of old content):

---

#### Booth–Kogge

The second datapath variant combines a **Booth Multiplier** with a **Kogge–Stone Adder**, offering a contrasting trade-off between simplicity and speed compared to the first pair.

---

##### Booth Multiplier

This multiplier variant applies the classic **Booth algorithm** for signed multiplication.
Instead of generating all partial products, it inspects bit-pairs of the multiplier and selects between *addition, subtraction, or no operation* of the shifted multiplicand.

This selective accumulation reduces redundant operations and ensures correct handling of signed operands.

**Yosys Netlist (Booth Multiplier):**
![Booth Multiplier Netlist](./booth-kogge-b/booth/booth_unit.png)
*Partial-product accumulation using Booth recoding.*

---

##### Kogge–Stone Adder

The Kogge–Stone structure is a **parallel prefix adder**, optimized for logarithmic-depth carry computation.
Its stages compute **generate (G)** and **propagate (P)** signals across increasing spans of bits, allowing carry information to be distributed quickly.

The result is a very **fast adder** with predictable delay scaling, at the expense of higher wiring complexity.

**Yosys Netlist (Kogge–Stone Adder):**
![Kogge Netlist](./booth-kogge-b/kogge/kogge_unit.png)
*Parallel-prefix network showing generate/propagate signal flow.*

---

##### MAC Unit Composition

The MAC datapath integrates the Booth multiplier with the Kogge–Stone adder as follows:

1. **Booth Multiplier** generates a signed product ($P = A \times B$).
2. **Kogge–Stone Adder** accumulates this product with the running sum in logarithmic time.
3. **Accumulator Register** stores the updated result synchronously with the clock.

$$
\text{Acc}*{out} = (A \times B) + \text{Acc}*{in}
$$

**Yosys Netlist (MAC):**
![MAC Netlist](./booth-kogge-b/mac/mac_unit.png)
*Multiply-Accumulate unit with Booth multiplier and Kogge–Stone adder.*

---

##### Observations

* **Booth encoding minimizes unnecessary operations** during multiplication.
* **Kogge–Stone achieves low addition delay** via parallel prefix logic.
* The **Booth–Kogge pair** balances multiplier efficiency with one of the fastest known adder structures, making it well-suited for **timing-critical datapaths**.

---

Here’s the **math-heavy extension block** you can add for the **Baugh–Wooley Multiplier + Ripple-Carry Adder** pair (structured like the earlier ones but with more LaTeX detail):

---

#### Baugh–Wooley – Ripple-Carry

The third datapath variant combines a **Baugh–Wooley signed multiplier** with a **Ripple-Carry Adder (RCA)**.
This pair emphasizes simplicity and clarity of two’s complement arithmetic, providing a canonical baseline for comparison against more advanced structures.

---

##### Baugh–Wooley Multiplier

The **Baugh–Wooley algorithm** ensures that signed multiplication in **two’s complement** form can be performed using only **positive-weighted partial products**.

For two signed numbers of width $n$:

$$
[
A = -a_{n-1}2^{n-1} + \sum_{i=0}^{n-2} a_i 2^i
]
$$

$$
[
B = -b_{n-1}2^{n-1} + \sum_{j=0}^{n-2} b_j 2^j
]
$$

The product is:

$$
[
P = A \cdot B
= \Big( -a_{n-1}2^{n-1} + \sum_{i=0}^{n-2} a_i 2^i \Big)
\Big( -b_{n-1}2^{n-1} + \sum_{j=0}^{n-2} b_j 2^j \Big)
]
$$

Expanding yields four groups of terms:

1. **Positive partial products** ($a_i b_j 2^{i+j}$).
2. **Negative correction terms** involving the MSBs ($-a_{n-1} b_j 2^{n-1+j}$ and $-b_{n-1} a_i 2^{n-1+i}$).
3. **Double-negation MSB term** ($a_{n-1} b_{n-1} 2^{2n-2}$).

The Baugh–Wooley technique *rearranges* the negative terms into a positive-weighted structure by complementing and adding correction bits, allowing the hardware to be realized with a uniform partial-product matrix.

Thus, the hardware can generate all $n^2$ partial products as if operands were unsigned, with small **bit inversions and constant additions** correcting the two’s complement behavior.

**Yosys Netlist (Baugh–Wooley Multiplier):**
![Baugh–Wooley Multiplier Netlist](./baugh-rca-b/baugh/baugh_unit.png)
*Signed multiplication in two’s complement via positive partial-product rearrangement.*

---

##### Ripple-Carry Adder (RCA)

The RCA is the simplest form of binary adder. For two $n$-bit operands $A = (A_{n-1},\dots,A_0)$ and $B = (B_{n-1},\dots,B_0)$, each bit position computes:

$$
[
\begin{aligned}
S_i &= A_i \oplus B_i \oplus C_i \
C_{i+1} &= (A_i B_i) + (B_i C_i) + (C_i A_i)
\end{aligned}
]
$$

with initial carry $C_0 = 0$.

The total delay is proportional to $O(n)$, since each carry must ripple sequentially through all stages.
While slow compared to logarithmic adders, the RCA has minimal area and wiring complexity.

**Yosys Netlist (Ripple-Carry Adder):**
![Ripple-Carry Adder Netlist](./baugh-rca-b/rca/rca_unit.png)
*Bitwise full-adder chain propagating carry serially from LSB to MSB.*

---

##### MAC Unit Composition

The MAC datapath integrates the Baugh–Wooley multiplier with the ripple-carry adder:

1. **Baugh–Wooley Multiplier** computes a signed product $P = A \times B$ using a correction-free partial product array.
2. **Ripple-Carry Adder** accumulates the product with the current running sum:

$$
[
\text{Acc}*{out} = \text{Acc}*{in} + (A \times B)
]
$$

3. **Accumulator Register** stores the updated result synchronously.

**Yosys Netlist (MAC):**
![MAC Netlist](./baugh-rca-b/mac/mac_unit.png)
*Multiply-Accumulate datapath using Baugh–Wooley multiplier and ripple-carry adder.*

---

##### Observations

* **Baugh–Wooley ensures correctness** of two’s complement multiplication with uniform hardware structure.
* **Ripple-Carry Adder has $O(n)$ delay**, making it the simplest but slowest accumulation method.
* The **Baugh–Wooley – RCA pair** represents a **baseline reference design**: easy to implement and area-efficient, but limited in performance.

---

