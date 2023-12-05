// tags: #toDo

/* SUMMARY:
The ALU module instantiates logical and arithmetic function units and sets their addresses
*/



/* To Do:
- Instantiate divider
*/

module ALU #(
        parameter DATA_BUS_WIDTH = 64,
        parameter ADDR_BUS_WIDTH = 32
    ) (
        input reset,
        input clock,

        input [DATA_BUS_WIDTH-1:0] dataBusIn,
        output wire [DATA_BUS_WIDTH-1:0] dataBusOut,

        input [ADDR_BUS_WIDTH-1:0] readAddressBus,
        input [ADDR_BUS_WIDTH-1:0] writeAddressBus
    );


    // Addresses of function units defined here:
    `include "AddressBook.vh"


    // LOGICAL FUNCTION UNITS

    Compare #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS_1(ALU_COMPARE_ADDRESS_1),
        .INPUT_ADDRESS_2(ALU_COMPARE_ADDRESS_2),
        .OUTPUT_ADDRESS(ALU_COMPARE_ADDRESS_1)
    ) compare (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    AND #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS_1(ALU_AND_ADDRESS_1),
        .INPUT_ADDRESS_2(ALU_AND_ADDRESS_2),
        .OUTPUT_ADDRESS(ALU_AND_ADDRESS_1)
    ) And (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    OR #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS_1(ALU_OR_ADDRESS_1),
        .INPUT_ADDRESS_2(ALU_OR_ADDRESS_2),
        .OUTPUT_ADDRESS(ALU_OR_ADDRESS_1)
    ) Or (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    XOR #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS_1(ALU_XOR_ADDRESS_1),
        .INPUT_ADDRESS_2(ALU_XOR_ADDRESS_2),
        .OUTPUT_ADDRESS(ALU_XOR_ADDRESS_1)
    ) Xor (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    LogicalLeftShift #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS(ALU_LLSHIFT_ADDRESS),
        .OUTPUT_ADDRESS(ALU_LLSHIFT_ADDRESS)
    ) logicalLeftShift (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    LogicalRightShift #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS(ALU_LRSHIFT_ADDRESS),
        .OUTPUT_ADDRESS(ALU_LRSHIFT_ADDRESS)
    ) logicalRightShift (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    

    // ARITHMETIC FUNCTION UNITS

    ArithmeticLeftShift #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS(ALU_A_LSHIFT_ADDRESS),
        .OUTPUT_ADDRESS(ALU_A_LSHIFT_ADDRESS)
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
        .INPUT_ADDRESS(ALU_A_RSHIFT_ADDRESS),
        .OUTPUT_ADDRESS(ALU_A_RSHIFT_ADDRESS)
    ) arithmeticRightShift (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    Adder #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS_1(ALU_ADD_ADDRESS_1),
        .INPUT_ADDRESS_2(ALU_ADD_ADDRESS_2),
        .OUTPUT_ADDRESS(ALU_ADD_ADDRESS_1)
    ) adder (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

    Multiplier #(
        .DATA_BUS_WIDTH(DATA_BUS_WIDTH),
        .ADDR_BUS_WIDTH(ADDR_BUS_WIDTH),
        .INPUT_ADDRESS_1(ALU_MULTIPLY_ADDRESS_1),
        .INPUT_ADDRESS_2(ALU_MULTIPLY_ADDRESS_2),
        .OUTPUT_ADDRESS_1(ALU_MULTIPLY_ADDRESS_1),
        .OUTPUT_ADDRESS_2(ALU_MULTIPLY_ADDRESS_2)
    ) multiplier (
        .reset(reset),
        .clock(clock),
        .dataBusIn(dataBusIn),
        .dataBusOut(dataBusOut),
        .readAddressBus(readAddressBus),
        .writeAddressBus(writeAddressBus)
    );

endmodule