// tags:

/* SUMMARY:
Multiplier Cell is meant to be used in array multiplier designs. It is a full adder
with an AND gate connected to one input--meaning it has four inputs total
*/


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
