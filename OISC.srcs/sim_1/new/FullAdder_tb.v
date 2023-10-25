`timescale 1ns / 1ps

module FullAdder_tb();

    // MODULE PORTS
    reg a, b, carryIn;
    wire carryOut, sum;



    // MODULE INSTANTIATIONS
    FullAdder fullAdder (
        .a(a),
        .b(b),
        .carryIn(carryIn),
        .carryOut(carryOut),
        .sum(sum)
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
