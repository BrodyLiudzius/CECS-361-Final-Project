// tags: 

/* SUMMARY:
Creates a register of the specified width
*/

module Register #(
        parameter DATA_BUS_WIDTH = 64
    ) (
        input reset,
        input clock,
        input writeEnable,

        input [DATA_BUS_WIDTH-1:0] dataIn,
        output reg [DATA_BUS_WIDTH-1:0] dataOut
    );

    initial begin
        dataOut = 0;
    end

    always @ (posedge clock, posedge reset)
        if (reset)
            dataOut <= 0;
        else if (writeEnable)
            dataOut <= dataIn;
            
    
endmodule
