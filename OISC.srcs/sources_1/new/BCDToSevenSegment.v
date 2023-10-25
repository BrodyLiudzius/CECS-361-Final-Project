
module BCDToSevenSegment (
        input [3:0] BCD,
        output reg [6:0] sevenSegment
    );

    always @ (BCD) begin
        case (BCD)
            0: sevenSegment = 7'b1111110;
            1: sevenSegment = 7'b0110000;
            2: sevenSegment = 7'b1101101;
            3: sevenSegment = 7'b1111001;
            4: sevenSegment = 7'b0110011;
            5: sevenSegment = 7'b1011011;
            6: sevenSegment = 7'b1011111;
            7: sevenSegment = 7'b1110000;
            8: sevenSegment = 7'b1111111;
            9: sevenSegment = 7'b1111011;

            default: sevenSegment = 7'b0000001;
        endcase
    end

endmodule