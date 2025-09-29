module xor3 #(parameter WIDTH=16) (
    input  [WIDTH-1:0] A, B, C,
    output [WIDTH-1:0] Y
);
    assign Y = A ^ B ^ C;
endmodule

module and2 #(parameter WIDTH=16) (
    input  [WIDTH-1:0] A, B,
    output [WIDTH-1:0] Y
);
    assign Y = A & B;
endmodule

module or3 #(parameter WIDTH=16) (
    input  [WIDTH-1:0] A, B, C,
    output [WIDTH-1:0] Y
);
    assign Y = A | B | C;
endmodule

module csa (
    input  [15:0] A, B, C,
    output [15:0] Sum, Carry
);
    wire [15:0] AB, BC, CA;

    and2 u1 (.A(A), .B(B), .Y(AB));
    and2 u2 (.A(B), .B(C), .Y(BC));
    and2 u3 (.A(C), .B(A), .Y(CA));

    xor3 u4 (.A(A), .B(B), .C(C), .Y(Sum));
    or3  u5 (.A(AB), .B(BC), .C(CA), .Y(Carry));
endmodule
