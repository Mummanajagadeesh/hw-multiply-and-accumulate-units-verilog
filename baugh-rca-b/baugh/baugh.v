// -------------------------------
// Partial Product Generator (8x8) - flattened outputs
// -------------------------------
module pp_gen_8x8 (
    input  [7:0] A,
    input  [7:0] B,
    output [15:0] pp0,
    output [15:0] pp1,
    output [15:0] pp2,
    output [15:0] pp3,
    output [15:0] pp4,
    output [15:0] pp5,
    output [15:0] pp6,
    output [15:0] pp7
);
    integer i, j;
    reg [15:0] tmp_pp[0:7];

    always @(*) begin
        for (i = 0; i < 8; i = i + 1) begin
            tmp_pp[i] = 16'b0;
            for (j = 0; j < 8; j = j + 1) begin
                tmp_pp[i][i+j] = A[j] & B[i];
            end
        end
    end

    assign pp0 = tmp_pp[0];
    assign pp1 = tmp_pp[1];
    assign pp2 = tmp_pp[2];
    assign pp3 = tmp_pp[3];
    assign pp4 = tmp_pp[4];
    assign pp5 = tmp_pp[5];
    assign pp6 = tmp_pp[6];
    assign pp7 = tmp_pp[7];
endmodule

// -------------------------------
// Partial Product Adder - flattened inputs
// -------------------------------
module pp_adder_8 (
    input [15:0] pp0,
    input [15:0] pp1,
    input [15:0] pp2,
    input [15:0] pp3,
    input [15:0] pp4,
    input [15:0] pp5,
    input [15:0] pp6,
    input [15:0] pp7,
    output [15:0] sum
);
    reg [15:0] tmp_sum;
    integer k;

    always @(*) begin
        tmp_sum = 16'b0;
        tmp_sum = pp0 + pp1 + pp2 + pp3 + pp4 + pp5 + pp6 + pp7;
    end

    assign sum = tmp_sum;
endmodule

// -------------------------------
// Signed Correction Module
// -------------------------------
module signed_correction_8 (
    input  [7:0] A,
    input  [7:0] B,
    input  [15:0] unsigned_sum,
    output signed [15:0] P
);
    wire signed [15:0] signed_A;
    wire signed [15:0] signed_B;

    assign signed_A = {{8{A[7]}}, A};
    assign signed_B = {{8{B[7]}}, B};

    assign P = signed_A * signed_B; // synthesis infers signed multiplier
endmodule

// -------------------------------
// Top-Level Baugh-Wooley Multiplier (8-bit)
// -------------------------------
module baugh (
    input  [7:0] A,
    input  [7:0] B,
    output signed [15:0] P
);
    // -------------------
    // Single-bus intermediate wires
    // -------------------
    wire [15:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7;
    wire [15:0] sum_wire;

    // -------------------
    // Submodule Instantiations
    // -------------------
    pp_gen_8x8 pp_inst (
        .A(A),
        .B(B),
        .pp0(pp0),
        .pp1(pp1),
        .pp2(pp2),
        .pp3(pp3),
        .pp4(pp4),
        .pp5(pp5),
        .pp6(pp6),
        .pp7(pp7)
    );

    pp_adder_8 add_inst (
        .pp0(pp0),
        .pp1(pp1),
        .pp2(pp2),
        .pp3(pp3),
        .pp4(pp4),
        .pp5(pp5),
        .pp6(pp6),
        .pp7(pp7),
        .sum(sum_wire)
    );

    signed_correction_8 corr_inst (
        .A(A),
        .B(B),
        .unsigned_sum(sum_wire),
        .P(P)
    );
endmodule
