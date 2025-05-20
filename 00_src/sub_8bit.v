module sub_8bit (
    input [7:0] a, b,
    output wire b_o,
    output wire [7:0] sub
);

wire [7:0] not_b;

not_8bit sub1 (
    .a (b),
    .y (not_b)
);

csa_8bit adder (
    .a (a),
    .b (b),
    .sum (sub),
    .c_o (b_o)
);

endmodule 