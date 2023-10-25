`timescale 1ns / 1ps

module RegisterFile_tb();

    // MODULE PORTS
    localparam ADDR_BUS_WIDTH = 8;
    localparam DATA_BUS_WIDTH = 16;
    localparam NUM_REGISTERS = 16;
    localparam BASE_ADDRESS = 16;

    reg reset, clock;

    reg [DATA_BUS_WIDTH-1:0] dataIn;
    wire [DATA_BUS_WIDTH-1:0] dataOut;

    reg [ADDR_BUS_WIDTH-1:0] readAddressBus, writeAddressBus;



    // MODULE INSTANTIATIONS
    RegisterFile #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .NUM_REGISTERS(NUM_REGISTERS),
        .BASE_ADDRESS(BASE_ADDRESS)
    ) uut (
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
        reset = 0;
        clock = 0;
        dataIn = 0;
        readAddressBus = 0;
        writeAddressBus = 0;

        for (i = 0; i < NUM_REGISTERS; i = i + 1) begin
            writeAddressBus = BASE_ADDRESS + i;
            dataIn = i;
            #10;
        end
        writeAddressBus = 0;
        dataIn = 0;

        for (i = 0; i < NUM_REGISTERS; i = i + 1) begin
            readAddressBus = BASE_ADDRESS + i;
            #10;
        end

        reset = 1;
        #10;
        reset = 0;

        for (i = 0; i < NUM_REGISTERS; i = i + 1) begin
            readAddressBus = BASE_ADDRESS + i;
            #10;
        end

        $finish;
    end

endmodule
