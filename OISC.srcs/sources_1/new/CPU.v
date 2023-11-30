// tags: #toDo

// toDo: The addresses should be moved to a header file and included

module CPU #(
        parameter DATA_BUS_WIDTH = 16,
        parameter ADDR_BUS_WIDTH = 8,

        parameter CLOCK_COUNTER_WIDTH = 32,

        parameter REGISTER_FILE_SIZE = 16,

        parameter NUM_WORDS_PROGRAM_MEMORY = 32,
        parameter NUM_WORDS_DATA_MEMORY = 32,

        parameter HEX_FILE_PROGRAM = "program.mem",
        parameter HEX_FILE_DATA = "data.mem"
    )(
        input oscillator,
        input reset,
        input clockEnable,

        input [CLOCK_COUNTER_WIDTH-1:0] clockPeriod,

        output wire [DATA_BUS_WIDTH-1:0] programCounterOut,
        output wire [DATA_BUS_WIDTH-1:0] displayRegisterOut
    );

    // Addresses of all registers defined here (NOTE: also `included in ALU.v):
    `include "AddressBook.vh"

    wire clock;
    wire [DATA_BUS_WIDTH-1:0] dataBus, instructionRegisterInput;
    wire [ADDR_BUS_WIDTH-1:0] readAddressBus, writeAddressBus;

    ControlUnit #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .CLOCK_COUNTER_WIDTH(CLOCK_COUNTER_WIDTH),
        .PROGRAM_COUNTER_ADDRESS(PROGRAM_COUNTER_ADDRESS)
    ) controlUnit (
        .reset(reset),
        .oscillator(oscillator),
        .clockEnable(clockEnable),
        .clockPeriod(clockPeriod),
        .clock(clock),

        .instructionRegisterInput(instructionRegisterInput),
        .programCounterOut(programCounterOut),

        .dataBusIn(dataBus),
        .dataBusOut(dataBus),

        .readAddressBusIn(readAddressBus),
        .readAddressBusOut(readAddressBus),

        .writeAddressBusIn(writeAddressBus),
        .writeAddressBusOut(writeAddressBus)
    );

    ALU #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH)
    ) alu (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBus),
        .dataBusOut(dataBus),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    RegisterFile #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .NUM_REGISTERS(REGISTER_FILE_SIZE),
        .BASE_ADDRESS(REGISTER_FILE_BASE_ADDRESS)
    ) registerFile (
        .reset(reset),
        .clock(clock),
        .dataIn(dataBus),
        .dataOut(dataBus),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    SRAM #(
        .DATA_BUS_WIDTH(2*ADDR_BUS_WIDTH), // instruction is 2 addresses
        .NUM_WORDS(NUM_WORDS_PROGRAM_MEMORY),
        .HEX_FILE(HEX_FILE_PROGRAM)
    ) programCache (
        .reset(reset),
        .address(programCounterOut),
        .dataIn(), // no connect
        .dataOut(instructionRegisterInput)
    );

    DataCache #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .HEX_FILE(HEX_FILE_DATA),
        .NUM_WORDS(NUM_WORDS_DATA_MEMORY),
        .MBR_ADDRESS(MBR_ADDRESS),
        .MAR_ADDRESS(MAR_ADDRESS)
    ) dataCache (
        .reset(reset),
        .clock(clock),
        .dataIn(dataBus),
        .dataOut(dataBus),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    DisplayRegister #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .ADDRESS(DISPLAY_REGISTER_ADDRESS)
    ) displayRegister (
        .reset(reset),
        .clock(clock),
        .dataIn(dataBus),
        .dataOut(dataBus),
        .dataTap(displayRegisterOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

endmodule
