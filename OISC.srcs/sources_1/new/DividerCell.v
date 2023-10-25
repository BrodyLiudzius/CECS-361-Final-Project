
module DividerCell (
        input a,
        input b,
        input carryIn,
        input previous,

        output carryOut,
        output diffOut
    );

    FullAdder fullAdder (
        .a(a),
        .b(b ^ previous),
        .carryIn(carryIn),
        .carryOut(carryOut),
        .sum(diffOut)
    );

endmodule