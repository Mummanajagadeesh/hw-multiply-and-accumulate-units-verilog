// -------------------------------
// Full Adder (1-bit)
// -------------------------------
module full_adder (
    input  A,
    input  B,
    input  Cin,
    output Sum,
    output Cout
);
    assign {Cout, Sum} = A + B + Cin;
endmodule

// -------------------------------
// Ripple-Carry Adder (8-bit, built from full adders)
// -------------------------------
module rca(
    input  signed [7:0] A,
    input  signed [7:0] B,
    output signed [7:0] SUM
);
    // Carry chain
    wire [8:0] C;

    assign C[0] = 1'b0;

    // -------------------
    // Full Adder instances
    // -------------------
    full_adder fa0 (.A(A[0]), .B(B[0]), .Cin(C[0]), .Sum(SUM[0]), .Cout(C[1]));
    full_adder fa1 (.A(A[1]), .B(B[1]), .Cin(C[1]), .Sum(SUM[1]), .Cout(C[2]));
    full_adder fa2 (.A(A[2]), .B(B[2]), .Cin(C[2]), .Sum(SUM[2]), .Cout(C[3]));
    full_adder fa3 (.A(A[3]), .B(B[3]), .Cin(C[3]), .Sum(SUM[3]), .Cout(C[4]));
    full_adder fa4 (.A(A[4]), .B(B[4]), .Cin(C[4]), .Sum(SUM[4]), .Cout(C[5]));
    full_adder fa5 (.A(A[5]), .B(B[5]), .Cin(C[5]), .Sum(SUM[5]), .Cout(C[6]));
    full_adder fa6 (.A(A[6]), .B(B[6]), .Cin(C[6]), .Sum(SUM[6]), .Cout(C[7]));
    full_adder fa7 (.A(A[7]), .B(B[7]), .Cin(C[7]), .Sum(SUM[7]), .Cout(C[8]));

endmodule
