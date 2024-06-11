module Hazard_detect_unit( IF_ID_RegisterRs,  IF_ID_RegisterRt,  ID_EX_MemRead,  ID_EX_RegisterRt,  PCWrite, IF_ID_Write, stall );

    input [4:0] IF_ID_RegisterRs;
    input [4:0] IF_ID_RegisterRt;
    input ID_EX_MemRead;
    input [4:0] ID_EX_RegisterRt;
    
    
    output reg PCWrite;
    output reg IF_ID_Write;
    output reg stall;


always @(IF_ID_RegisterRs,  IF_ID_RegisterRt,  ID_EX_MemRead,  ID_EX_RegisterRt ) begin


    if (ID_EX_MemRead && ((ID_EX_RegisterRt == IF_ID_RegisterRs) || (ID_EX_RegisterRt == IF_ID_RegisterRt))) begin
        stall = 1;
        IF_ID_Write = 0;
        PCWrite = 0;
    end
    else begin
        stall = 0;
        IF_ID_Write = IF_ID_Write;
        PCWrite = PCWrite;
    end
end

endmodule