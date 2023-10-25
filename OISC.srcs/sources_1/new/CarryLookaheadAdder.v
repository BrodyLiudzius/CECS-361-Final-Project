
module CarryLookaheadAdder #(
        parameter BIT_WIDTH = 4
    ) (
        input [BIT_WIDTH-1:0] a,
        input [BIT_WIDTH-1:0] b,
        input carryIn,

        output [BIT_WIDTH-1:0] sum,
        output carryOut
    );

    wire [BIT_WIDTH-1:0] propagates, generates;
    wire [BIT_WIDTH:0] carries;

    assign carries[0] = carryIn;
    assign carryOut = carries[BIT_WIDTH];

    genvar i;
    generate
        for (i = 0; i < BIT_WIDTH; i = i + 1) begin
            PartialFullAdder partialFullAdder (
                .a(a[i]),
                .b(b[i]),
                .carryIn(carries[i]),
                .sum(sum[i]),
                .prop(propagates[i]),
                .gen(generates[i])
            );

            assign carries[i+1] = generates[i] | (propagates[i] & carries[i]);
        end
    endgenerate

endmodule
