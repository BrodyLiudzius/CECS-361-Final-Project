`timescale 1ns / 1ps

module CPU_tb();

    // MODULE PORTS
    localparam DATA_BUS_WIDTH = 16;
    localparam ADDR_BUS_WIDTH = 8;
    localparam CLOCK_COUNTER_WIDTH = 32;
    localparam REGISTER_FILE_SIZE = 16;
    localparam NUM_WORDS_PROGRAM_MEMORY = 32;
    localparam NUM_WORDS_DATA_MEMORY = 32;

    reg reset, oscillator, clockEnable;
    reg [CLOCK_COUNTER_WIDTH-1:0] clockPeriod;
    wire [DATA_BUS_WIDTH-1:0] programCounterOut, displayRegisterOut, instructionRegisterInput;
    wire clock, instructionRegisterEnable, programCounterIncrement;



    // MODULE INSTANTIATIONS
    CPU #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .CLOCK_COUNTER_WIDTH(CLOCK_COUNTER_WIDTH),
        .REGISTER_FILE_SIZE(REGISTER_FILE_SIZE),
        .NUM_WORDS_PROGRAM_MEMORY(NUM_WORDS_PROGRAM_MEMORY),
        .NUM_WORDS_DATA_MEMORY(NUM_WORDS_DATA_MEMORY)
    ) cpu (
        .oscillator(oscillator),
        .reset(reset),
        .clockEnable(clockEnable),
        .clockPeriod(clockPeriod),
        .programCounterOut(programCounterOut),
        .displayRegisterOut(displayRegisterOut),
        .instructionRegisterInput(instructionRegisterInput),
        .clock(clock),
        .instructionRegisterEnable(instructionRegisterEnable),
        .programCounterIncrement(programCounterIncrement)
    );


    // PROCEDURES
    always #5 oscillator = ~oscillator;

    initial begin
        oscillator = 0;
        clockEnable = 0;
        reset = 1;
        clockPeriod = 1;
        #10;
        clockEnable = 1;
        reset = 0;
        #990

        $finish;
    end

endmodule
