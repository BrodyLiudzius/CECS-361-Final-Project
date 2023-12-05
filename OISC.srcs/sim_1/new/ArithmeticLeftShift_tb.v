`timescale 1ns / 1ps

module ArithmeticLeftShift_tb();

    // MODULE PORTS
    localparam DATA_BUS_WIDTH = 16;
    localparam ADDR_BUS_WIDTH = 8;
    localparam INPUT_ADDRESS = 2;
    localparam OUTPUT_ADDRESS = 2;

    reg reset,clock;
    reg [DATA_BUS_WIDTH-1:0] dataBusIn;
    wire [DATA_BUS_WIDTH-1:0] dataBusOut;
    reg [DATA_BUS_WIDTH-1:0] writeAddressBus,readAddressBus;
    


    // MODULE INSTANTIATIONS
    ArithmeticLeftShift #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS(INPUT_ADDRESS),
        .OUTPUT_ADDRESS(OUTPUT_ADDRESS)
    ) arithmeticLeftShift (
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
    integer i; 

    reg [DATA_BUS_WIDTH-1:0] expected; 

    initial begin
        passed = 1;
        reset = 1; 
        clock = 0;
        #10; // reset signal is registered to module
        reset = 0; // then low to begin normal operation
        readAddressBus = OUTPUT_ADDRESS;
        for (i = 0; i < $pow(2, DATA_BUS_WIDTH); i = i+1) begin
            writeAddressBus = INPUT_ADDRESS;
            dataBusIn = i;
            #10;
            expected = i;

            expected = $signed(expected) <<< 1;

            if (dataBusOut != expected)begin
                $display("(", i, ", ) FAILED.");
                passed = 0;
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
