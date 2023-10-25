`timescale 1ns / 1ps

module CarryLookaheadAdder_tb();

    // MODULE PORTS
    localparam BIT_WIDTH = 4;

    reg carryIn;
    reg [BIT_WIDTH-1:0] a, b;
    
    wire [BIT_WIDTH-1:0] sum;
    wire carryOut;



    // MODULE INSTANTIATIONS
    CarryLookaheadAdder #(
        .BIT_WIDTH(BIT_WIDTH)
    ) carryLookaheadAdder (
        .a(a),
        .b(b),
        .carryIn(carryIn),
        .sum(sum),
        .carryOut(carryOut)
    );



    // PROCEDURES
    initial begin
        a = 0;
        b = 0;
        carryIn = 0;
        # 5;

        a = 2;
        b = 3;
        #5;

        carryIn = 1;
        #5;

        a = {BIT_WIDTH{1'b1}};
        b = 0;
        carryIn = 0;
        #5;

        carryIn = 1;
        #5;

        carryIn = 0;
        b = 1;
        #5;

        b = 3;
        #5;

        $finish;

    end

endmodule
