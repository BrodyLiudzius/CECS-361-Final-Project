`timescale 1ns / 1ps

module BCDToSevenSegment_tb();

    // MODULE PORTS
    reg [3:0] BCD;
    wire [6:0] sevenSegment;



    // MODULE INSTANTIATIONS
    BCDToSevenSegment bcdToSS (
        .BCD(BCD),
        .sevenSegment(sevenSegment)
    );



    // PROCEDURES
    integer i;
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            BCD = i;
            #5;
        end
        $finish;
    end

endmodule
