`timescale 1ns / 1ps

module ControlUnit_tb();

    // MODULE PORTS
    localparam DATA_BUS_WIDTH = 16;
    localparam ADDR_BUS_WIDTH = 8;
    localparam CLOCK_COUNTER_WIDTH = 8;
    localparam PROGRAM_COUNTER_ADDRESS = 1;
    localparam CLOCK_PERIOD = 1;

    reg reset, oscillator, clockEnable;
    wire clock;
    reg [DATA_BUS_WIDTH-1:0] instructionRegisterInput;
    wire [DATA_BUS_WIDTH-1:0] dataBus, programCounter;
    wire [ADDR_BUS_WIDTH-1:0] readAddressBus, writeAddressBus;




    // MODULE INSTANTIATIONS
    ControlUnit #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .CLOCK_COUNTER_WIDTH(CLOCK_COUNTER_WIDTH),
        .PROGRAM_COUNTER_ADDRESS(PROGRAM_COUNTER_ADDRESS),
        .CLOCK_PERIOD(CLOCK_PERIOD)
    ) controlUnit (
        .reset(reset),

        .oscillator(oscillator),
        .clockEnable(clockEnable),
        .clock(clock),

        .instructionRegisterInput(instructionRegisterInput),
        .programCounterOut(programCounter),
        
        .dataBusIn(dataBus),
        .dataBusOut(dataBus),

        .readAddressBusIn(readAddressBus),
        .readAddressBusOut(readAddressBus),

        .writeAddressBusIn(writeAddressBus),
        .writeAddressBusOut(writeAddressBus)
    );

    GeneralPurposeRegister #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .ADDRESS(2)
    ) register1 (
        .reset(reset),
        .clock(clock),
        .dataIn(dataBus),
        .dataOut(dataBus),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    GeneralPurposeRegister #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .ADDRESS(3)
    ) register2 (
        .reset(reset),
        .clock(clock),
        .dataIn(dataBus),
        .dataOut(dataBus),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );



    // PROCEDURES
    always #5 oscillator = ~oscillator;

    initial begin
        reset = 1;
        oscillator = 0;
        clockEnable = 0;
        instructionRegisterInput = 0;
        #20;
        
        reset = 0;
        clockEnable = 1;

        #480;
        $finish;
    end

    always @ (programCounter) begin
        case (programCounter)
            0: instructionRegisterInput = 16'b00000011_00000001; // 170, 15
            1: instructionRegisterInput = 16'b11111111_00000000; // 255, 0
            2: instructionRegisterInput = 16'b11001100_00111100; // 204, 60
            3: instructionRegisterInput = 16'b00000001_00000011; // 170, 15
            4: instructionRegisterInput = 16'b11111111_00000000; // 255, 0
            5: instructionRegisterInput = 16'b11001100_00111100; // 204, 60
            6: instructionRegisterInput = 16'b00000010_00000001; // 2, 1
            default: instructionRegisterInput = 16'b00000010_00000001; // 2, 1
        endcase
    end

endmodule
