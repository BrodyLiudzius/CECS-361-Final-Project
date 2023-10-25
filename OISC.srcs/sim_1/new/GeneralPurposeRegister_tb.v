`timescale 1ns / 1ps

module GeneralPurposeRegister_tb();

    // MODULE PORTS
    localparam ADDR_BUS_WIDTH = 8;
    localparam DATA_BUS_WIDTH = 16;
    localparam ADDRESS = 10;

    reg reset, clock;
    reg [ADDR_BUS_WIDTH-1:0] readAddress, writeAddress;
    reg [DATA_BUS_WIDTH-1:0] dataIn;
    wire [DATA_BUS_WIDTH-1:0] dataOut;



    // MODULE INSTANTIATIONS
    GeneralPurposeRegister #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDRESS(ADDRESS)
    ) uut (
        .reset(reset),
        .clock(clock),
        .dataIn(dataIn),
        .dataOut(dataOut),
        .readAddressBus(readAddress),
        .writeAddressBus(writeAddress)
    );



    // PROCEDURES
    always #5 clock = ~clock;

    initial begin
        reset = 0;
        clock = 0;
        dataIn = {DATA_BUS_WIDTH/2{2'b10}};
        readAddress = 0;
        writeAddress = 0;
        #20;

        readAddress = 10;
        #10;

        writeAddress = 10;
        #10;

        writeAddress = 0;
        #10;

        reset = 1;
        #5;

        reset = 0;
        #10

        readAddress = 0;
        #15;

        $finish;
    end

endmodule
