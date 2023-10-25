`timescale 1ns / 1ps

module HalfAdder_tb ();

    // MODULE PORTS
    reg a, b;
    wire carryOut, sum;



    // MODULE INSTANTIATIONS
    HalfAdder halfAdder (
        .a(a),
        .b(b),
        .carryOut(carryOut),
        .sum(sum)
    );


    
    // PROCEDURES
    integer i;
    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i;
            #5;
        end
        $finish;
    end

endmodule