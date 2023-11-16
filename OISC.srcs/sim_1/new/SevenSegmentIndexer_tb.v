`timescale 1ns / 1ps

module SevenSegmentIndexer_tb();

    // MODULE PORTS
    localparam NUM_ANODES = 14;

    reg reset, oscillator;
    reg [31:0] period;
    wire [NUM_ANODES-1:0] anodeMask;
    wire [$clog2(NUM_ANODES):0] index;



    // MODULE INSTANTIATIONS
    SevenSegmentIndexer #(
        .NUM_ANODES(NUM_ANODES)
    ) sevenSegIndexer (
        .reset(reset),
        .oscillator(oscillator),
        .period(period),
        .anodeMask(anodeMask),
        .index(index)
    );



    // PROCEDURES
    always #5 oscillator = ~oscillator;

    initial begin
        reset = 1;
        period = 2;
        oscillator = 0;
        #2;

        reset = 0;
        #300;

        $finish;
    end

endmodule
