`timescale 1ns / 1ps

module SRAM_tb();

    // MODULE PORTS
    localparam DATA_BUS_WIDTH = 16;
    localparam NUM_WORDS = 16;

    reg reset;

    reg [DATA_BUS_WIDTH-1:0] address;

    reg [DATA_BUS_WIDTH-1:0] dataIn;
    wire [DATA_BUS_WIDTH-1:0] dataOut;



    // MODULE INSTANTIATIONS
    SRAM #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .NUM_WORDS(NUM_WORDS),
        .HEX_FILE("./hexTest.mem")
    ) uut (
        .reset(reset),
        .address(address),
        .dataIn(dataIn),
        .dataOut(dataOut)
    );



    // PROCEDURES
    integer i;
    initial begin
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
            dataIn = i * 10;
            #10;
        end

        for (i = 0; i < NUM_WORDS; i = i + 1) begin
            address = i;
            #10;
        end

        $finish;
    end

endmodule
