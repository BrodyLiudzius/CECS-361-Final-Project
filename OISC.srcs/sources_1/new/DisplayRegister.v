// tags:

/* SUMMARY
Same as GeneralPurposeRegister module excpet it exposes the data within it
via the `dataTap` output
*/

module DisplayRegister #(
        parameter DATA_BUS_WIDTH = 64,
        parameter ADDR_BUS_WIDTH = 32,

        parameter ADDRESS = 1
    ) (
        input reset,
        input clock,

        input [DATA_BUS_WIDTH-1:0] dataIn,
        output wire [DATA_BUS_WIDTH-1:0] dataOut,

        output wire [DATA_BUS_WIDTH-1:0] dataTap,

        input [ADDR_BUS_WIDTH-1:0] readAddressBus,
        input [ADDR_BUS_WIDTH-1:0] writeAddressBus
    );

    wire writeEnable;
    wire [DATA_BUS_WIDTH-1:0] registerData;

    InputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .ADDRESS(ADDRESS)
    ) inputGate (
        .addressIn(writeAddressBus),
        .writeEnable(writeEnable)
    );

    Register #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH)
    ) register (
        .reset(reset),
        .clock(clock),
        .writeEnable(writeEnable),
        .dataIn(dataIn),
        .dataOut(registerData)
    );

    assign dataTap = registerData;

    OutputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDRESS(ADDRESS)
    ) outputGate (
        .addressIn(readAddressBus),
        .dataIn(registerData),
        .dataOut(dataOut)
    );
endmodule
