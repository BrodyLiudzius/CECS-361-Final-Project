`timescale 1ns / 1ps

module ArithmeticRightShift_tb();

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
    ArithmeticRightShift #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS(INPUT_ADDRESS),
        .OUTPUT_ADDRESS(OUTPUT_ADDRESS)
    ) arithmeticRightShift (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );
    


    // PROCEDURES
    always #5 clock = ~clock;

    initial begin
        reset = 0;
        clock = 0;
        readAddressBus = 2;

        writeAddressBus = 2;
        dataBusIn = 10;
        #10;

        writeAddressBus = 2;
        dataBusIn = {DATA_BUS_WIDTH{1'b1}};
        #10;

        $finish;

    end

endmodule
