// tags: 

/* SUMMARY:
The Control Unit module simply links together submodules to create the full functionality of
a control unit
*/


module ControlUnit #(
        parameter DATA_BUS_WIDTH = 16,
        parameter ADDR_BUS_WIDTH = 8,

        parameter CLOCK_COUNTER_WIDTH = 32,

        parameter PROGRAM_COUNTER_ADDRESS = 1,

        parameter CLOCK_PERIOD = 100_000_000
    ) (
        input reset,

        input oscillator,
        input clockEnable,
        output wire clock,

        input [DATA_BUS_WIDTH-1:0] instructionRegisterInput,
        output wire [DATA_BUS_WIDTH-1:0] programCounterOut,

        input [DATA_BUS_WIDTH-1:0] dataBusIn,
        input [DATA_BUS_WIDTH-1:0] dataBusOut,

        input [ADDR_BUS_WIDTH-1:0] readAddressBusIn,
        output wire [ADDR_BUS_WIDTH-1:0] readAddressBusOut,

        input [ADDR_BUS_WIDTH-1:0] writeAddressBusIn,
        output wire [ADDR_BUS_WIDTH-1:0] writeAddressBusOut
    );

    wire instructionRegisterEnable, programCounterIncrement;

    ClockGenerator #(
        .CLOCK_COUNTER_WIDTH(CLOCK_COUNTER_WIDTH),
        .PERIOD(CLOCK_PERIOD)
    ) clockGenerator (
        .reset(reset),
        .oscillator(oscillator),
        .enable(clockEnable),
        .clock(clock)
    );

    Sequencer sequencer (
        .reset(reset),
        .clock(clock),
        .instructionRegisterEnable(instructionRegisterEnable),
        .programCounterIncrement(programCounterIncrement)
    );

    ProgramCounter #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDRESS(PROGRAM_COUNTER_ADDRESS)
    ) programCounter (
        .reset(reset),
        .clock(clock),
        .increment(programCounterIncrement),
        .dataIn(dataBusIn),
        .dataOut(dataBusOut),
        .registerData(programCounterOut),
        .readAddressBus(readAddressBusIn),
        .writeAddressBus(writeAddressBusIn)
    );

    InstructionRegister #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH)
    ) instructionRegister (
        .reset(reset),
        .clock(clock),
        .outputEnable(instructionRegisterEnable),
        .dataIn(instructionRegisterInput),
        .dataOut({readAddressBusOut, writeAddressBusOut})
    );


endmodule
