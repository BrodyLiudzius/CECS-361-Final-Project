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
    reg expected_sum;
    reg expected_carry;
    reg passed;

    initial begin
       passed = 1;

        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i;
            #5;
            expected_sum = a ^ b;  // XOR for sum
            expected_carry = a & b;

            if(expected_sum !== sum || expected_carry !== carryOut) begin
                $display("(", a, ", ", b, ") FAILED.");
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

    


