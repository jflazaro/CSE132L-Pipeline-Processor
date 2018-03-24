`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2018 05:55:45 PM
// Design Name: 
// Module Name: mux_hazard
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


module mux_hazard(
    input logic HazardSel, ALUSrc, MemtoReg, RegWrite,// Branch,
    input logic [1:0] MemWrite, ALUOp,
    input logic [2:0] MemRead,
    
    output logic ALUSrc_Haz, MemtoReg_Haz, RegWrite_Haz,
    output logic [1:0] MemWrite_Haz, ALUOp_Haz,
    output logic [2:0] MemRead_Haz
    );
    
assign ALUSrc_Haz = HazardSel ? 0 : ALUSrc;
assign MemtoReg_Haz = HazardSel ? 0 : MemtoReg;
assign RegWrite_Haz = HazardSel ? 0 : RegWrite;
assign MemWrite_Haz = HazardSel ? 2'b11 : MemWrite;
assign ALUOp_Haz = HazardSel ? 0 : ALUOp;
assign MemRead_Haz = HazardSel ? 3'b101 : MemRead;//
endmodule
