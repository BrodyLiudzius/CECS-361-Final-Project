
module SevenSegmentDriver #(
        parameter NUM_ANODES = 8,
        parameter BIT_WIDTH = 16,
        parameter COMMON_ANODE = 1,
        parameter CLOCK_PERIOD = 1_000
    ) (
        input reset,
        input oscillator,

        input [BIT_WIDTH-1:0] binaryInput,

        output wire [NUM_ANODES-1:0] anodeMask,
        output wire [6:0] segments
    );

    wire [6:0] segments_temp;
    wire [NUM_ANODES-1:0] anodeMask_temp;

    wire [$clog2(NUM_ANODES):0] index;
    wire [NUM_ANODES*4-1:0] BCD;

    BinaryToBCD #(
        .BIT_WIDTH(BIT_WIDTH),
        .NUM_BCD_DIGITS(NUM_ANODES)
    ) binToBCD (
        .binary(binaryInput),
        .BCD(BCD)
    );

    BCDToSevenSegment bcdToSevenSeg (
        .BCD(BCD[index*4 +: 4]),
        .sevenSegment(segments_temp)
    );

    SevenSegmentIndexer #(
        .NUM_ANODES(NUM_ANODES),
        .CLOCK_PERIOD(CLOCK_PERIOD)
    ) sevenSegmentIndexer (
        .reset(reset),
        .oscillator(oscillator),
        .anodeMask(anodeMask_temp),
        .index(index)
    );

    assign segments = (COMMON_ANODE) ? ~segments_temp : segments_temp;
    assign anodeMask = (COMMON_ANODE) ? ~anodeMask_temp : anodeMask_temp;

endmodule
