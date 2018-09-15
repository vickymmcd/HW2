// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

// Decoder circuit

module behavioralDecoder
(
    output out0, out1, out2, out3,
    output enabledA0, enabledA1,
    output notA0, notA1, notA0enabled, notA1enabled,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Your decoder code here
    wire enabledA0, enabledA1, notA0, notA1, notA0enabled, notA1enabled;
    `AND and1(enabledA0, address0, enable);
    `AND and2(enabledA1, address1, enable);
    `NOT not1(notA0, address0);
    `NOT not2(notA1, address1);
    `AND and3(notA0enabled, notA0, enable);
    `AND and4(notA1enabled, notA1, enable);
    `AND and5(out0, notA0enabled, notA1enabled);
    `AND and6(out1, enabledA0, notA1enabled);
    `AND and7(out2, notA0enabled, enabledA1);
    `AND and8(out3, enabledA0, enabledA1);

endmodule
