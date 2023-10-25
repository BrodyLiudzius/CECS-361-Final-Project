`timescale 1ns / 1ps

module InstructionRegister_tb();

    // MODULE PORTS
    localparam DATA_BUS_WIDTH = 16;

    reg reset, clock, outputEnable;

    reg [DATA_BUS_WIDTH-1:0] dataIn;
    wire [DATA_BUS_WIDTH-1:0] dataOut;



    // MODULE INSTANTIATIONS
    InstructionRegsiter #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH)
    ) uut (
        .reset(reset),
        .clock(clock),
        .outputEnable(outputEnable),
        .dataIn(dataIn),
        .dataOut(dataOut)
    );



    // PROCEDURES
    always #5 clock = ~clock;

    initial begin
        reset = 0;
        clock = 0;
        outputEnable = 0;
        dataIn = {DATA_BUS_WIDTH/2{2'b10}};
        #10;

        outputEnable = 1;
        #10

        reset = 1;
        #5;

        reset = 0;
        #5;

        outputEnable = 0;
        #10;

        $finish;
    end

endmodule
