`timescale 1ns/1ps
module UnsignedMultiplier(  clk, dataA, dataB, reset, dataOut, signal );
input clk, reset;
input[31:0] dataA, dataB;
input[5:0] signal;
output reg [63:0] dataOut;
reg [63:0] product;
reg [4:0] counter;
reg [31:0] dataA_wire;
reg [31:0] temp;
reg [5:0] prev_signal;
parameter MUL = 6'b011001;

always @( posedge clk or posedge reset ) begin
        if ( reset )
            begin
            product <= 64'h0; // 將乘積 product 初始化為 0
            product <= 64'b0;
            counter <= 5'b0;
            prev_signal <= 6'b0;
            dataA_wire <= dataA;
            end 
            
        else
            begin
            if (signal == MUL && prev_signal != MUL ) begin
                counter <= 6'b0; // 重置 counter
                product <= 64'b0;
                dataA_wire <= dataA;
            end 
            else begin
                if ( counter < 6'b100000 )begin
                    if ( dataA_wire[0] == 1'b1 )begin
                            temp = product[63:32] + dataB;
                            product = {product[63:32], temp };
                        end // if 
                    dataA_wire <= dataA_wire >> 1;
                    product <= product >> 1;
                    counter <= counter + 1;
  

                    end
                else begin
                        dataOut <= product;
                    end
            end
                    
            end
    
    end

endmodule