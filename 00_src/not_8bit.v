module not_8bit (
    input       [7:0] a,
    output wire [7:0] y
);

nand (y[0], a[0], a[0]);
nand (y[1], a[1], a[1]);
nand (y[2], a[2], a[2]);
nand (y[3], a[3], a[3]);
nand (y[4], a[4], a[4]);
nand (y[5], a[5], a[5]);
nand (y[6], a[6], a[6]);
nand (y[7], a[7], a[7]);

endmodule