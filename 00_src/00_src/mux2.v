module mux2 (
    input       a, b, sel,
    output wire out
);

wire nsel;
wire x, y;

not (nsel, sel); //nsel = ~sel
and (x, a, nsel); // x = a & nsel
and (y, b, sel);  // y = b & sel
or  (out, x, y);  // out = x | b

endmodule 