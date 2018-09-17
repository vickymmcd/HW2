// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;

    // behavioralFullAdder adder (sum, carryout, a, b, carryin);
    structuralFullAdder adder (sum, carryout, a, b, carryin);

    initial begin
        // Your test code here
        $dumpfile("test_adder.vcd");
        $dumpvars;
        $display("A B carryin | sum carryout | Expected Output");
        a=0;b=0;carryin=0; #1000
        $display("%b  %b  %b     | %b    %b       | sum 0, carry 0", a, b, carryin, sum, carryout);
        a=0;b=0;carryin=1; #1000
        $display("%b  %b  %b     | %b    %b       | sum 1, carry 0", a, b, carryin, sum, carryout);
        a=0;b=1;carryin=0; #1000
        $display("%b  %b  %b     | %b    %b       | sum 1, carry 0", a, b, carryin, sum, carryout);
        a=0;b=1;carryin=1; #1000
        $display("%b  %b  %b     | %b    %b       | sum 0, carry 1", a, b, carryin, sum, carryout);
        a=1;b=0;carryin=0; #1000
        $display("%b  %b  %b     | %b    %b       | sum 1, carry 0", a, b, carryin, sum, carryout);
        a=1;b=0;carryin=1; #1000
        $display("%b  %b  %b     | %b    %b       | sum 0, carry 1", a, b, carryin, sum, carryout);
        a=1;b=1;carryin=0; #1000
        $display("%b  %b  %b     | %b    %b       | sum 0, carry 1", a, b, carryin, sum, carryout);
        a=1;b=1;carryin=1; #1000
        $display("%b  %b  %b     | %b    %b       | sum 1, carry 1", a, b, carryin, sum, carryout);
        $finish;

    end
endmodule
