// 8-bit register with enable and reset
module reg8_en_rst (
    input clk,
    input rst,
    input en,
    input [7:0] D,
    output reg [7:0] Q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 8'b0;
        else if (en)
            Q <= D;
    end
endmodule

// 16-bit register with enable and reset
module reg16_blk (
    input clk,
    input rst,
    input en,
    input [15:0] D,
    output reg [15:0] Q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 16'b0;
        else if (en)
            Q <= D;
    end
endmodule

// Vector 2:1 MUX for 16-bit vectors
module mux2_16 (
    input [15:0] D0,
    input [15:0] D1,
    input sel,
    output [15:0] Y
);
    assign Y = sel ? D1 : D0;
endmodule

// 8-bit vector 2:1 MUX (for completeness, can be used for A/B if needed)
module mux2_8 (
    input [7:0] D0,
    input [7:0] D1,
    input sel,
    output [7:0] Y
);
    assign Y = sel ? D1 : D0;
endmodule

// Processing Element (PE) — clean, block-style, MAC left as-is
module pe (
    input clk,
    input rst,
    input enable,
    input signed [7:0] A_in,
    input signed [7:0] B_in,
    output [7:0] A_out,
    output [7:0] B_out,
    output [15:0] Acc_out
);
    // Internal accumulator wire
    wire signed [15:0] mac_result;
    wire signed [15:0] acc_next;

    // MAC block (kept as a black-box)
    mac u_mac (
        .A(A_in),
        .B(B_in),
        .AccIn(Acc_out),
        .AccOut(mac_result)
    );

    // Freeze logic: if A_in=B_in=0, keep accumulator, else take mac_result
    wire freeze = (A_in == 0 && B_in == 0);
    mux2_16 acc_mux (
        .D0(Acc_out),
        .D1(mac_result),
        .sel(~freeze),
        .Y(acc_next)
    );

    // Registers
    reg16_blk acc_reg (
        .clk(clk),
        .rst(rst),
        .en(enable),
        .D(acc_next),
        .Q(Acc_out)
    );

    reg8_en_rst a_reg (
        .clk(clk),
        .rst(rst),
        .en(1'b1),
        .D(A_in),
        .Q(A_out)
    );

    reg8_en_rst b_reg (
        .clk(clk),
        .rst(rst),
        .en(1'b1),
        .D(B_in),
        .Q(B_out)
    );

endmodule
