`timescale 1ns / 1ps

module DividerCell_tb();

    // MODULE PORTS
    reg a, b, carryIn, previous;
    wire carryOut, diffOut;



    // MODULE INSTANTIATIONS
    DividerCell divCell (
        .a(a),
        .b(b),
        .carryIn(carryIn),
        .previous(previous),
        .carryOut(carryOut),
        .diffOut(diffOut)
    );



    // PROCEDURES
    integer i;
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            {carryIn, previous, a, b} = i;
            #5;
        end
        $finish;
    end

endmodule
