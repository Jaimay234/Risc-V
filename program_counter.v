module pc (
	input [31:0] pc_in,
	input [31:0] target_in,
	input [31:0] rs_in,
	input [31:0] rt_in,
	input [1:0] branch_type,
	input [1:0] pc_sel,
	output reg [31:0] next_addr
);

reg [31:0] temp_out;
always @ (*) begin
	case(branch_type)
	2'b00    : temp_out = pc_in +1;
	2'b01    : begin
			if(rs_in == rt_in)
				temp_out = target_in + pc_in + 1;
			else
				temp_out = pc_in + 1;
			end
	2'b10    : begin
			if(rs_in != rt_in)
				temp_out = pc_in + target_in + 1;
			else
				temp_out = pc_in + 1;
			end
	2'b11    : begin
			if (rs_in[31])
				temp_out = pc_in + target_in + 1;
			else
				temp_out = pc_in + 1;
			end
	default  : temp_out = pc_in + 1;
	endcase
end

always @ (*) begin
	case(pc_sel)
	2'b00    : next_addr = temp_out;
	2'b01    : next_addr = target_in;
	2'b10    : next_addr = rs_in;
	default  : next_addr = temp_out;
	endcase

end
endmodule 