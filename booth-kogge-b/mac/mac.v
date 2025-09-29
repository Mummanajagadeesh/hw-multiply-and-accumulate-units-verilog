// -------------------------------
// MAC Register (fixed width for 16-bit accumulation)
// -------------------------------
module mac_register_16 (
    input clk,
    input rst,
    input en,
    input signed [15:0] data_in,
    output reg signed [15:0] data_out
);
    always @(posedge clk or posedge rst) begin
        if (rst) data_out <= 0;
        else if (en) data_out <= data_in;
    end
endmodule

// -------------------------------
// MAC Control (no parameters)
// -------------------------------
module mac_control_unit (
    input start,
    output en,
    output done
);
    assign en   = start;
    assign done = start;
endmodule

// -------------------------------
// Top-Level MAC Unit (decomposed, fixed width)
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
    // Intermediate wires
    // -------------------
    wire signed [15:0] product_wire;
    wire signed [15:0] sum_wire;
    wire signed [15:0] acc_wire;
    wire en_wire, done_wire;

    // -------------------
    // Submodule Instantiations
    // -------------------

    // Booth Multiplier (existing fixed-width version)
    booth mult_inst (
        .multiplicand(A),
        .multiplier(B),
        .product(product_wire)
    );

    // Kogge-Stone Adder (existing fixed-width version)
    kogge add_inst (
        .A(acc_wire),
        .B(product_wire),
        .SUM(sum_wire)
    );

    // MAC Register
    mac_register_16 acc_reg (
        .clk(clk),
        .rst(rst),
        .en(en_wire),
        .data_in(sum_wire),
        .data_out(acc_wire)
    );

    // Control Signals
    mac_control_unit ctrl_inst (
        .start(start),
        .en(en_wire),
        .done(done_wire)
    );

    // Output assignments
    assign result = acc_wire;
    assign done   = done_wire;
endmodule
