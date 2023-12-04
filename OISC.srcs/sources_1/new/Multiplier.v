// tags: 

module Multiplier #(
        parameter DATA_BUS_WIDTH = 64,
        parameter ADDR_BUS_WIDTH = 32,

        parameter INPUT_ADDRESS_1 = 1,
        parameter INPUT_ADDRESS_2 = 2,
        parameter OUTPUT_ADDRESS_1 = 1,
        parameter OUTPUT_ADDRESS_2 = 2
    ) (
        input reset,
        input clock,

        input [DATA_BUS_WIDTH-1:0] dataBusIn,
        output wire [DATA_BUS_WIDTH-1:0] dataBusOut,

        input [ADDR_BUS_WIDTH-1:0] readAddressBus,
        input [ADDR_BUS_WIDTH-1:0] writeAddressBus
    );

    wire writeEnable1, writeEnable2;
    wire [DATA_BUS_WIDTH-1:0] a, b;
    wire [2*DATA_BUS_WIDTH-1:0] product;

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


    CarrySaveMultiplier #(
        .BIT_WIDTH(DATA_BUS_WIDTH)
    ) csm (
        .a(a),
        .b(b),
        .product(product),
        .carryOut(carryOut)
    );


    OutputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDRESS(OUTPUT_ADDRESS_1)
    ) outputGate1 (
        .addressIn(readAddressBus),
        .dataIn(product[0 +: DATA_BUS_WIDTH]),
        .dataOut(dataBusOut)
    );

    OutputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDRESS(OUTPUT_ADDRESS_2)
    ) outputGate2 (
        .addressIn(readAddressBus),
        .dataIn(product[DATA_BUS_WIDTH +: DATA_BUS_WIDTH]),
        .dataOut(dataBusOut)
    );

endmodule
