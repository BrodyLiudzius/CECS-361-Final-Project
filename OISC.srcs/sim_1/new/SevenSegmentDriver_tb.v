`timescale 1ns / 1ps

module SevenSegmentDriver_tb();

    // MODULE PORTS
    localparam NUM_ANODES = 8;
    localparam BIT_WIDTH = 16;
    localparam COMMON_ANODE_1 = 1;
    localparam COMMON_ANODE_2 = 0;

    reg reset, oscillator;
    reg [31:0] period;
    reg [BIT_WIDTH-1:0] binaryInput;

    wire [NUM_ANODES-1:0] anodeMask1, anodeMask2;
    wire [6:0] segments1, segments2;



    // MODULE INSTANTIATIONS
    SevenSegmentDriver #(
        .NUM_ANODES(NUM_ANODES),
        .BIT_WIDTH(BIT_WIDTH),
        .COMMON_ANODE(COMMON_ANODE_1)
    ) sevenSegmentDriverCA (
        .reset(reset),
        .oscillator(oscillator),
        .period(period),
        .binaryInput(binaryInput),
        .anodeMask(anodeMask1),
        .segments(segments1)
    );

    SevenSegmentDriver #(
        .NUM_ANODES(NUM_ANODES),
        .BIT_WIDTH(BIT_WIDTH),
        .COMMON_ANODE(COMMON_ANODE_2)
    ) sevenSegmentDriverCC (
        .reset(reset),
        .oscillator(oscillator),
        .period(period),
        .binaryInput(binaryInput),
        .anodeMask(anodeMask2),
        .segments(segments2)
    );



    // PROCEDURES
    always #5 oscillator = ~oscillator;

    initial begin
        reset = 1;
        oscillator = 0;
        period = 2;
        binaryInput = {BIT_WIDTH{1'b1}};
        #5;

        reset = 0;

        #320;

        $finish;
    end

endmodule
