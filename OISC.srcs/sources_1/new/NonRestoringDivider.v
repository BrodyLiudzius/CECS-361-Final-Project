// tags: #toDo

/* SUMMARY:
This combinational circuit implements binary division using a non-restoring array
divider. The inputs `a` and `b` are divided (i.e. a/b) to form a quotient and
remainder.
*/

/* REFERENCES:
 - https://www.sudarshan-sh.com/posts/2020/06/division_in_hardware/
 - https://www.researchgate.net/publication/330579187_Novel_Low_power_and_high_speed_array_divider_in_65_nm_Technology
 - https://www.researchgate.net/publication/271419090_Design_of_online_testable_fast_divider
 - https://www.researchgate.net/publication/337791236_Functional_Verification_of_Hardware_Dividers_using_Algebraic_Model
*/

module NonRestoringDivider #(
        parameter BIT_WIDTH = 4
    ) (
        input [BIT_WIDTH-1:0] a, // dividend
        input [BIT_WIDTH-1:0] b, // divisor     (i.e.  a/b  )

        output wire [BIT_WIDTH-1:0] quotient,
        output wire [BIT_WIDTH-1:0] remainder
    );

    wire [BIT_WIDTH-1:0] sums [BIT_WIDTH-1:0];
    wire [BIT_WIDTH-1:0] carries [BIT_WIDTH-1:0];

    genvar i, j;

    generate
        // first row of the array
        for (i = 0; i < BIT_WIDTH; i = i + 1) begin
            DividerCell dc(.a(a[i]), .b(b[i]), .carryIn((i==BIT_WIDTH-1) ? 1 : carries[0][i+1]), .previous(1), .carryOut(carries[0][i]), .sum(sums[0][i]));
        end
        
        // rest of the array
        for (i = 1; i < BIT_WIDTH; i = i + 1) begin
            for (j = 0; j < BIT_WIDTH; j = j + 1) begin
                DividerCell dc(.a((j==BIT_WIDTH-1) ? 0 : sums[i-1][j+1]), .b(b[j]), .carryIn((j==BIT_WIDTH-1) ? carries[i-1][0] : carries[i][j+1]), .previous(carries[i-1][0]), .carryOut(carries[i][j]), .sum(sums[i][j]));
            end
        end

        for (i = 0; i < BIT_WIDTH; i = i + 1) begin
            assign quotient[i] = carries[i][0];
            assign remainder[i] = sums[BIT_WIDTH-1][i];
        end

    endgenerate

endmodule