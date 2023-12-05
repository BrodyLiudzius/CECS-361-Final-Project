// tags: 

/* SUMMARY:
Instantiates the specified number of general purpose registers with
the register addresses starting at the specified address
*/

module RegisterFile #(
        parameter DATA_BUS_WIDTH = 64,
        parameter ADDR_BUS_WIDTH = 32,

        parameter NUM_REGISTERS = 32,

        parameter BASE_ADDRESS = 16
    ) (
        input reset,
        input clock,

        input [DATA_BUS_WIDTH-1:0] dataIn,
        output wire [DATA_BUS_WIDTH-1:0] dataOut,

        input [ADDR_BUS_WIDTH-1:0] readAddressBus,
        input [ADDR_BUS_WIDTH-1:0] writeAddressBus
    );

    genvar i;
    generate
        for (i = 0; i < NUM_REGISTERS; i = i + 1)
            GeneralPurposeRegister #(
                .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
                .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
                .ADDRESS(BASE_ADDRESS + i)
            ) register (
                .reset(reset),
                .clock(clock),
                .dataIn(dataIn),
                .dataOut(dataOut),
                .readAddressBus(readAddressBus),
                .writeAddressBus(writeAddressBus)
            );
    endgenerate

endmodule