`timescale 1ns / 1ps

module InputGate_tb();
    
    // MODULE PORTS
    localparam ADDR_BUS_WIDTH = 8;
    localparam ADDRESS = 10;

    reg [15:0] addressIn;
    wire writeEnable;



    // MODULE INSTANTIATIONS
    InputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .ADDRESS(ADDRESS)
    ) uut (
        .addressIn(addressIn),
        .writeEnable(writeEnable)
    );



    // PROCEDURES
    initial begin
        addressIn = 5;
        #10;

        addressIn = 10;
        #10;

        addressIn = 0;
        #10;

        $finish;
    end

endmodule
