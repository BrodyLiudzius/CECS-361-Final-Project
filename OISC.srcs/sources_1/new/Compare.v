
module Compare #(
        parameter DATA_BUS_WIDTH = 64,
        parameter ADDR_BUS_WIDTH = 32,

        parameter INPUT_ADDRESS_1 = 1,
        parameter INPUT_ADDRESS_2 = 2,
        parameter OUTPUT_ADDRESS = 1
    ) (
        input reset,
        input clock,

        input [DATA_BUS_WIDTH-1:0] dataBusIn,
        output wire [DATA_BUS_WIDTH-1:0] dataBusOut,

        input [ADDR_BUS_WIDTH-1:0] readAddressBus,
        input [ADDR_BUS_WIDTH-1:0] writeAddressBus
    );

    wire writeEnable1, writeEnable2;
    wire a, b;
    wire [DATA_BUS_WIDTH-1:0] out;

    InputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .ADDRESS(INPUT_ADDRESS_1)
    ) inputGate1 (
        .addressIn(writeAddressBus),
        .writeEnable(writeEnable1)
    );

    InputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .ADDRESS(INPUT_ADDRESS_2)
    ) inputGate2 (
        .addressIn(writeAddressBus),
        .writeEnable(writeEnable2)
    );

    Register #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH)
    ) register1 (
        .reset(reset),
        .clock(clock),
        .writeEnable(writeEnable1),
        .dataIn(dataBusIn),
        .dataOut(a)
    );

    Register #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH)
    ) register2 (
        .reset(reset),
        .clock(clock),
        .writeEnable(writeEnable2),
        .dataIn(dataBusIn),
        .dataOut(b)
    );


    assign out = {{DATA_BUS_WIDTH-3{1'b0}}, $signed(a) > $signed(b), a > b, a == b};


    OutputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDRESS(OUTPUT_ADDRESS)
    ) outputGate1 (
        .addressIn(readAddressBus),
        .dataIn(out),
        .dataOut(dataBusOut)
    );

endmodule
