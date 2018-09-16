// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

// Adder circuit

module behavioralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    // Your adder code here
    wire axorb, axorbandcin, aandb;
    `XOR xor1(axorb, a, b);
    `XOR xor2(sum, axorb, carryin);
    `AND and1(axorbandcin, axorb, carryin);
    `AND and2(aandb, a, b);
    `OR or1(carryout, axorbandcin, aandb);

endmodule
