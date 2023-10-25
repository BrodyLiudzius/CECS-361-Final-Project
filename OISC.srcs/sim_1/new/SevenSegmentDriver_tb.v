`timescale 1ns / 1ps

module SevenSegmentDriver_tb();

    // MODULE PORTS
    localparam BIT_WIDTH = 16;
    localparam NUM_BCD_DIGITS = 8;
    localparam COMMON_ANODE_1 = 1;
    localparam COMMON_ANODE_2 = 0;

    reg clock;
    reg [BIT_WIDTH-1:0] binary;

    wire [6:0] sevenSegment1, sevenSegment2;
    wire [NUM_BCD_DIGITS-1:0] anodes1, anodes2;



    // MODULE INSTANTIATIONS
    SevenSegmentDriver #(
        .BIT_WIDTH(BIT_WIDTH),
        .NUM_BCD_DIGITS(NUM_BCD_DIGITS),
        .COMMON_ANODE(COMMON_ANODE_1)
    ) sevenSegmentDriverCA (
        .oscillator(clock),
        .binary(binary),

        .sevenSegment(sevenSegment1),
        .anodes(anodes1)
    );

    SevenSegmentDriver #(
        .BIT_WIDTH(BIT_WIDTH),
        .NUM_BCD_DIGITS(NUM_BCD_DIGITS),
        .COMMON_ANODE(COMMON_ANODE_2)
    ) sevenSegmentDriverCC (
        .oscillator(clock),
        .binary(binary),

        .sevenSegment(sevenSegment2),
        .anodes(anodes2)
    );



    // PROCEDURES
    always #5 clock = ~clock;

    initial begin
        clock = 0;
        binary = {BIT_WIDTH{1'b1}};

        #160;

        $finish;

    end

endmodule
