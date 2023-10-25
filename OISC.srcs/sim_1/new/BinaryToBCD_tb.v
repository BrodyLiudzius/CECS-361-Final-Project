`timescale 1ns / 1ps

module BinaryToBCD_tb();

    // MODULE PORTS
    localparam BIT_WIDTH = 16;
    localparam NUM_BCD_DIGITS = 8;

    reg [BIT_WIDTH-1:0] binary;
    wire [NUM_BCD_DIGITS*4-1:0] BCD;



    // MODULE INSTANTIATIONS
    BinaryToBCD #(
        .BIT_WIDTH(BIT_WIDTH),
        .NUM_BCD_DIGITS(NUM_BCD_DIGITS)
    ) btBCD (
        .binary(binary),
        .BCD(BCD)
    );



    // PROCEDURES
    initial begin
        binary = 0;
        #5;

        binary = 25;
        #5;

        binary = 989;
        #5;

        binary = {BIT_WIDTH{1'b1}};
        #5;

        $finish;
    end

endmodule
