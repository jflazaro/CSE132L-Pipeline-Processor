`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2018 05:32:24 PM
// Design Name: 
// Module Name: HazardDetectionUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module HazardDetectionUnit(
    input logic [2:0] MemRead_IDEX,
    input logic [4:0] RDest_IDEX, RS1_IFID, RS2_IFID,
    output logic PCWrite, IFIDWrite, HazardSel
    );

always_comb begin  
    if ((MemRead_IDEX != 3'b101) && ((RDest_IDEX == RS1_IFID) || (RDest_IDEX == RS2_IFID))) begin
        PCWrite <= 1;
        IFIDWrite <= 1;
        HazardSel <= 1;
    end
    else begin
        PCWrite <= 0;
        IFIDWrite <= 0;
        HazardSel <= 0;
    end
end
endmodule
