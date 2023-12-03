
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

    // always @ (posedge clock or posedge reset)
    //     if (reset) begin
    //         state = 0;
    //         instructionRegisterEnable = 0;
    //         programCounterIncrement = 0;
    //     end else begin
    //         case (state)
    //             0: begin
    //                 {programCounterIncrement, instructionRegisterEnable} = 2'b01;
    //             end
    //             1: begin
    //                 {programCounterIncrement, instructionRegisterEnable} = 2'b10;
    //             end
    //         endcase
            
    //         state = ~state;
    //     end

    always @ (negedge clock) begin
        instructionRegisterEnable <= ~instructionRegisterEnable;
        programCounterIncrement <= ~programCounterIncrement;
    end

endmodule
