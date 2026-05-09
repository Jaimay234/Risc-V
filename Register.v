module register (
	input [4:0] read_x,
	input [4:0] read_y,
	input [4:0] write_loc,
	input [31:0] data_in,
	input clk,
	input write_en,
	output reg [31:0] out_x,
	output reg [31:0] out_y
);

reg [31:0] reg_array [31:0];

integer i;
initial begin
for (i = 0; i < 32; i = i + 1)
	reg_array[i] = 32'b0;
end
always @(*) begin
	out_x = reg_array[read_x];
	out_y = reg_array[read_y];
end

always @(posedge clk) begin
	if(write_en)
		reg_array[write_loc] <= data_in;
end

endmodule
