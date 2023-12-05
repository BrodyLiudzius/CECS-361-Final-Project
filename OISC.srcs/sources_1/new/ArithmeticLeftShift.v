// tags: 


/* SUMMARY:
This is an arithmetic left shift function unit that adds the necessary bus interfaces to the shift logic
*/

module ArithmeticLeftShift #(
        parameter DATA_BUS_WIDTH = 64,
        parameter ADDR_BUS_WIDTH = 32,

        parameter INPUT_ADDRESS = 1,
        parameter OUTPUT_ADDRESS = 1
    ) (
        input reset,
        input clock,

        input [DATA_BUS_WIDTH-1:0] dataBusIn,
        output wire [DATA_BUS_WIDTH-1:0] dataBusOut,

        input [ADDR_BUS_WIDTH-1:0] readAddressBus,
        input [ADDR_BUS_WIDTH-1:0] writeAddressBus
    );

    wire writeEnable;
    wire [DATA_BUS_WIDTH-1:0] a;
    wire [DATA_BUS_WIDTH-1:0] out;

    InputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .ADDRESS(INPUT_ADDRESS)
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
        .dataIn(dataBusIn),
        .dataOut(a)
    );


    assign out = $signed(a) <<< 1;


    OutputGate #(
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDRESS(OUTPUT_ADDRESS)
    ) outputGate (
        .addressIn(readAddressBus),
        .dataIn(out),
        .dataOut(dataBusOut)
    );

endmodule
