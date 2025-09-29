// ------------------------------------
// Fixed-width building blocks
// ------------------------------------

module adder_17 (  // WIDTH = 17 for 2*8+1
    input  signed [16:0] A, B,
    output signed [16:0] Y
);
    assign Y = A + B;
endmodule

module subtractor_17 (
    input  signed [16:0] A, B,
    output signed [16:0] Y
);
    assign Y = A - B;
endmodule

module shl_8 (
    input  signed [7:0] A,
    input  integer      SHAMT,
    output signed [7:0] Y
);
    assign Y = A <<< SHAMT;
endmodule

module mux3_17 (
    input  [1:0] sel,
    input  signed [16:0] A, B, C,
    output signed [16:0] Y
);
    assign Y = (sel == 2'b01) ? A :
               (sel == 2'b10) ? B : C;
endmodule

// ------------------------------------
// Booth Step (fixed for WIDTH=8)
// ------------------------------------
module booth_step_8 (
    input  signed [7:0]  mcand,
    input  signed [8:0]  mplier,
    input  signed [16:0] prod_in,
    input  integer       i,
    output signed [16:0] prod_out,
    output signed [8:0]  mplier_out
);
    wire signed [7:0]  shifted_mcand;
    wire signed [16:0] add_res, sub_res, selected_op;

    shl_8 sh_inst (
        .A(mcand), .SHAMT(i), .Y(shifted_mcand)
    );

    adder_17 add_inst (
        .A(prod_in),
        .B({{9{shifted_mcand[7]}}, shifted_mcand}), // sign-extend
        .Y(add_res)
    );

    subtractor_17 sub_inst (
        .A(prod_in),
        .B({{9{shifted_mcand[7]}}, shifted_mcand}),
        .Y(sub_res)
    );

    mux3_17 mux_inst (
        .sel(mplier[1:0]),
        .A(add_res),
        .B(sub_res),
        .C(prod_in),
        .Y(selected_op)
    );

    assign prod_out   = selected_op;
    assign mplier_out = mplier >>> 1;
endmodule

// ------------------------------------
// Booth Multiplier (WIDTH=8, clean schematic)
// ------------------------------------
module booth (
    input  signed [7:0] multiplicand,
    input  signed [7:0] multiplier,
    output signed [15:0] product
);
    wire signed [16:0] prod   [0:8];
    wire signed [8:0]  mplier [0:8];

    assign prod[0]   = 17'd0;
    assign mplier[0] = {multiplier, 1'b0};

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : booth_steps
            booth_step_8 step_inst (
                .mcand(multiplicand),
                .mplier(mplier[i]),
                .prod_in(prod[i]),
                .i(i),
                .prod_out(prod[i+1]),
                .mplier_out(mplier[i+1])
            );
        end
    endgenerate

    assign product = prod[8][15:0];
endmodule
