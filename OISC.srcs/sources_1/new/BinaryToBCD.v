// tags:

/* SUMMARY:
This module takes an unsigned binary input and will convert it to the specified number of
BCD digits. If the binary integer has a larger decimal representation than the number of
BCD digits specified, the higher-order digits will be cut off (i.e the one's place will
always be displayed but the highest digit place might not be)
*/

module BinaryToBCD #(
        parameter BIT_WIDTH = 16,
        parameter NUM_BCD_DIGITS = 8
    ) (
        input [BIT_WIDTH-1:0] binary,
        output reg [NUM_BCD_DIGITS*4-1:0] BCD
    );

    reg [BIT_WIDTH-1:0] tempRegister;

    integer i;
    always @ (binary) begin;
        tempRegister = binary;
        for (i = NUM_BCD_DIGITS - 1; i >= 0; i = i - 1) begin
            BCD[i*4 +: 4] = tempRegister / 10**i;
            tempRegister = tempRegister % 10**i;
        end
    end

endmodule
