// tags: #toDo


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

    

    // ARITHMETIC FUNCTION UNITS
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

endmodule