module ripple_4bit (
    input [3:0] a,b,
    input       c_i,
    output [3:0] sum,
    output       c_o
);

wire [2:0] carry;

full_adder fa0 (a[0], b[0], c_i,      sum[0], carry[0]);
full_adder fa1 (a[1], b[1], carry[0], sum[1], carry[1]);
full_adder fa2 (a[2], b[2], carry[1], sum[2], carry[2]);
full_adder fa3 (a[3], b[3], carry[2], sum[3], c_o);

endmodule 