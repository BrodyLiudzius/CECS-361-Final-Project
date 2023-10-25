// This module is for testing the SevenSegment.v module
// It maps the ports of that module to the hardware on the NexysA7 for testing purposes
// The testbench has already been passed and this file is for verification that
// the module will actually correctly run the hardware on the NexysA7 board

module SevenSegmentWrapper(
        input [15:0] system_switch,
        input system_oscillator,

        output system_decimalPoint,
        output wire [0:6] system_segment,
        output wire [7:0] system_anode
    );

    reg [7:0] anode;

    assign system_decimalPoint = 1'b0;

    SevenSegmentDriver #(
        .BIT_WIDTH(16),
        .NUM_BCD_DIGITS(8),
        .COMMON_ANODE(1)
    ) sevenSegmentDriver (
        .oscillator(system_oscillator),
        .binary(system_switch),

        .sevenSegment(system_segment),
        .anodes(system_anode)
    );

endmodule
