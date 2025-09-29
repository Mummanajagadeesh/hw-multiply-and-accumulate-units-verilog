module and2_16 (
    input  [15:0] A, B,
    output [15:0] Y
);
    assign Y = A & B;
endmodule

module xor2_16 (
    input  [15:0] A, B,
    output [15:0] Y
);
    assign Y = A ^ B;
endmodule

module or2_16 (
    input  [15:0] A, B,
    output [15:0] Y
);
    assign Y = A | B;
endmodule

module and3_16 (
    input  [15:0] A, B, C,
    output [15:0] Y
);
    assign Y = A & B & C;
endmodule

module or3_16 (
    input  [15:0] A, B, C,
    output [15:0] Y
);
    assign Y = A | B | C;
endmodule

// --- PG cell ---
module pg_cell_16 (
    input  [15:0] A, B,
    output [15:0] G, P
);
    and2_16 u_and (.A(A), .B(B), .Y(G));
    xor2_16 u_xor (.A(A), .B(B), .Y(P));
endmodule

// --- Black cell ---
module black_cell_16 (
    input  [15:0] Gk, Gk_minus1, Pk, Pk_minus1,
    output [15:0] G_out, P_out
);
    wire [15:0] tmp;
    and2_16 u1 (.A(Pk), .B(Gk_minus1), .Y(tmp));
    or2_16  u2 (.A(Gk), .B(tmp), .Y(G_out));
    and2_16 u3 (.A(Pk), .B(Pk_minus1), .Y(P_out));
endmodule

// --- Gray cell ---
module gray_cell_16 (
    input  [15:0] Gk, Gk_minus1, Pk_minus1,
    output [15:0] G_out
);
    wire [15:0] tmp;
    and2_16 u1 (.A(Pk_minus1), .B(Gk_minus1), .Y(tmp));
    or2_16  u2 (.A(Gk), .B(tmp), .Y(G_out));
endmodule

// --- 16-bit Kogge-Stone adder ---
module kogge (
    input  [15:0] A, B,
    output [15:0] SUM
);
    wire [15:0] G0, P0;
    wire [15:0] G1, P1;
    wire [15:0] G2, P2;
    wire [15:0] G3, P3;
    wire [15:0] G4, P4;
    wire [15:0] C;

    // Stage 0: PG cells
    pg_cell_16 u_pg (.A(A), .B(B), .G(G0), .P(P0));

    // Stage 1
    black_cell_16 u_b1 (.Gk(G0), .Gk_minus1({1'b0,G0[15:1]}),
                        .Pk(P0), .Pk_minus1({1'b1,P0[15:1]}),
                        .G_out(G1), .P_out(P1));

    // Stage 2
    black_cell_16 u_b2 (.Gk(G1), .Gk_minus1({2'b0,G1[15:2]}),
                        .Pk(P1), .Pk_minus1({2'b1,P1[15:2]}),
                        .G_out(G2), .P_out(P2));

    // Stage 3
    black_cell_16 u_b3 (.Gk(G2), .Gk_minus1({4'b0,G2[15:4]}),
                        .Pk(P2), .Pk_minus1({4'b1,P2[15:4]}),
                        .G_out(G3), .P_out(P3));

    // Stage 4
    black_cell_16 u_b4 (.Gk(G3), .Gk_minus1({8'b0,G3[15:8]}),
                        .Pk(P3), .Pk_minus1({8'b1,P3[15:8]}),
                        .G_out(G4), .P_out(P4));

    // Final carry
    gray_cell_16 u_gray (.Gk(G4), .Gk_minus1({1'b0,G4[15:1]}),
                         .Pk_minus1({1'b1,P4[15:1]}), .G_out(C));

    // Sum
    xor2_16 u_sum (.A(P0), .B(C), .Y(SUM));
endmodule
