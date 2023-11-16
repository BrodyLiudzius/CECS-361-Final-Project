// This module is for testing the SevenSegment.v module
// It maps the ports of that module to the hardware on the NexysA7 for testing purposes
// The testbench has already been passed and this file is for verification that
// the module will actually correctly run the hardware on the NexysA7 board

module SevenSegmentWrapper(
        input [15:0] system_switch,
        input system_oscillator,
        input system_buttonCenter,

        output system_decimalPoint,
        output wire [0:6] system_segment,
        output wire [7:0] system_anode,
        output wire [15:0] system_led
    );

    assign system_decimalPoint = 1;

    wire clock;

    SevenSegmentDriver #(
        .NUM_ANODES(8),
        .BIT_WIDTH(16),
        .COMMON_ANODE(1)
    ) sevenSegmentDriver (
        .reset(system_buttonCenter),
        .oscillator(system_oscillator),
        .period(100_000),
        .binaryInput(system_switch),
        .anodeMask(system_anode),
        .segments(system_segment)
    );

    ClockGenerator #(
        .CLOCK_COUNTER_WIDTH(32)
    ) clockGenerator (
        .reset(system_buttonCenter),
        .oscillator(system_oscillator),
        .enable(1),
        .period(10),
        .clock(clock)
    );

    assign system_led = {13'b0000000000001, clock, 1'b1, system_oscillator};

endmodule
