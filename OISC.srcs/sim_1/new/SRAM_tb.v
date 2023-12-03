`timescale 1ns / 1ps

module SRAM_tb();

    // MODULE PORTS
    localparam DATA_BUS_WIDTH = 16;
    localparam NUM_WORDS = 16;

    reg reset, write, programmerWrite;

    reg [DATA_BUS_WIDTH-1:0] address;

    reg [DATA_BUS_WIDTH-1:0] dataIn;
    wire [DATA_BUS_WIDTH-1:0] dataOut;

    reg [DATA_BUS_WIDTH-1:0] programmerAddress;
    reg [DATA_BUS_WIDTH-1:0] programmerData;



    // MODULE INSTANTIATIONS
    SRAM #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .NUM_WORDS(NUM_WORDS)
    ) uut (
        .reset(reset),
        .write(write),
        .address(address),
        .dataIn(dataIn),
        .dataOut(dataOut),
        .programmerWrite(programmerWrite),
        .programmerAddress(programmerAddress),
        .programmerData(programmerData)
    );



    // PROCEDURES
    integer i;
    initial begin
        write = 0;
        programmerWrite = 0;
        programmerData = 0;
        programmerAddress = 0;
        address = 0;
        reset = 1;
        #5;
        reset = 0;
        #5;

        for (i = 0; i < NUM_WORDS; i = i + 1) begin
            address = i;
            #10;
        end

        for (i = 0; i < NUM_WORDS; i = i + 1) begin
            address = i;
            dataIn = i;
            write = 1;
            #5;
            write = 0;
            #5;
        end

        for (i = 0; i < NUM_WORDS; i = i + 1) begin
            programmerAddress = i;
            programmerData = i * 10;
            programmerWrite = 1;
            #5;
            programmerWrite = 0;
            #5;
        end

        for (i = 0; i < NUM_WORDS; i = i + 1) begin
            address = i;
            #10;
        end

        $finish;
    end

endmodule
