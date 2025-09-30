module booth #(parameter WIDTH = 8)(
    input  signed [WIDTH-1:0] multiplicand,
    input  signed [WIDTH-1:0] multiplier,
    output signed [2*WIDTH-1:0] product
);
    reg signed [2*WIDTH:0] prod;
    reg signed [WIDTH-1:0] mcand;
    reg signed [WIDTH:0] mplier;
    integer i;

    always @(*) begin
        mcand = multiplicand;
        mplier = {multiplier, 1'b0};
        prod = { {(2*WIDTH+1){1'b0}} };

        for (i = 0; i < WIDTH; i = i + 1) begin
            case (mplier[1:0])
                2'b01: prod = prod + (mcand <<< i);
                2'b10: prod = prod - (mcand <<< i);
                default: ;
            endcase
            mplier = mplier >>> 1;
        end
    end

    assign product = prod[2*WIDTH-1:0];
endmodule