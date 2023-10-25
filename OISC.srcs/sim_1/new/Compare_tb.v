`timescale 1ns / 1ps

module Compare_tb();

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



    // MODULE INSTANTIATIONS
    Compare #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS_1(INPUT_ADDRESS_1),
        .INPUT_ADDRESS_2(INPUT_ADDRESS_2),
        .OUTPUT_ADDRESS(OUTPUT_ADDRESS)
    ) compare (
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
        readAddressBus = 1;

        writeAddressBus = 1;
        dataBusIn = 10;
        #10;

        writeAddressBus = 2;
        dataBusIn = 10;
        #10;

        writeAddressBus = 2;
        dataBusIn = {DATA_BUS_WIDTH{1'b1}};
        #10;

        writeAddressBus = 2;
        dataBusIn = 6;
        #10;

        $finish;

    end

endmodule
