// tags: #staticWidth

/* SUMMARY:
The program cache is what stores the program for the CPU. Since it is read-only to the CPU, and
this project does not implement any higher forms of memory like RAM, the program cache is simply
hard-coded using a case statement for simplicity. It is the easiest way to have the CPU start
with a program available for it to execute.
*/

module ProgramCache(
        input [15:0] address,
        output reg [15:0] instruction
    );

    always @ (address) begin
        case (address)
            0: instruction <= 16'h0000; //
            1: instruction <= 16'h0110; // pc -> gpr0
            2: instruction <= 16'h0111; // pc -> gpr1

            3: instruction <= 16'h0000; //
            4: instruction <= 16'h0000; //
            5: instruction <= 16'h0000; //
            6: instruction <= 16'h0000; //
            7: instruction <= 16'h0000; //
            8: instruction <= 16'h0112; // pc -> gpr2
            9: instruction <= 16'h1262; // gpr2 -> add0
            10: instruction <= 16'h1263; // gpr2 -> add1
            11: instruction <= 16'h6212; // add -> gpr2

            12: instruction <= 16'h1030; // gpr0 -> display
            13: instruction <= 16'h1062; // gpr0 -> add0
            14: instruction <= 16'h1130; // gpr1 -> display
            15: instruction <= 16'h1163; // gpr1 -> add1
            16: instruction <= 16'h6230; // add -> display

            17: instruction <= 16'h3062; // display -> add0
            18: instruction <= 16'h6230; // add -> display

            19: instruction <= 16'h3063; // display -> add1
            20: instruction <= 16'h6230; // add -> display

            21: instruction <= 16'h1201; // gpr2 -> pc


            default: instruction <= 16'h0000;
        endcase
    end

endmodule
