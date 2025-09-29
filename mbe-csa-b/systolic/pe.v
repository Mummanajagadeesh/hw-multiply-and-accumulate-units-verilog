module pe (
    input clk,
    input rst,
    input enable,
    input signed [7:0] A_in,
    input signed [7:0] B_in,
    output reg signed [7:0] A_out,
    output reg signed [7:0] B_out,
    output reg signed [15:0] Acc_out
);
    reg signed [15:0] acc_reg;
    wire signed [15:0] mac_result;

    mac mac (
        .A(A_in),
        .B(B_in),
        .AccIn(acc_reg),
        .AccOut(mac_result)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            A_out <= 0;
            B_out <= 0;
            acc_reg <= 0;
            Acc_out <= 0;
        end else begin
            if (enable) begin
                if (A_in == 0 && B_in == 0) begin
                    // Prevent false accumulation when wave is over
                    acc_reg <= acc_reg;
                end else begin
                    acc_reg <= mac_result;
                end
            end else begin
                // Freeze accumulator when not enabled
                acc_reg <= acc_reg;
            end

            A_out <= A_in;
            B_out <= B_in;
            Acc_out <= acc_reg;
        end
    end
endmodule
