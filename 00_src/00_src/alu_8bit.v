module alu8bit (
    input wire [2:0] op,          // 3-bit operation code
    input wire [7:0] a,           // 8-bit operand a
    input wire [7:0] b,           // 8-bit operand b
    output wire [7:0] result,     // 8-bit result
    output wire [3:0] alu_flags,  // ALU flags (Negative, Zero, Carry, Overflow)
    output wire carry             // Carry flag
);

    // Operation codes
    parameter OP_ADD      = 3'b000;
    parameter OP_SUB      = 3'b001;
    parameter OP_AND      = 3'b010;
    parameter OP_OR       = 3'b011;
    parameter OP_NOT      = 3'b100;
    parameter OP_SLL      = 3'b101;
    parameter OP_SRL      = 3'b110;
    parameter OP_OUTPUT_A = 3'b111;

    // Intermediate signals
    wire [7:0] add_result, sub_result, and_result, or_result, not_result;
    wire [7:0] shift_left_result, shift_right_result;
    wire add_carry, sub_carry;
    reg [7:0] w_result;
    reg [3:0] w_alu_flags;
    reg w_carry;

    assign result = w_result;
    assign alu_flags = w_alu_flags;
    assign carry = w_carry;

    
    csa_8bit u_add (
        .a   (a),
        .b   (b),
        .sum   (add_result),
        .c_o(add_carry)
    );

    sub_8bit u_sub (
        .a   (a),
        .b   (b),
        .sub   (sub_result),
        .b_o (sub_carry)
    );

    and_8bit u_and (
        .a   (a),
        .b   (b),
        .c_o (and_result)
    );

    or_8bit u_or (
        .a   (a),
        .b   (b),
        .c_or (or_result)
    );

    not_8bit u_not (
        .a   (a),
        .y (not_result)
    );

    shift_left_8bit u_sll (
        .a   (a),
        .b   (b),
        .y   (shift_left_result)
    );

    shift_right_8bit u_srl (
        .a   (a),
        .b   (b),
        .y   (shift_right_result)
    );

    // --- ALU main control logic ---
    always @(*) begin
        w_carry = 1'b0;
        case (op)
            OP_ADD: begin
                w_result = add_result;
                w_carry  = add_carry;
            end
            OP_SUB: begin
                w_result = sub_result;
                w_carry  = sub_carry;
            end
            OP_AND:    w_result = and_result;
            OP_OR:     w_result = or_result;
            OP_NOT:    w_result = not_result;
            OP_SLL:    w_result = shift_left_result;
            OP_SRL:    w_result = shift_right_result;
            OP_OUTPUT_A: w_result = a;
            default: begin
                w_result = 8'b0;
                w_carry  = 1'b0;
            end
        endcase
    end

    assign w_alu_flags[3] = w_result[7];                 // N flag
    assign w_alu_flags[2] = (w_result == 8'b0);          // Z flag
    assign w_alu_flags[1] = w_carry;                     // C flag
    assign w_alu_flags[0] = (a[7] ^ b[7] ^ w_result[7]); // V flag (giả định theo XOR tạm thời)

endmodule

