`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2018 12:30:06 AM
// Design Name: 
// Module Name: MemWbReg
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


module MemWbReg #(
    parameter PC_W = 9,
    parameter RF_ADDRESS = 5, // Register File Address
    parameter DATA_W = 32 // Data WriteData
    )(
    input logic clk,
    
    input logic MemtoReg, RegWrite,
    input logic [DATA_W-1:0] ReadData, ALUResult_EXM, ALUResult_inter_EXM,
    input logic [RF_ADDRESS-1:0] RDest,
    input logic [PC_W-1:0] PC_EXM,
    input logic [6:0] opcode_EXM,
    input logic [DATA_W-1:0] ExtImm_EXM,
    
    output logic MemtoReg_MW_Out, RegWrite_MW_Out,
    output logic [DATA_W-1:0] ReadData_MW_Out, ALUResult_MW_Out, ALUResult_inter_MW_Out,
    output logic [RF_ADDRESS-1:0] RDest_MW_Out,
    output logic [PC_W-1:0] PC_MW_Out,
    output logic [6:0] opcode_MW_Out,
    output logic [DATA_W-1:0] ExtImm_MW_Out
    );
    
always @(posedge clk) begin
    MemtoReg_MW_Out <= MemtoReg;
    RegWrite_MW_Out <= RegWrite;
    ReadData_MW_Out <= ReadData;
    ALUResult_MW_Out <= ALUResult_EXM;
    ALUResult_inter_MW_Out <= ALUResult_inter_EXM;
    RDest_MW_Out <= RDest;
    PC_MW_Out <= PC_EXM;
    opcode_MW_Out <= opcode_EXM;
    ExtImm_MW_Out <= ExtImm_EXM;
end
    
//assign MemtoReg_MW_Out = MemtoReg;
//assign RegWrite_MW_Out = RegWrite;
//assign ReadData_MW_Out = ReadData;
//assign ALUResult_MW_Out = ALUResult_EXM;
//assign ALUResult_inter_MW_Out = ALUResult_inter_EXM;
//assign RDest_MW_Out = RDest;
    
endmodule
