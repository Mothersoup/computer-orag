module mux4to1( s, in1, in2, in3, in4, o );
input [1:0] s;	// 2 bit 
input in1;
input in2;
input in3;
input in4;
output o;
wire o;
 
    assign o = (s == 2'b00) ? in1 :
               (s == 2'b01) ? in2 :
               (s == 2'b10) ? in3 :
                              in4;



endmodule