module rca #(parameter WIDTH = 8)(
    input  signed [WIDTH-1:0] A,
    input  signed [WIDTH-1:0] B,
    output signed [WIDTH-1:0] SUM
);
    wire [WIDTH:0] C;
    assign C[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : full_adders
            assign {C[i+1], SUM[i]} = A[i] + B[i] + C[i];
        end
    endgenerate
endmodule
