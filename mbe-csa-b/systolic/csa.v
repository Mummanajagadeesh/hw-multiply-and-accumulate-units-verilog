module csa (
    input  [15:0] A,
    input  [15:0] B,
    input  [15:0] C,
    output [15:0] Sum,
    output [15:0] Carry
);
    assign Sum = A ^ B ^ C;
    assign Carry = (A & B) | (B & C) | (C & A);
endmodule
