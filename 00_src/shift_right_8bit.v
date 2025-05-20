module shift_right_8bit (
    input  [7:0] a,      // Dữ liệu 8-bit đầu vào
    input  [7:0] b,      // Số lượng bit dịch (0–7)
    output wire [7:0] y  // Kết quả dịch phải logic
);

    wire [7:0] s0, s1, s2;

    // Stage 0: dịch 1 bit
    mux2 m00 (.sel(b[0]), .a(a[0]), .b(a[1]), .out(s0[0]));
    mux2 m01 (.sel(b[0]), .a(a[1]), .b(a[2]), .out(s0[1]));
    mux2 m02 (.sel(b[0]), .a(a[2]), .b(a[3]), .out(s0[2]));
    mux2 m03 (.sel(b[0]), .a(a[3]), .b(a[4]), .out(s0[3]));
    mux2 m04 (.sel(b[0]), .a(a[4]), .b(a[5]), .out(s0[4]));
    mux2 m05 (.sel(b[0]), .a(a[5]), .b(a[6]), .out(s0[5]));
    mux2 m06 (.sel(b[0]), .a(a[6]), .b(a[7]), .out(s0[6]));
    mux2 m07 (.sel(b[0]), .a(a[7]), .b(1'b0), .out(s0[7]));

    // Stage 1: dịch 2 bit
    mux2 m10 (.sel(b[1]), .a(s0[0]), .b(s0[2]), .out(s1[0]));
    mux2 m11 (.sel(b[1]), .a(s0[1]), .b(s0[3]), .out(s1[1]));
    mux2 m12 (.sel(b[1]), .a(s0[2]), .b(s0[4]), .out(s1[2]));
    mux2 m13 (.sel(b[1]), .a(s0[3]), .b(s0[5]), .out(s1[3]));
    mux2 m14 (.sel(b[1]), .a(s0[4]), .b(s0[6]), .out(s1[4]));
    mux2 m15 (.sel(b[1]), .a(s0[5]), .b(s0[7]), .out(s1[5]));
    mux2 m16 (.sel(b[1]), .a(s0[6]), .b(1'b0), .out(s1[6]));
    mux2 m17 (.sel(b[1]), .a(s0[7]), .b(1'b0), .out(s1[7]));

    // Stage 2: dịch 4 bit
    mux2 m20 (.sel(b[2]), .a(s1[0]), .b(s1[4]), .out(s2[0]));
    mux2 m21 (.sel(b[2]), .a(s1[1]), .b(s1[5]), .out(s2[1]));
    mux2 m22 (.sel(b[2]), .a(s1[2]), .b(s1[6]), .out(s2[2]));
    mux2 m23 (.sel(b[2]), .a(s1[3]), .b(s1[7]), .out(s2[3]));
    mux2 m24 (.sel(b[2]), .a(s1[4]), .b(1'b0), .out(s2[4]));
    mux2 m25 (.sel(b[2]), .a(s1[5]), .b(1'b0), .out(s2[5]));
    mux2 m26 (.sel(b[2]), .a(s1[6]), .b(1'b0), .out(s2[6]));
    mux2 m27 (.sel(b[2]), .a(s1[7]), .b(1'b0), .out(s2[7]));

    assign y = s2;

endmodule