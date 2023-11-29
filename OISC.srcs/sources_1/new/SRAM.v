
module SRAM #(
        parameter DATA_BUS_WIDTH = 64,
        parameter NUM_WORDS = 1024,
        parameter HEX_FILE = "./filepath.mem"
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
        $readmemh(HEX_FILE, data);

    // Data write is transport-triggered
    always @ (dataIn) begin
        if (!reset)
            data[address] <= dataIn;
        else
            $readmemh(HEX_FILE, data);
    end

endmodule
