// 3-bit cycle counter with enable and reset
module cycle_counter (
    input clk,
    input rst,
    input en,
    output reg [2:0] count
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 3'b0;
        else if (en)
            count <= count + 1;
    end
endmodule

// Input wavefront register block for 8-bit inputs
module wavefront_reg (
    input clk,
    input rst,
    input [7:0] D0,
    input [7:0] D1,
    input [2:0] cycle,
    output reg [7:0] Q0,
    output reg [7:0] Q1
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Q0 <= 0;
            Q1 <= 0;
        end else begin
            case (cycle)
                3'd1: begin Q0 <= D0; Q1 <= 0; end
                3'd2: begin Q0 <= D0; Q1 <= D1; end
                3'd3: begin Q0 <= 0;  Q1 <= D1; end
                default: begin Q0 <= 0; Q1 <= 0; end
            endcase
        end
    end
endmodule

// Enable generator for systolic array (based on cycle)
module enable_gen (
    input [2:0] cycle,
    output enable
);
    assign enable = (cycle < 3'd5);
endmodule

// Top-level Systolic Array
module systolic (
    input clk,
    input rst,
    input [7:0] A00, A01, A10, A11,
    input [7:0] B00, B01, B10, B11,
    output [15:0] C00, C01, C10, C11
);
    // Cycle counter
    wire [2:0] cycle;
    cycle_counter u_count (.clk(clk), .rst(rst), .en(1'b1), .count(cycle));

    // Enable signal
    wire enable;
    enable_gen u_en (.cycle(cycle), .enable(enable));

    // Input registers for wavefront
    wire signed [7:0] A_in_0_0, A_in_1_0;
    wire signed [7:0] B_in_0_0, B_in_0_1;

    wavefront_reg u_A (.clk(clk), .rst(rst), .D0(A00), .D1(A10), .cycle(cycle),
                       .Q0(A_in_0_0), .Q1(A_in_1_0));
    wavefront_reg u_B (.clk(clk), .rst(rst), .D0(B00), .D1(B01), .cycle(cycle),
                       .Q0(B_in_0_0), .Q1(B_in_0_1));

    // Inter-PE wires
    wire signed [7:0] a0_out, a1_out;
    wire signed [7:0] b0_out, b1_out;
    wire signed [15:0] c00_out, c01_out, c10_out, c11_out;

    // Row 0
    pe PE00 (.clk(clk), .rst(rst), .enable(enable), .A_in(A_in_0_0), .B_in(B_in_0_0),
             .A_out(a0_out), .B_out(b0_out), .Acc_out(c00_out));
    pe PE01 (.clk(clk), .rst(rst), .enable(enable), .A_in(a0_out), .B_in(B_in_0_1),
             .A_out(), .B_out(b1_out), .Acc_out(c01_out));

    // Row 1
    pe PE10 (.clk(clk), .rst(rst), .enable(enable), .A_in(A_in_1_0), .B_in(b0_out),
             .A_out(a1_out), .B_out(), .Acc_out(c10_out));
    pe PE11 (.clk(clk), .rst(rst), .enable(enable), .A_in(a1_out), .B_in(b1_out),
             .A_out(), .B_out(), .Acc_out(c11_out));

    // Output assignments
    assign C00 = c00_out;
    assign C01 = c01_out;
    assign C10 = c10_out;
    assign C11 = c11_out;
endmodule
