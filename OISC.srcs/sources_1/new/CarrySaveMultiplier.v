// tags: #reference

/* SUMMARY:
Combinational multiplier derived from an array multiplier. Carry save multiplier saves all carries to the very last
row of the array. In this implementation, the last row of the array then uses a carry lookahead adder.
*/


/* REFERENCES:
- https://coertvonk.com/hw/building-math-circuits/faster-parameterized-multiplier-in-verilog-30774
*/

module CarrySaveMultiplier #(
        parameter BIT_WIDTH = 4
    ) (
        input [BIT_WIDTH-1:0] a,
        input [BIT_WIDTH-1:0] b,

        output wire [2*BIT_WIDTH-1:0] product,
        output wire carryOut
    );

    wire [BIT_WIDTH-1:0] productHigh, productLow;

    assign product = {productHigh, productLow};

    wire [BIT_WIDTH-1:0] sums [BIT_WIDTH-1:0];
    wire [BIT_WIDTH-1:0] carries [BIT_WIDTH-1:0];

    genvar i, j;

    generate
        // first row of the array
        for (i = 0; i < BIT_WIDTH; i = i + 1) begin
            MultiplierCell mc (.a(a[i]), .b(b[0]), .sumIn(0), .carryIn(0), .sumOut(sums[0][i]), .carryOut(carries[0][i]));
        end

        // rest of the array
        for (i = 1; i < BIT_WIDTH; i = i + 1) begin
            for (j = 0; j < BIT_WIDTH; j = j + 1) begin
                MultiplierCell mc (.a(a[j]), .b(b[i]), .sumIn((j == BIT_WIDTH) ? 0 : sums[i-1][j+1]), .carryIn(carries[i-1][j]), .sumOut(sums[i][j]), .carryOut(carries[i][j]));
            end
        end

        // attach lower half of answer to productLow
        for (i = 0; i < BIT_WIDTH; i = i + 1) begin
            assign productLow[i] = sums[i][0];
        end
    endgenerate

    // final addition of the carry-saved array outputs
    CarryLookaheadAdder #(.BIT_WIDTH(BIT_WIDTH)) cla (.a({0, sums[BIT_WIDTH-1][1 +: BIT_WIDTH-1]}), .b(carries[BIT_WIDTH-1]), .carryIn(0), .sum(productHigh), .carryOut(carryOut));

endmodule