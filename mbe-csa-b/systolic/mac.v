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

    csa csa (
        .A(product),
        .B(AccIn),
        .C(16'd0),
        .Sum(sum),
        .Carry(carry)
    );

    assign carry_shifted = carry << 1;
    assign AccOut = sum + carry_shifted;  // Final adder

endmodule
