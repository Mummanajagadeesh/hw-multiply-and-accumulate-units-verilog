// 3-bit Booth Encoder: generates partial product
module booth_encoder(
    input signed [15:0] multiplicand,
    input [2:0] booth_code,
    input [3:0] shift,           // amount to shift multiplicand
    output reg signed [15:0] partial_product
);
    always @(*) begin
        case (booth_code)
            3'b001, 3'b010: partial_product = multiplicand << shift;
            3'b011:         partial_product = multiplicand << (shift + 1);
            3'b100:         partial_product = -(multiplicand << (shift + 1));
            3'b101, 3'b110: partial_product = -(multiplicand << shift);
            default:        partial_product = 0;
        endcase
    end
endmodule

// Partial product accumulator
module pp_accumulator(
    input signed [15:0] pp_in,
    input signed [15:0] sum_in,
    output signed [15:0] sum_out
);
    assign sum_out = pp_in + sum_in;
endmodule

// Top-level Modified Booth Encoder multiplier
module mbe (
    input  signed [7:0] A,  // Multiplicand
    input  signed [7:0] B,  // Multiplier
    output signed [15:0] P   // Product
);
    wire signed [15:0] multiplicand_ext;
    assign multiplicand_ext = {{8{A[7]}}, A}; // sign-extend A

    wire signed [15:0] pp0, pp1, pp2, pp3;
    wire signed [15:0] sum0, sum1, sum2;

    wire [2:0] booth0, booth1, booth2, booth3;
    assign booth0 = {B[1], B[0], 1'b0};
    assign booth1 = {B[3], B[2], B[1]};
    assign booth2 = {B[5], B[4], B[3]};
    assign booth3 = {B[7], B[6], B[5]};

    // Partial products
    booth_encoder u0(.multiplicand(multiplicand_ext), .booth_code(booth0), .shift(0), .partial_product(pp0));
    booth_encoder u1(.multiplicand(multiplicand_ext), .booth_code(booth1), .shift(2), .partial_product(pp1));
    booth_encoder u2(.multiplicand(multiplicand_ext), .booth_code(booth2), .shift(4), .partial_product(pp2));
    booth_encoder u3(.multiplicand(multiplicand_ext), .booth_code(booth3), .shift(6), .partial_product(pp3));

    // Accumulate partial products
    pp_accumulator a0(.pp_in(pp0), .sum_in(16'b0), .sum_out(sum0));
    pp_accumulator a1(.pp_in(pp1), .sum_in(sum0), .sum_out(sum1));
    pp_accumulator a2(.pp_in(pp2), .sum_in(sum1), .sum_out(sum2));
    pp_accumulator a3(.pp_in(pp3), .sum_in(sum2), .sum_out(P));

endmodule
