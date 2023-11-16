
module SevenSegmentIndexer #(
        parameter NUM_ANODES = 8
    ) (
        input reset,
        input oscillator,

        input [31:0] period,

        output reg [NUM_ANODES-1:0] anodeMask,
        output reg [$clog2(NUM_ANODES):0] index
    );

    wire clock;

    ClockGenerator #(
        .CLOCK_COUNTER_WIDTH(32)
    ) clockGenerator (
        .reset(reset),
        .oscillator(oscillator),
        .enable(1),
        .period(period),
        .clock(clock)
    );

    initial begin
        index = 0;
        anodeMask = 1;
    end

    always @ (posedge clock) begin
        if (!reset) begin
            index = (index >= (NUM_ANODES-1)) ? 0 : index + 1;
            anodeMask = 1 << index;
        end else begin
            index = 0;
            anodeMask = 1;
        end
    end

endmodule
