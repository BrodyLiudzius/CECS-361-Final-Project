// tags:

module HalfAdder (
        input a,
        input b,
        output carryOut,
        output sum
    );

    assign {carryOut, sum} = a + b;

endmodule