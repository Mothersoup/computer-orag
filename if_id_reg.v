module if_id_reg( clk, rst,  if_id_write, if_flush, pc_incr, ins, pc_out, ins_out );
// total 64 bits
// signal 
input clk , rst, if_id_write, if_flush;

// input PC & instruction
input [31:0]pc_incr, ins;

// output PC & instrction 
output reg [31:0]pc_out, ins_out;

reg32 PC_id_if( clk.(clk), .rst(rst), .en_reg( if_id_write ), .d_in(pc_incr), .d_out(pc_out) );
reg32 Ins_id_if( clk.(clk), .rst(rst), .en_reg( if_flush ), .d_in( ins ), .d_out( ins_out ) );

endmodule 
