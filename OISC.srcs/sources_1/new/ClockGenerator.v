
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
        counter = 1;
    end

    always @ (oscillator) begin
        if (!reset) begin
            if (enable)
                counter <= counter + 1;
            if (counter == period) begin
                counter <= 1;
                clock <= ~clock;
            end
        end else begin
            clock = 0;
            counter = 1;
        end
    end

endmodule
