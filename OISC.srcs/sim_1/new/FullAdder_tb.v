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
    reg expected_sum;
    reg expected_carry;
    reg passed;

    initial begin
        passed = 1;
        
        for (i = 0; i < 8; i = i + 1) begin
            {carryIn, a, b} = i;
            #5;

            {expected_carry, expected_sum} = a + b + carryIn;

            if(expected_sum !== sum || expected_carry !== carryOut) begin
                $display("(", a, ", ", b, carryIn,") FAILED.");
                passed = 0;
            end
        end

        $display("----------------------");
        if (passed)
            $display("All tests passed");
        else
            $display("Tests FAILED");
        $display("----------------------");
        
        $finish;
    end
endmodule