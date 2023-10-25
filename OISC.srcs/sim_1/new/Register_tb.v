`timescale 1ns / 1ps

module Register_tb();
    
    // MODULE PORTS
    localparam DATA_BUS_WIDTH = 16;

    reg reset, clock, writeEnable;
    reg [15:0] dataIn;
    wire [15:0] dataOut;



    // MODULE INSTANTIATIONS
    Register #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH)
    ) uut (
        .reset(reset),
        .clock(clock),
        .writeEnable(writeEnable),
        .dataIn(dataIn),
        .dataOut(dataOut)
    );



    // PROCEDURES
    always #5 clock = ~clock;

    initial begin
        reset = 0;
        clock = 0;
        writeEnable = 0;
        dataIn = 16'b1010101010101010;
        #10;

        writeEnable = 1;
        #10;

        writeEnable = 0;
        dataIn = 0;
        #10;

        reset = 1;
        #10;

        reset = 0;
        #10

        $finish;
    end

endmodule
