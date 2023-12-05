// tags:

/* SUMMARY:
This is a single cell meant to be used in array dividers. It is also known as
a Conditional Adder Subtractor (CAS)
*/

module DividerCell (
        input a, // dividend
        input b, //divisor
        input carryIn,
        input previous,

        output wire carryOut,
        output wire sum
    );

    FullAdder fullAdder (
        .a(a),
        .b(b ^ previous),
        .carryIn(carryIn),
        .carryOut(carryOut),
        .sum(sum)
    );

endmodule