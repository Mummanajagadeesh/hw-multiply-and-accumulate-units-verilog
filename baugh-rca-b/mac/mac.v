// -------------------------------
// Accumulator Register (16-bit)
// -------------------------------
module mac_reg_16 (
    input clk,
    input rst,
    input en,
    input signed [15:0] data_in,
    output reg signed [15:0] data_out
);
    always @(posedge clk or posedge rst) begin
        if (rst) data_out <= 16'sd0;
        else if (en) data_out <= data_in;
    end
endmodule

// -------------------------------
// Control Logic
// -------------------------------
module mac_ctrl (
    input start,
    output en,
    output done
);
    assign en   = start;
    assign done = start;
endmodule

// -------------------------------
// Top-Level MAC using BW Multiplier + RCA Adder
// -------------------------------
module mac (
    input clk,
    input rst,
    input start,
    input signed [7:0] A,
    input signed [7:0] B,
    output signed [15:0] result,
    output done
);
    // -------------------
    // Single-bus wires
    // -------------------
    wire signed [15:0] product_wire;
    wire signed [15:0] sum_wire;
    wire signed [15:0] acc_wire;
    wire en_wire, done_wire;

    // -------------------
    // Submodule Instances
    // -------------------

    // Baugh-Wooley multiplier (8x8 → 16)
    baugh mult_inst (
        .A(A),
        .B(B),
        .P(product_wire)
    );

    // Ripple-Carry Adder (16-bit)
    rca add_inst (
        .A(acc_wire),
        .B(product_wire),
        .SUM(sum_wire)
    );

    // Accumulator Register
    mac_reg_16 acc_reg_inst (
        .clk(clk),
        .rst(rst),
        .en(en_wire),
        .data_in(sum_wire),
        .data_out(acc_wire)
    );

    // Control
    mac_ctrl ctrl_inst (
        .start(start),
        .en(en_wire),
        .done(done_wire)
    );

    // Outputs
    assign result = acc_wire;
    assign done   = done_wire;
endmodule
