
module ClockGenerator #(
        parameter CLOCK_COUNTER_WIDTH = 32
    ) (
        input reset,
        input oscillator,
        input enable,
        input [CLOCK_COUNTER_WIDTH-1:0] period,
        output reg clock
    );

    reg [CLOCK_COUNTER_WIDTH-1:0] counter;

    initial begin
        clock = 0;
        counter = 0;
    end

    always @ (posedge oscillator)
        if (!reset) begin
            if (enable)
                counter = (counter < period) ? counter + 1 : 0;
        end else begin
            counter = 0;
        end

    always @ (counter)
        if (counter == period - 1)
           clock = ~clock;

endmodule
