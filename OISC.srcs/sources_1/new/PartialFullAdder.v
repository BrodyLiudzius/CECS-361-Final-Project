
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
