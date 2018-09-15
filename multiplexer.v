// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

// Multiplexer circuit

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Your multiplexer code here
    wire notA0, notA1, notA0andnotA1, notA0andA1, A0andnotA1, A0andA1;
    wire in0and, in1and, in2and, in3and;
    `NOT not1(notA0, address0);
    `NOT not2(notA1, address1);
    `AND and1(A0andA1, address0, address1);
    `AND and2(A0andnotA1, address0, notA1);
    `AND and3(notA0andA1, notA0, address1);
    `AND and4(notA0andnotA1, notA0, notA1);
    `AND and5(in0and, in0, notA0andnotA1);
    `AND and6(in1and, in1, A0andnotA1);
    `AND and7(in2and, in2, notA0andA1);
    `AND and8(in3and, in3, A0andA1);
    `OR or1(out, in0and, in1and, in2and, in3and);

endmodule
