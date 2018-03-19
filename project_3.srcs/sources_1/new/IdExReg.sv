`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2018 06:06:22 PM
// Design Name: 
// Module Name: IdExReg
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


module IdExReg #(
    parameter PC_W = 9, // Program Counter
    parameter INS_W = 32, // Instruction Width
    parameter RF_ADDRESS = 5, // Register File Address
    parameter DATA_W = 32 // Data WriteData
    )(
    input logic clk,
    
    input logic ALUSrc, MemtoReg, RegWrite,// Branch,
    input logic [1:0] MemWrite, ALUOp,
    input logic [2:0] MemRead,
    input logic [PC_W-1:0] PC_IFID, PCPlus4_IFID,
    input logic [DATA_W-1:0] Reg1, Reg2, ExtImm,
    input logic [2:0] Funct3_IFID,
    input logic [RF_ADDRESS-1:0] RDest_IFID, RS1_IFID, RS2_IFID,
    input logic [3:0] ALU_CC,
    
    output logic ALUSrc_Out, MemtoReg_Out, RegWrite_Out, //Branch_Out,
    output logic [1:0] MemWrite_Out, ALUOp_Out,
    output logic [2:0] MemRead_Out,
    output logic [PC_W-1:0] PC_IDEX_Out, PCPlus4_IDEX_Out,
    output logic [DATA_W-1:0] Reg1_Out, Reg2_Out, ExtImm_Out,
    output logic [2:0] Funct3_IDEX_Out,
    output logic [RF_ADDRESS-1:0] RDest_IDEX_Out, RS1_IDEX_Out, RS2_IDEX_Out,
    output logic [3:0] ALU_CC_Out
    );

assign ALUSrc_Out = ALUSrc;
assign MemtoReg_Out = MemtoReg;
assign RegWrite_Out = RegWrite;
//assign Branch_Out = Branch;
assign MemWrite_Out = MemWrite;
assign ALUOp_Out = ALUOp;
assign MemRead_Out = MemRead;
assign PC_IDEX_Out = PC_IFID;
assign PCPlus4_IDEX_Out = PCPlus4_IFID;
assign Reg1_Out = Reg1;
assign Reg2_Out = Reg2;
assign ExtImm_Out = ExtImm;
assign Funct3_IDEX_Out = Funct3_IFID;
assign RDest_IDEX_Out = RDest_IFID;
assign RS1_IDEX_Out = RS1_IFID;
assign RS2_IDEX_Out = RS2_IFID;
assign ALU_CC_Out = ALU_CC;

endmodule
