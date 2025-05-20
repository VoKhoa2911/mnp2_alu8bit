module and_8bit (
    input       [7:0] a, b,
    output wire [7:0] c_o
);

and (c_o[0], a[0], b[0]);
and (c_o[1], a[1], b[1]);
and (c_o[2], a[2], b[2]);
and (c_o[3], a[3], b[3]);
and (c_o[4], a[4], b[4]);
and (c_o[5], a[5], b[5]);
and (c_o[6], a[6], b[6]);
and (c_o[7], a[7], b[7]);

endmodule 