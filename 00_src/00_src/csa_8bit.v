module csa_8bit (
    input [7:0] a,b,
    output [7:0] sum,
    output       c_o
);

wire [3:0] sum_l, sum_h;
wire       carry_l, carry_h;

//low block 
ripple_4bit block0 (
    .a(a[3:0]),
    .b(b[3:0]),
    .c_i(1'b0),
    .sum(sum_l),
    .c_o(carry_l)
);

//high block
ripple_4bit block1 (
    .a(a[7:4]),
    .b(b[7:4]),
    .c_i(carry_l),
    .sum(sum_h),
    .c_o(c_o)
);

assign sum = {sum_h, sum_l};

endmodule
