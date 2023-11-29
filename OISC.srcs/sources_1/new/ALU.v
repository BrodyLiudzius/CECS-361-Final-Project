// tags: #toDo


module ALU #(
        parameter DATA_BUS_WIDTH = 64,
        parameter ADDR_BUS_WIDTH = 32,

        parameter BASE_ADDRESS = 64
    ) (
        input reset,
        input clock,

        input [DATA_BUS_WIDTH-1:0] dataBusIn,
        output wire [DATA_BUS_WIDTH-1:0] dataBusOut,

        input [ADDR_BUS_WIDTH-1:0] readAddressBus,
        input [ADDR_BUS_WIDTH-1:0] writeAddressBus
    );


    // Relative addresses of function units defined here:
    `include "AddressBook.vh"


    // LOGICAL FUNCTION UNITS
    Compare #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS_1(BASE_ADDRESS + COMPARE_BASE_ADDRESS + 0),
        .INPUT_ADDRESS_2(BASE_ADDRESS + COMPARE_BASE_ADDRESS + 1),
        .OUTPUT_ADDRESS(BASE_ADDRESS + COMPARE_BASE_ADDRESS + 0)
    ) compare (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    

    // ARITHMETIC FUNCTION UNITS
    Adder #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS_1(ADDER_BASE_ADDRESS + 0),
        .INPUT_ADDRESS_2(ADDER_BASE_ADDRESS + 1),
        .OUTPUT_ADDRESS(ADDER_BASE_ADDRESS + 0)
    ) adder (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    ArithmeticLeftShift #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS(A_LSHIFT_BASE_ADDRESS),
        .OUTPUT_ADDRESS(A_LSHIFT_BASE_ADDRESS)
    ) arithmeticLeftShift (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    ArithmeticRightShift #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS(A_RSHIFT_BASE_ADDRESS),
        .OUTPUT_ADDRESS(A_RSHIFT_BASE_ADDRESS)
    ) arithmeticRightShift (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

endmodule