
module SevenSegmentDriver #(
        parameter BIT_WIDTH = 16,
        parameter NUM_BCD_DIGITS = 8,
        parameter COMMON_ANODE = 1
    ) (
        input oscillator,
        input commonAnode,
        input [BIT_WIDTH-1:0] binary,
        output wire [6:0] sevenSegment,
        output reg [NUM_BCD_DIGITS-1:0] anodes
    );

    reg [$clog2(NUM_BCD_DIGITS)-1:0] index;
    reg [3:0] digit;
    wire [6:0] segmentsTemp;
    wire [NUM_BCD_DIGITS*4-1:0] BCD;

    BinaryToBCD #(
        .BIT_WIDTH(BIT_WIDTH),
        .NUM_BCD_DIGITS(NUM_BCD_DIGITS)
    ) binToBCD (
        .binary(binary),
        .BCD(BCD)
    );

    BCDToSevenSegment bcdToSevenSeg (
        .BCD(digit),
        .sevenSegment(segmentsTemp)
    );

    assign sevenSegment = (COMMON_ANODE) ? ~segmentsTemp : segmentsTemp;

    initial begin
        index = NUM_BCD_DIGITS - 1;
    end

    always @ (posedge oscillator) begin
        anodes = 1 << index;
        anodes = (COMMON_ANODE) ? ~anodes : anodes; 
        digit <= BCD[index*4 +: 4];
    end

    always @ (negedge oscillator) begin
        index  = (index <= 0) ? NUM_BCD_DIGITS - 1 : index - 1;
    end

endmodule
