module csa_block (
    input  [3:0] a, b,
    input        c_i,
    output [3:0] sum,
    output       c_o
);

wire [3:0] sum0, sum1;
wire       c_o_0, c_o_1;

ripple_4bit adder0 (a,b,1'b0,sum0,c_o_0);
ripple_4bit adder1 (a,b,1'b1,sum1,c_o_1);

assign sum = c_i ? sum1 : sum0;
assign sum = c_i ? c_o_1 : c_o_0;

endmodule