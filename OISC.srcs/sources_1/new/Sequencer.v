
module Sequencer (
        input reset,
        input clock,

        output reg instructionRegisterEnable,
        output reg programCounterIncrement
    );

    reg state;

    initial begin
        state = 0;
        instructionRegisterEnable = 0;
        programCounterIncrement = 0;
    end

    always @ (negedge clock)
        if (!reset) begin
            case (state)
                0: begin
                    {programCounterIncrement, instructionRegisterEnable} <= 2'b01;
                end
                1: begin
                    {programCounterIncrement, instructionRegisterEnable} <= 2'b10;
                end
            endcase
            state <= state + 1;
        end else begin
            state = 0;
            instructionRegisterEnable = 0;
            programCounterIncrement = 0;
        end

endmodule
