// tags: #toDo

// toDo: The addresses should be moved to a header file and included

module CPU #(
        parameter DATA_BUS_WIDTH = 16,
        parameter ADDR_BUS_WIDTH = 8,

        parameter CLOCK_COUNTER_WIDTH = 32
    )(
        input oscillator,
        input reset,
        input clockEnable,

        input [CLOCK_COUNTER_WIDTH-1:0] clockPeriod,

        output [DATA_BUS_WIDTH-1:0] programCounterOut,
        output [DATA_BUS_WIDTH-1:0] displayRegister
    );

    wire clock;
    wire [DATA_BUS_WIDTH-1:0] dataBus;
    wire [ADDR_BUS_WIDTH-1:0] addressBus;

    ALU #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .BASE_ADDRESS(64)
    ) alu (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBus),
        .dataBusOut(dataBus),
        .readAddressBus(addressBus),
        .writeAddressBus(addressBus)
    );

    ControlUnit #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .CLOCK_COUNTER_WIDTH(32),
        .PROGRAM_COUNTER_ADDRESS(1)
    ) controlUnit (
        .oscillator(oscillator),
        .clockEnable(clockEnable),
        .clockPeriod(clockPeriod),
        .clock(clock),

        .instructionRegisterInput(), ///////////
        .programCounterOut(), //////////////////

        .dataBusIn(dataBus),
        .dataBusOut(dataBus),

        .readAddressBusIn(addressBus),
        .readAddressBusOut(addressBus),

        .writeAddressBusIn(addressBus),
        .writeAddressBusOut(addressBus)
    );

    RegisterFile #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .NUM_REGISTERS(16),
        .BASE_ADDRESS(16)
    ) registerFile (
        .reset(reset),
        .clock(clock),
        .dataIn(dataBus),
        .dataOut(dataBus),
        .readAddressBus(addressBus),
        .writeAddressBus(addressBus)
    );



    // Add program Cache

    // Add data Cache

endmodule
