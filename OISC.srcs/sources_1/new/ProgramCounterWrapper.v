
module ProgramCounterWrapper(
        input system_oscillator,
        input system_buttonCenter,

        output wire [15:0] system_led,
        output wire system_RGB0_Green
    );

    wire clock;
    wire [15:0] dataBus;
    wire [15:0] registerData;

    assign system_RGB0_Green = clock;
    assign system_led = registerData;

    ProgramCounter #(
        .DATA_BUS_WIDTH(16),
        .ADDR_BUS_WIDTH(8),
        .ADDRESS(1)
    ) uut (
        .reset(0),
        .clock(clock),
        .increment(1),
        .dataIn(0),
        .dataOut(dataBus),
        .registerData(registerData),
        .readAddressBus(0),
        .writeAddressBus(0)
    );

    ClockGenerator #(
        .CLOCK_COUNTER_WIDTH(32),
        .PERIOD(50_000_000)
    ) clockGenerator (
        .reset(0),
        .oscillator(system_oscillator),
        .enable(1),
        .clock(clock)
    );

endmodule
