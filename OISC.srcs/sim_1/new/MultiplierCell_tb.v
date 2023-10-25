`timescale 1ns / 1ps

module MultiplierCell_tb();

    // MODULE PORTS
    reg a, b, sumIn, carryIn;
    wire sumOut, carryOut;



    // MODULE INSTANTIATIONS
    MultiplierCell multCell (
        .a(a),
        .b(b),
        .sumIn(sumIn),
        .carryIn(carryIn),

        .sumOut(sumOut),
        .carryOut(carryOut)
    );



    // PROCEDURES
    integer i;
    initial begin
        for ( i = 0; i < 16; i = i + 1) begin
            {carryIn, sumIn, a, b} = i;
            #5;
        end
        $finish;
    end

endmodule
