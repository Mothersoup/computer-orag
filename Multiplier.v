`timescale 1ns/1ps
module UnsignedMultiplier(  clk, dataA, dataB, reset, dataOut );
input clk, reset;
input[31:0] dataA, dataB;
output reg [63:0] dataOut;
reg [63:0] product;
reg [5:0] counter;
reg [31:0] dataA_wire;
reg [31:0] temp;

always @( posedge clk or posedge reset ) begin
        if ( reset )
            begin
            product <= 64'h0; // 將乘積 product 初始化為 0
            product <= 64'b0;
            counter <= 5'b0;
            dataA_wire <= dataA;
            dataOut <= 64'b0;

            end 
            
        else
            begin
            
                if ( counter < 6'b100000 )
                    begin
                    if ( dataA_wire[0] == 1'b1 )
                        begin
                            temp = product[63:32] + dataB;
                            product = {temp, product[31:0] };
                                                                                    

                        end // if 
                        
                    dataA_wire <= {1'b0, dataA_wire[31:1]};
                    product <= {1'b0, product[63:1]};
                    counter <= counter + 1;
            
                                                                                           
                    end
                else
                    begin

                        dataOut <= product;
                                                                                          
                    end
                    
            end
    
    end

endmodule