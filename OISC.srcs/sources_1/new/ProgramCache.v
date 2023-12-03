`timescale 1ns / 1ps

module ProgramCache(
        input [15:0] address,
        output reg [15:0] instruction
    );

    always @ (address) begin
        case (address)
            default: instruction <= 16'h0130;
        endcase
    end

endmodule
