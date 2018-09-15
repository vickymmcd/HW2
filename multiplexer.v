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
    // see the 4 input mux diagram you have drawn in your notes to fill this in
    wire notA0, notA1;
    `NOT not1(notA0, address0);
    `NOT not2(notA1, address1);

endmodule
