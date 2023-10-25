
module FullAdder(
        input a,
        input b,
        input carryIn,
        output carryOut,
        output sum
    );

    assign {carryOut, sum} = a + b + carryIn;

endmodule
