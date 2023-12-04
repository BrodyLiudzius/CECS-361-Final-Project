// tags: #testbench

/* SUMMARY:
This is an exhaustive self-checking testbench for the Multiplier function unit. A message will be printed
in the console if all tests passed. If some failed, this will also be printed as long as which input
pairs failed.
*/

`timescale 1ns / 1ps

module Multiplier_tb();

    // MODULE PORTS
    localparam DATA_BUS_WIDTH = 4;
    localparam ADDR_BUS_WIDTH = 2;
    localparam INPUT_ADDRESS_1 = 1;
    localparam INPUT_ADDRESS_2 = 2;
    localparam OUTPUT_ADDRESS_1 = 1;
    localparam OUTPUT_ADDRESS_2 = 2;

    reg reset, clock;
    reg [DATA_BUS_WIDTH-1:0] dataBusIn;
    wire [DATA_BUS_WIDTH-1:0] dataBusOut;
    reg [ADDR_BUS_WIDTH-1:0] readAddressBus, writeAddressBus; 



    // MODULE INSTANTIATIONS
    Multiplier #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS_1(INPUT_ADDRESS_1),
        .INPUT_ADDRESS_2(INPUT_ADDRESS_2),
        .OUTPUT_ADDRESS_1(OUTPUT_ADDRESS_1),
        .OUTPUT_ADDRESS_2(OUTPUT_ADDRESS_2)
    ) adder (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );



    // PROCEDURES
    always #5 clock = ~clock;

    reg passed;
    integer i, j;

    reg [2*DATA_BUS_WIDTH-1:0] expected;
    reg [DATA_BUS_WIDTH-1:0] productLow, productHigh;

    initial begin
        readAddressBus = 0;
        passed = 1;
        reset = 1; 
        clock = 0;
        #10;

        reset = 0;

        for (i = 0; i < $pow(2,DATA_BUS_WIDTH); i = i+1) begin
            writeAddressBus = INPUT_ADDRESS_1;
            dataBusIn = i;
            #10;

            for (j = 0; j < $pow(2,DATA_BUS_WIDTH); j = j+1) begin 
                writeAddressBus = INPUT_ADDRESS_2;
                dataBusIn = j;
                readAddressBus = OUTPUT_ADDRESS_1;
                #10;

                productLow = dataBusOut;

                readAddressBus = OUTPUT_ADDRESS_2;
                #10;

                productHigh = dataBusOut;

                expected = i * j;

                if ({productHigh, productLow} !== expected)begin
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
