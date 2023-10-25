`timescale 1ns / 1ps

module OutputGate_tb();

    // MODULE PORTS
    localparam ADDR_BUS_WIDTH = 8;
    localparam DATA_BUS_WIDTH = 16;
    localparam ADDRESS = 10;

    reg [15:0] addressIn, dataIn;
    wire [15:0] dataOut;



    // MODULE INSTANTIATIONS
    OutputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDRESS(ADDRESS)
    ) uut (
        .addressIn(addressIn),
        .dataIn(dataIn),
        .dataOut(dataOut)
    );



    // PROCEDURES
    initial begin
        dataIn = 16'b1010101010101010;
        addressIn = 5;
        #10;

        addressIn = 10;
        #10;

        addressIn = 0;
        #10;

        addressIn = {ADDR_BUS_WIDTH{1'bz}};
        #10;

        $finish;
    end

endmodule
