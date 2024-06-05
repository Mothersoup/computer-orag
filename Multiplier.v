`timescale 1ns/1ps
module Multiplier( clk, dataA, dataB, signal, dataOut, reset );
input clk, reset;
input[5:0] signal;
input[31:0] dataA, dataB;
output reg [63:0] dataOut;
reg [63:0] product;
reg [5:0] counter;
reg [31:0] dataA_reg;
reg [31:0] temp;
reg [31:0] shiftHelper;
parameter MULTU = 6'b011001;
parameter OUT = 6'b111111;

always @( posedge clk or posedge reset ) begin
        if ( reset )
            begin
            product = 64'b0;
            counter = 5'b0;
            dataOut = 64'b0;

            end 
            
        else begin
                case ( signal )
                    MULTU:
                    begin
                        if ( counter == 6'b0 ) begin
                            dataA_reg = dataA;  // apply value 
                            temp      = dataB;
                            product   = 64'b0 ;
                        end 
                         if ( counter <  6'b100000  ) begin
                            if ( dataA_reg[0] == 1'b1  ) begin
                                    shiftHelper  = product[63:32] + temp;
                                    product[63:0] = { shiftHelper, product[31:0] };
                            end
                                    product = product >> 1;
                                    dataA_reg = dataA_reg >> 1;
                            counter = counter + 1;
                        end 
                        
                    end 
                    OUT: // 會少一次在out 做
                        begin
                            if ( dataA_reg[0] == 1'b1  ) begin
                                    shiftHelper  = product[63:32] + temp;
                                    product[63:32] = { shiftHelper, product[31:0] };
                                    temp = temp >> 1;
                                    product = product >> 1;
                                end 
                            dataOut = product;
                            counter = 0;
                        end 
                    default 
                    begin 
                    end
                endcase 
            
            
            
             end 
    
    end

endmodule