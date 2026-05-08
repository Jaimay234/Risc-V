module alu ( 
input [31:0] X,
input [31:0] Y,
input add_sub, //0 = add, 1 = sub
input [1:0] logic_func, //00 = AND, 01 = OR, 10 = XOR, 11 = NOR
input [1:0] func, // 00 = lui, 01 = setless, 10 = arith, 11 = logic
output reg [31:0] output_out,
output reg overflow,
output reg zero
);

reg [31:0] arith_out;
reg [31:0] logic_out;

always @(*) begin
	case(func)
	2'b00    : output_out = Y;
	2'b01    : output_out = {31'b0,(X[31] != Y[31]) ? X[31] : arith_out[31]};
	2'b10    : output_out = arith_out;
	2'b11    : output_out = logic_out;
	default  : output_out = arith_out;
	endcase
	zero = (output_out == 0);
end

always @(*) begin //addition and subtraction section

	if(add_sub) begin
		arith_out = X-Y;
		overflow = (X[31] != Y[31]) && (arith_out[31] != X[31]);
	end else begin
		arith_out = X+Y;
		overflow = (X[31] == Y[31]) && (arith_out[31] == X[31]);
	end
end


always @(*) begin // logical operations

	case(logic_func)
	2'b00    : logic_out = X & Y;
	2'b01    : logic_out = X | Y;
	2'b10    : logic_out = X ^ Y;
	2'b11    : logic_out = ~(X | Y);
	default  : logic_out = X & Y;
	endcase
end

endmodule
