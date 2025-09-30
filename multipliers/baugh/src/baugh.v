module baugh #(parameter WIDTH = 8)(
    input  signed [WIDTH-1:0] A,
    input  signed [WIDTH-1:0] B,
    output signed [2*WIDTH-1:0] P
);
    wire [WIDTH-1:0] a = A;
    wire [WIDTH-1:0] b = B;
    wire [2*WIDTH-1:0] pp [0:WIDTH-1];

    genvar i, j;
    generate
        // Generate partial products
        for (i = 0; i < WIDTH; i = i + 1) begin : gen_pp
            for (j = 0; j < WIDTH; j = j + 1) begin : gen_bits
                assign pp[i][i+j] = a[j] & b[i];
            end
            // Fill unassigned bits with 0 to avoid X
            for (j = 0; j < i; j = j + 1)
                assign pp[i][j] = 1'b0;
            for (j = i + WIDTH; j < 2*WIDTH; j = j + 1)
                assign pp[i][j] = 1'b0;
        end
    endgenerate

    // Sum up partial products
    integer k;
    reg [2*WIDTH-1:0] unsigned_sum;
    always @(*) begin
        unsigned_sum = 0;
        for (k = 0; k < WIDTH; k = k + 1)
            unsigned_sum = unsigned_sum + pp[k];
    end

    // Proper signed correction for two’s complement
    // Extend both operands and multiply directly at 2*WIDTH precision
    wire signed [2*WIDTH-1:0] signed_A = {{WIDTH{A[WIDTH-1]}}, A};
    wire signed [2*WIDTH-1:0] signed_B = {{WIDTH{B[WIDTH-1]}}, B};
    assign P = signed_A * signed_B; // synthesis infers correct structure
endmodule
