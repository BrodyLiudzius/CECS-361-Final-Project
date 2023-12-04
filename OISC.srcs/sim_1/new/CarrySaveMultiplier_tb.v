// tags: #testbench

/* SUMMARY:
This is an exhaustive self-checking testbench for the Carry-Save Multiplier. A message will be printed
in the console if all tests passed. If some failed, this will also be printed as long as which input
pairs failed.
*/

`timescale 1ns / 1ps

module CarrySaveMultiplier_tb();

    // MODULE PORTS
    localparam BIT_WIDTH = 4;

    reg [BIT_WIDTH-1:0] a, b;
    wire [BIT_WIDTH*2-1:0] product;
    wire carryOut;



    // MODULE INSTANTIATIONS
    CarrySaveMultiplier #(
        .BIT_WIDTH(BIT_WIDTH)
    ) csm (
        .a(a),
        .b(b),
        .product(product),
        .carryOut(carryOut)
    );



    // PROCEDURES
    integer i, j;

    reg passed;
    reg [2*BIT_WIDTH:0] expected;

    initial begin
        passed = 1; // innocent until proven guilty

        for (i = 0; i < $pow(2,BIT_WIDTH); i = i + 1) begin
            a = i;
            for (j = 0; j < $pow(2,BIT_WIDTH); j = j + 1) begin
                b = j;
                #0.1;

                expected = i * j;

                if ({carryOut, product} !== expected) begin
                    $display("(", i, ", ", j, ") FAILED.");
                    passed = 0;
                end
            end
        end

        $display("----------------------");
        if (passed)
            $display("All tests passed");
        else
            $display("Tests FAILED");
        $display("---------------------");

        $finish;
    end

endmodule
