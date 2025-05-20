module full_adder (
    input a,b,c_i,
    output sum, c_o
);

wire s1, c1, c2;

xor (s1,a,b);     //s1 = a ^ b
xor (sum,s1,c_i); //sum = s1 ^ c_i

and (c1,a,b);     //c1 = a & b
and (c2,s1,c_i);  //c2 = s1 & c_i

or (c_o,c1,c2);   //c_o = c1 | c2

endmodule 