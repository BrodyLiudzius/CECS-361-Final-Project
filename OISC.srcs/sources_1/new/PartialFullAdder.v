// tags: 

/* SUMMARY:
A modified full adder that instead outputs a sum, propagate, and generate signal.
It is intended for use in a carry lookahead adder
*/

module PartialFullAdder(
        input a,
        input b,
        input carryIn,
        output sum,
        output prop,
        output gen
    );

    assign {sum, prop, gen} = {a ^ b ^ carryIn, a | b, a & b};
    
endmodule
