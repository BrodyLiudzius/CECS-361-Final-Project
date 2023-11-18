// This file is for testbench use ONLY
// tags: #testbench #unsynthesizable

/* SUMMARY:
This module has a single output `passed` which starts as true.
If the inputs `a` and `b` at any point are not equal, then passed
will become false and stay false until a reset occurs
*/

module PassEvaluator #(
        parameter BIT_WIDTH = 16
    ) (
        input reset,
        input [BIT_WIDTH-1:0] a,
        input [BIT_WIDTH-1:0] b,
        output reg passed
    );

    initial passed = 1;

    always @ (reset) passed = 1;

    always @ (a or b)
        if (a !== b)
            passed = 0;

endmodule
