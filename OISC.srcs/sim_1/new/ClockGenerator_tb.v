`timescale 1ns / 1ps

module ClockGenerator_tb();

    // MODULE PORTS
    reg oscillator, enable, reset;
    reg [31:0] period;
    wire clock;



    // MODULE INSTANTIATIONS
    ClockGenerator uut (
        .reset(reset),
        .oscillator(oscillator),
        .enable(enable),
        .period(period),
        .clock(clock)
    );



    // PROCEDURES
    always #5 oscillator = ~oscillator;

    initial begin
        reset = 1;
        oscillator = 0;
        enable = 0;
        period = 3;
        #20;

        reset = 0;
        enable = 1;
        #120;

        period = 4;
        #160;

        reset = 1;
        period = 1;
        #10;

        reset = 0;
        #20;

        $finish;
    end

endmodule
