// tags: 

/* SUMMARY:
This module is a wrapper for SevenSegmentDriver and acts as an interface between
it and the ports in the constraint file. It was used to help test the seven segment
driver and to troubleshoot issues with synthesizing it to the fpga board
*/

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
        .period(5_000),
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
