
module ProgramCounter #(
        parameter DATA_BUS_WIDTH = 64,
        parameter ADDR_BUS_WIDTH = 32,

        parameter ADDRESS = 1
    ) (
        input reset,
        input clock,
        input increment,

        input [DATA_BUS_WIDTH-1:0] dataIn,
        output wire [DATA_BUS_WIDTH-1:0] dataOut,
        output reg [DATA_BUS_WIDTH-1:0] registerData,

        input [ADDR_BUS_WIDTH-1:0] readAddressBus,
        input [ADDR_BUS_WIDTH-1:0] writeAddressBus
    );

    wire writeEnable;

    InputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .ADDRESS(ADDRESS)
    ) inputGate (
        .addressIn(writeAddressBus),
        .writeEnable(writeEnable)
    );

    OutputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDRESS(ADDRESS)
    ) outputGate (
        .addressIn(readAddressBus),
        .dataIn(registerData),
        .dataOut(dataOut)
    );

    initial
        registerData = 0;

    always @ (posedge clock)
        if (writeEnable & !reset)
            registerData <= dataIn;

    always @ (posedge increment)
        if (!reset)
            registerData = registerData + 1;

    always @ (reset)
        registerData <= 0;


endmodule