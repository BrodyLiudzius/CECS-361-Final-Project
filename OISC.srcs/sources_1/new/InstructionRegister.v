
module InstructionRegister #(
        parameter DATA_BUS_WIDTH = 64
    ) (
        input reset,
        input clock,
        input outputEnable,

        input [DATA_BUS_WIDTH-1:0] dataIn,
        output wire [DATA_BUS_WIDTH-1:0] dataOut
    );

    reg [DATA_BUS_WIDTH-1:0] value;

    assign dataOut = (outputEnable) ? value : {DATA_BUS_WIDTH{1'bz}};

    initial begin
        value <= 0;
    end

    always @ (negedge clock)
        if (!reset)
            value <= dataIn;

    always @ (reset) begin
        value <= 0;
    end

endmodule
