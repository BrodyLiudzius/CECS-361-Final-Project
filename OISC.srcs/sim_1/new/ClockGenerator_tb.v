`timescale 1ns / 1ps

module ClockGenerator_tb();

    // MODULE PORTS
    localparam CLOCK_COUNTER_WIDTH = 32;
    localparam PERIOD = 2;

    reg oscillator, enable, reset;
    reg [31:0] period;
    wire clock;



    // MODULE INSTANTIATIONS
    ClockGenerator #(
        .CLOCK_COUNTER_WIDTH(CLOCK_COUNTER_WIDTH),
        .PERIOD(PERIOD)
    )uut (
        .reset(reset),
        .oscillator(oscillator),
        .enable(enable),
        .clock(clock)
    );



    // PROCEDURES
    always #5 oscillator = ~oscillator;

    initial begin
        reset = 1;
        oscillator = 0;
        enable = 0;
        #20;

        reset = 0;
        enable = 1;
        #120;

        reset = 1;
        #10;

        reset = 0;
        #20;

        enable =0;
        #20;

        enable = 1;
        #20;

        $finish;
    end

endmodule
