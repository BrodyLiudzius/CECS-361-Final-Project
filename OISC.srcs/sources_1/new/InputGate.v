// tags:

/* SUMMARY:
The Input Gate checks if its address was specified on the bus it is attached
to and if so, emits a writeEnable signal
*/

module InputGate #(
        parameter ADDR_BUS_WIDTH = 64,

        parameter ADDRESS = 1
    ) (
        input [ADDR_BUS_WIDTH-1:0] addressIn,

        output wire writeEnable
    );

    assign writeEnable = (addressIn == ADDRESS) ? 1 : 0;

endmodule
