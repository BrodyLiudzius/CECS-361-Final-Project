// tags: 

/* SUMMARY:
SRAM is a simple read/write memory module that can be resized using the parameters
*/

module SRAM #(
        DATA_BUS_WIDTH = 64,
        
        NUM_WORDS = 1024
    ) (
        input reset,

        input write,

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

    always @ (posedge write)
        if (reset)
            for (i = 0; i < NUM_WORDS; i = i + 1)
                data[i] <= 0;
        else
            data[address] <= dataIn;
            

        

endmodule
