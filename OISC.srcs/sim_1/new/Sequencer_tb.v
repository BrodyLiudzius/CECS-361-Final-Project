`timescale 1ns / 1ps

module Sequencer_tb();

    // MODULE PORTS
    reg reset, clock;
    wire instructionRegisterEnable, programCounterIncrement;



    // MODULE INSTANTIATIONS
    Sequencer sequencer (
        .reset(reset),
        .clock(clock),
        .instructionRegisterEnable(instructionRegisterEnable),
        .programCounterIncrement(programCounterIncrement)
    );



    // PROCEDURES
    always #5 clock = ~clock;

    initial begin
        reset = 1;
        clock = 0;
        #10;

        reset = 0;

        #65;

        reset = 1;
        #5;

        reset = 0;
        #20;

        $finish;
    end

endmodule
