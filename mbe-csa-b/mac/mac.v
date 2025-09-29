module adder (
    input  signed [15:0] A,
    input  signed [15:0] B,
    output signed [15:0] Y
);
    assign Y = A + B;
endmodule

module shifter (
    input  [15:0] in,
    output [15:0] out
);
    assign out = in << 1;
endmodule

module mac (
    input  signed [7:0] A,
    input  signed [7:0] B,
    input  signed [15:0] AccIn,
    output signed [15:0] AccOut
);
    wire signed [15:0] product;
    wire [15:0] sum, carry;
    wire [15:0] carry_shifted;

    mbe mul (
        .A(A),
        .B(B),
        .P(product)
    );

    csa csa_inst (
        .A(product),
        .B(AccIn),
        .C(16'd0),
        .Sum(sum),
        .Carry(carry)
    );

    shifter shift_inst (
        .in(carry),
        .out(carry_shifted)
    );

    adder add_inst (
        .A(sum),
        .B(carry_shifted),
        .Y(AccOut)
    );

endmodule
