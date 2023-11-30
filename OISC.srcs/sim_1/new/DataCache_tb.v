`timescale 1ns / 1ps

module DataCache_tb();

    // MODULE PORTS
    localparam DATA_BUS_WIDTH = 16;
    localparam ADDR_BUS_WIDTH = 8;
    localparam HEX_FILE = "./hexTest.mem";
    parameter NUM_WORDS = 16;
    localparam MBR_ADDRESS = 1;
    localparam MAR_ADDRESS = 2;

    reg reset, clock;
    reg [DATA_BUS_WIDTH-1:0] dataIn;
    wire [DATA_BUS_WIDTH-1:0] dataOut;
    reg [ADDR_BUS_WIDTH-1:0] readAddressBus, writeAddressBus;



    // MODULE INSTANTIATIONS
    DataCache #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .HEX_FILE(HEX_FILE),
        .NUM_WORDS(NUM_WORDS),
        .MBR_ADDRESS(MBR_ADDRESS),
        .MAR_ADDRESS(MAR_ADDRESS)
    ) dataCache (
        .reset(reset),
        .clock(clock),
        .dataIn(dataIn),
        .dataOut(dataOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );



    // PROCEDURES
    always #5 clock = ~clock;

    integer i;
    initial begin
        clock = 0;
        dataIn = 0;
        writeAddressBus = 0;
        readAddressBus = 1;

        reset = 1;
        #8;

        reset = 0;
        #2;

        writeAddressBus = 2;
        for (i = 0; i < NUM_WORDS; i = i + 1) begin
            dataIn = i;
            #10;
        end
        writeAddressBus = 0;

        for (i = 0; i < NUM_WORDS; i = i + 1) begin
            writeAddressBus = 2;
            dataIn = i;
            #10;

            writeAddressBus = 1;
            dataIn = i * 10;
            #10;
        end

        writeAddressBus = 2;
        for (i = 0; i < NUM_WORDS; i = i + 1) begin
            dataIn = i;
            #10;
        end
        writeAddressBus = 0;

        $finish;
    end


endmodule
