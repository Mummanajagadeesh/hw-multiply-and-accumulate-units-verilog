module kogge #(parameter WIDTH = 16)(
    input  signed [WIDTH-1:0] A,
    input  signed [WIDTH-1:0] B,
    output signed [WIDTH-1:0] SUM
);
    wire [WIDTH-1:0] G[0:WIDTH];
    wire [WIDTH-1:0] P[0:WIDTH];
    wire [WIDTH-1:0] C;

    assign G[0] = A & B;
    assign P[0] = A ^ B;

    genvar i, j;
    generate
        for (i = 1; i <= $clog2(WIDTH); i = i + 1) begin: gen_stages
            for (j = 0; j < WIDTH; j = j + 1) begin: gen_cells
                if (j >= (1 << (i-1))) begin
                    assign G[i][j] = G[i-1][j] | (P[i-1][j] & G[i-1][j - (1 << (i-1))]);
                    assign P[i][j] = P[i-1][j] & P[i-1][j - (1 << (i-1))];
                end else begin
                    assign G[i][j] = G[i-1][j];
                    assign P[i][j] = P[i-1][j];
                end
            end
        end
    endgenerate

    assign C[0] = 0;
    generate
        for (i = 1; i < WIDTH; i = i + 1) begin
            assign C[i] = G[$clog2(WIDTH)][i-1];
        end
    endgenerate

    assign SUM = P[0] ^ C;
endmodule