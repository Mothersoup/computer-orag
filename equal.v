module equal ( a, b, eq );
    input wire [31:0] a;  
    input wire [31:0] b;
    output wire eq ;       
    assign eq = (a == b);

endmodule