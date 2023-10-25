`timescale 1ns / 1ps

module PartialFullAdder_tb();

    // MODULE PORTS
    reg a, b, carryIn;
    wire sum, prop, gen;

    

    // MODULE INSTANTIATIONS
    PartialFullAdder partialFullAdder (
        .a(a),
        .b(b),
        .carryIn(carryIn),
        .sum(sum),
        .prop(prop),
        .gen(gen)
    );



    // PROCEDURES
    integer i;
    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            {carryIn, a, b} = i;
            #5;
        end
        $finish;
    end

endmodule
