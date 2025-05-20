module or_8bit (
    input       [7:0] a,b,
    output wire [7:0] c_or
);

or (c_or[0], a[0], b[0]);
or (c_or[1], a[1], b[1]);
or (c_or[2], a[2], b[2]);
or (c_or[3], a[3], b[3]);
or (c_or[4], a[4], b[4]);
or (c_or[5], a[5], b[5]);
or (c_or[6], a[6], b[6]);
or (c_or[7], a[7], b[7]);

endmodule
