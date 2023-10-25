
module MultiplierCell(
        input a,
        input b,
        input sumIn,
        input carryIn,

        output sumOut,
        output carryOut
    );


    FullAdder fullAdder (
        .a(sumIn),
        .b(a & b),
        .carryIn(carryIn),
        .carryOut(carryOut),
        .sum(sumOut)
    );

endmodule
