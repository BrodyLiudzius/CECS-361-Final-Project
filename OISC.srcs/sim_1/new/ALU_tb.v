`timescale 1ns/ 1ps

module ALU_tb ();

    // MODULE PORTS
    localparam DATA_BUS_WIDTH = 16;
    localparam ADDR_BUS_WIDTH = 8;
    localparam BASE_ADDRESS = 0;

    reg reset, clock;
    reg [DATA_BUS_WIDTH-1:0] dataBusIn;
    wire [DATA_BUS_WIDTH-1:0] dataBusOut;
    reg [ADDR_BUS_WIDTH-1:0] readAddressBus, writeAddressBus;

    

    // MODULE INSTANTIATIONS
    ALU #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .BASE_ADDRESS(BASE_ADDRESS)
    ) alu (
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
        reset = 1;
        clock = 0;
        #1;
        reset = 0;

        readAddressBus = BASE_ADDRESS + 34;

        writeAddressBus = BASE_ADDRESS + 34;
        dataBusIn = 14;
        #10;

        writeAddressBus = BASE_ADDRESS + 35;
        dataBusIn = 3;
        #10;

        $finish;
    end


endmodule