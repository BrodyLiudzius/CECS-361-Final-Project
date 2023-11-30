
module DataCache #(
        parameter DATA_BUS_WIDTH = 16,
        parameter ADDR_BUS_WIDTH = 8,
        parameter HEX_FILE = "data.mem",
        parameter NUM_WORDS = 1024,

        parameter MBR_ADDRESS = 32,
        parameter MAR_ADDRESS = 33
    ) (
        input reset,
        input clock,

        input [DATA_BUS_WIDTH-1:0] dataIn,
        output wire [DATA_BUS_WIDTH-1:0] dataOut,

        input [ADDR_BUS_WIDTH-1:0] readAddressBus,
        input [ADDR_BUS_WIDTH-1:0] writeAddressBus
    );

    wire writeEnableMBR, writeEnableMAR;
    wire [DATA_BUS_WIDTH-1:0] registerDataMBR, registerDataMAR, SRAMData;

    // MBR
    InputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .ADDRESS(MBR_ADDRESS)
    ) inputGateMBR (
        .addressIn(writeAddressBus),
        .writeEnable(writeEnableMBR)
    );

    Register #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH)
    ) registerMBR (
        .reset(reset),
        .clock(clock),
        .writeEnable(writeEnableMBR),
        .dataIn(dataIn),
        .dataOut(registerDataMBR)
    );

    // MAR
    InputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .ADDRESS(MAR_ADDRESS)
    ) inputGateMAR (
        .addressIn(writeAddressBus),
        .writeEnable(writeEnableMAR)
    );

    Register #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH)
    ) registerMAR (
        .reset(reset),
        .clock(clock),
        .writeEnable(writeEnableMAR),
        .dataIn(dataIn),
        .dataOut(registerDataMAR)
    );

    SRAM #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .NUM_WORDS(NUM_WORDS),
        .HEX_FILE(HEX_FILE)
    ) dataCache (
        .reset(reset),
        .address(registerDataMAR),
        .dataIn(registerDataMBR),
        .dataOut(SRAMData)
    );

    OutputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDRESS(MBR_ADDRESS)
    ) outputGate (
        .addressIn(readAddressBus),
        .dataIn(SRAMData),
        .dataOut(dataOut)
    );

endmodule
