`timescale 1ns / 1ps

module Adder_tb();

    // MODULE PORTS
    localparam DATA_BUS_WIDTH = 16;
    localparam ADDR_BUS_WIDTH = 8;
    localparam INPUT_ADDRESS_1 = 1;
    localparam INPUT_ADDRESS_2 = 2;
    localparam OUTPUT_ADDRESS = 1;

    reg reset, clock;
    reg [DATA_BUS_WIDTH-1:0] dataBusIn;
    wire [DATA_BUS_WIDTH-1:0] dataBusOut;
    reg [ADDR_BUS_WIDTH-1:0] readAddressBus, writeAddressBus;

    reg passed;
    



    // MODULE INSTANTIATIONS
    Adder #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS_1(INPUT_ADDRESS_1),
        .INPUT_ADDRESS_2(INPUT_ADDRESS_2),
        .OUTPUT_ADDRESS(OUTPUT_ADDRESS)
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


    integer i,j;
    initial begin
        passed = 1;
        reset = 1; 
        clock = 0;
        #10; // reset signal is registered to module
        reset = 0; // then low to begin normal operation
        readAddressBus = OUTPUT_ADDRESS;
        for (i = 0; i < $pow(2,DATA_BUS_WIDTH); i = i+1) begin
            writeAddressBus = INPUT_ADDRESS_1;
            dataBusIn = i;
            #10;
            for (j = 0; j < $pow(2,DATA_BUS_WIDTH); j = j+1) begin 
                writeAddressBus = INPUT_ADDRESS_2;
                dataBusIn = j;
                #10;

                if (dataBusOut != i + j)begin
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
