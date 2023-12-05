// tags: 

/* SUMMARY:
Part of the control unit.

The sequencer generates the two alternating control signals for the instruction
register and program counter.
*/

module Sequencer (
        input reset,
        input clock,

        output reg instructionRegisterEnable,
        output reg programCounterIncrement
    );

    reg state;

    initial begin
        state = 0;
        instructionRegisterEnable = 1;
        programCounterIncrement = 0;
    end

    always @ (negedge clock) begin
        instructionRegisterEnable <= ~instructionRegisterEnable;
        programCounterIncrement <= ~programCounterIncrement;
    end

endmodule
