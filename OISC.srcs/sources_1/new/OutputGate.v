// tags: 

/* SUMMARY:
The output gate checks if its address was specified on the bus it is attached to. If so,
it lets the data going into it pass through to the output. Otherwise, it outputs a high
impedance
*/

module OutputGate #(
        parameter DATA_BUS_WIDTH = 64,
        parameter ADDR_BUS_WIDTH = 32,

        parameter ADDRESS = 1
    ) (
        input [ADDR_BUS_WIDTH-1:0] addressIn,

        input [DATA_BUS_WIDTH-1:0] dataIn,
        output wire [DATA_BUS_WIDTH-1:0] dataOut
    );

    assign dataOut = (addressIn === ADDRESS) ? dataIn : {DATA_BUS_WIDTH{1'bz}};

endmodule
