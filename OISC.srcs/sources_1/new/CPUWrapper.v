
module CPUWrapper(
        input system_oscillator,
        input system_buttonCenter,
        
        output system_decimalPoint,
        output system_RGB0_Green,
        output wire [0:6] system_segment,
        output wire [7:0] system_anode,
        output wire [15:0] system_led
    );

    wire [15:0] displayRegisterOut;

    assign system_decimalPoint = 1;

    CPU #(
        .DATA_BUS_WIDTH(16),
        .ADDR_BUS_WIDTH(8),
        .CLOCK_COUNTER_WIDTH(32),
        .REGISTER_FILE_SIZE(16),
        .NUM_WORDS_PROGRAM_MEMORY(32),
        .NUM_WORDS_DATA_MEMORY(32),
        .CLOCK_PERIOD(20_000_000)
    ) cpu (
        .oscillator(system_oscillator),
        .reset(system_buttonCenter),
        .clockEnable(1),
        .programCounterOut(system_led),
        .displayRegisterOut(displayRegisterOut)
    );

    SevenSegmentDriver #(
        .NUM_ANODES(8),
        .BIT_WIDTH(16),
        .COMMON_ANODE(1),
        .CLOCK_PERIOD(1_000)
    ) sevenSegmentDriver (
        .reset(system_buttonCenter),
        .oscillator(system_oscillator),
        .binaryInput(displayRegisterOut),
        .anodeMask(system_anode),
        .segments(system_segment)
    );

    ClockGenerator #(
        .CLOCK_COUNTER_WIDTH(32)
    ) clockGenerator (
        .reset(system_buttonCenter),
        .oscillator(system_oscillator),
        .enable(1),
        .clock(clock)
    );

endmodule
