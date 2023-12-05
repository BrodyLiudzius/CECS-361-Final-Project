// tags:

/* SUMMARY:
The instruction register holds the current instruction to be executed. It
acts as a buffer for instruction retrieved from the ProgramCache in the CPU.
When it recieves an enable signal, it executes the current instruction by
placing it on the address buses (represented with `dataOut` here)
*/

module InstructionRegister #(
        parameter DATA_BUS_WIDTH = 64
    ) (
        input reset,
        input clock,
        input outputEnable,

        input [DATA_BUS_WIDTH-1:0] dataIn,
        output wire [DATA_BUS_WIDTH-1:0] dataOut
    );

    reg [DATA_BUS_WIDTH-1:0] value;

    assign dataOut = (outputEnable) ? value : {DATA_BUS_WIDTH{1'bz}};

    initial value <= 0;

    always @ (negedge clock) value <= (reset) ? 0 : dataIn;

endmodule
