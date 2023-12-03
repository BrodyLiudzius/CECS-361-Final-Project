
module ClockGenerator #(
        parameter CLOCK_COUNTER_WIDTH = 32,
        parameter PERIOD = 134217728
    ) (
        input reset,
        input oscillator,
        input enable,
        output reg clock
    );

    reg [CLOCK_COUNTER_WIDTH-1:0] counter;

    initial begin
        clock = 1;
        counter = 0;
    end

    always @ (posedge oscillator or posedge reset) begin
        if (reset)
            counter = 0;
        else if (enable) begin
            case (counter)
                PERIOD: begin
                    counter = 0;
                    clock = ~clock;
                end
                default: counter <= counter + 1;
            endcase
        end
    end

endmodule
