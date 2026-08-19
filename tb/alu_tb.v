`timescale 1ns/1ps

module alu_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] opcode;
    reg [3:0] expected;

    wire [3:0] result;

    alu uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result)
    );

    task check;
        input [3:0] exp;
        begin
            #10;
            if (result == exp)
                $display("PASS | A=%b B=%b opcode=%b result=%b",
                         A, B, opcode, result);
            else
                $display("FAIL | A=%b B=%b opcode=%b expected=%b actual=%b",
                         A, B, opcode, exp, result);
        end
    endtask

    initial begin

        // ADD
        A = 4'd5;
        B = 4'd3;
        opcode = 3'b000;
        check(4'd8);

        // SUB
        A = 4'd5;
        B = 4'd3;
        opcode = 3'b001;
        check(4'd2);

        // AND
        A = 4'b1100;
        B = 4'b1010;
        opcode = 3'b010;
        check(4'b1000);

        // OR
        opcode = 3'b011;
        check(4'b1110);

        // XOR
        opcode = 3'b100;
        check(4'b0110);

        // NOT
        opcode = 3'b101;
        check(4'b0011);

        $display("ALU TESTBENCH COMPLETE");
        $finish;

    end

endmodule