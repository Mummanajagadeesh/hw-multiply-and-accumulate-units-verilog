module mbe (
    input  signed [7:0] A,  // Multiplicand
    input  signed [7:0] B,  // Multiplier
    output reg signed [15:0] P  // Product
);
    reg signed [15:0] partial_product;
    reg signed [15:0] multiplicand;
    reg signed [15:0] result;
    reg [2:0] booth_code;
    integer i;

    always @(*) begin
        result = 0;
        multiplicand = {{8{A[7]}}, A};  // Sign-extend A to 16 bits
        partial_product = 0;

        for (i = 0; i < 8; i = i + 2) begin
            booth_code = {B[i+1], B[i], (i==0 ? 1'b0 : B[i-1])};

            case (booth_code)
                3'b001, 3'b010: partial_product = multiplicand << i;
                3'b011:         partial_product = multiplicand << (i + 1);
                3'b100:         partial_product = -(multiplicand << (i + 1));
                3'b101, 3'b110: partial_product = -(multiplicand << i);
                default:        partial_product = 0;
            endcase

            result = result + partial_product;
        end

        P = result;
    end
endmodule
