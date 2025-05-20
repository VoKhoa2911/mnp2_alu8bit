module testbench;
    reg clk;
    reg rst_n;
    reg [2:0] op;
    reg [7:0] a, b;
    wire [7:0] result;
    wire [3:0] alu_flag;
    wire carry;

    // ALU Operation codes
    parameter OP_ADD      = 3'b000;
    parameter OP_SUB      = 3'b001;
    parameter OP_AND      = 3'b010;
    parameter OP_OR       = 3'b011;
    parameter OP_NOT      = 3'b100;
    parameter OP_SLL      = 3'b101;
    parameter OP_SRL      = 3'b110;
    parameter OP_OUTPUT_A = 3'b111;

    // UUT
    synth_wrapper uut (
        .clk(clk),
        .rst_n(rst_n),
        .op(op),
        .a(a),
        .b(b),
        .result(result),
        .alu_flag(alu_flag),
        .carry(carry)
    );

    // Clock generator
    always #5 clk = ~clk;

    integer i;
    reg [7:0] expected;

    initial begin
        clk = 0;
        rst_n = 0;
        op = 0;
        a = 0;
        b = 0;

        #10 rst_n = 1;

        // Chạy 100 test case ngẫu nhiên
        repeat (100) begin
            #10;
            a = $random;
            b = $random;
            op = $random % 8;

            // Chờ 1 chu kỳ để đảm bảo result cập nhật
            #10;

            case (op)
                OP_ADD:      expected = a + b;
                OP_SUB:      expected = a - b;
                OP_AND:      expected = a & b;
                OP_OR:       expected = a | b;
                OP_NOT:      expected = ~a;
                OP_SLL:      expected = a << b[2:0];
                OP_SRL:      expected = a >> b[2:0];
                OP_OUTPUT_A: expected = a;
                default:     expected = 8'hxx;
            endcase

            if (result === expected)
                $display("PASS: op = %b, a = %h, b = %h => result = %h", op, a, b, result);
            else
                $display("FAIL: op = %b, a = %h, b = %h => expected = %h, got = %h", op, a, b, expected, result);
        end

        $finish;
    end
endmodule