
module SRAM #(
        parameter DATA_BUS_WIDTH = 64,
        parameter NUM_WORDS = 1024,
        parameter HEX_FILE = "./filepath.hex"
    ) (
        input reset,

        input [DATA_BUS_WIDTH-1:0] address,

        input [DATA_BUS_WIDTH-1:0] dataIn,
        output wire [DATA_BUS_WIDTH-1:0] dataOut
    );

    reg [DATA_BUS_WIDTH-1:0] data [NUM_WORDS-1:0];

    assign dataOut = data[address];

    integer i;
    initial
        for (i = 0; i < NUM_WORDS; i = i + 1)
            data[i] <= 0;

    // Data write is transport-triggered
    always @ (dataIn)
        if (!reset)
            data[address] <= dataIn;

    always @ (posedge reset)
        for (i = 0; i < NUM_WORDS; i = i + 1)
            data[i] <= 0;

endmodule
