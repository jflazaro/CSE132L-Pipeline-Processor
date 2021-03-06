`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2018 10:10:33 PM
// Design Name: 
// Module Name: Datapath
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



module Datapath #(
    parameter PC_W = 9, // Program Counter
    parameter INS_W = 32, // Instruction Width
    parameter RF_ADDRESS = 5, // Register File Address
    parameter DATA_W = 32, // Data WriteData
    parameter DM_ADDRESS = 9, // Data Memory Address
    parameter ALU_CC_W = 4 // ALU Control Code Width
    )(
    input logic /*Branch, */clk , reset , // global clock
                              // reset , sets the PC to zero
    RegWrite , MemtoReg ,     // Register file writing enable   // Memory or ALU MUX
    ALUSrc ,                  // Register file or Immediate MUX
    input logic [1:0] ALUOp, 
    input logic [1:0] MemWrite,    // Memory Writing Enable 
    input logic [2:0] MemRead,     // Memory Reading Enable                 
    input logic [ ALU_CC_W -1:0] ALU_CC, // ALU Control Code ( input of the ALU )
    output logic [6:0] opcode_IFID_Out,
    output logic [6:0] opcode_IDEX_Out,
    output logic [6:0] Funct7_IDEX_Out,
    output logic [2:0] Funct3_IFID_Out,
    output logic [DATA_W-1:0] WB_Data,
    output logic [1:0] ALUOp_Out,
//    output logic [ALU_CC_W-1:0] ALU_CC_Out,
//    output logic [PC_W-1:0] PC_IFID_In,
//    output logic [PC_W-1:0] PC_IFID_Out,
//    output logic [PC_W-1:0] PC_IDEX_Out,
//    output logic [DATA_W-1:0] SrcA_F,
//    output logic [DATA_W-1:0] Reg1_IDEX_Out,
//    output logic [DATA_W-1:0] SrcB,
//    output logic [DATA_W-1:0] SrcB_F,
//    output logic [DATA_W-1:0] Reg2_IDEX_Out,
//    output logic [DATA_W-1:0] ExtImm_IDEX_Out,
//    output logic [DATA_W-1:0] ALUResult,
    output logic [2:0] Funct3_IDEX_Out
//    output logic [RF_ADDRESS-1:0] RDest_MW_Out,
//    output logic [DATA_W-1:0] ReadData_MW_Out,
//    output logic [2:0] MemRead_EXM_Out,
//    output logic [1:0] MemWrite_EXM_Out,
//    output logic [DATA_W-1:0] register_file [31:0],
//    output logic [DATA_W-1:0] mem [(2**9)-1:0],
//    output logic [DATA_W-1:0] Result_inter,
//    output logic [DATA_W-1:0] ALUResult_EXM_Out,
//    output logic [DATA_W-1:0] ALUResult_MW_Out,
//    output logic [1:0] ForwardA, ForwardB,
//    output logic HazardSel
    );

logic [ALU_CC_W-1:0] ALU_CC_Out;

//// IF/ID Wires
logic Zero;
logic [PC_W-1:0] PC_IFID_In, PC_IFID_Out, PC_actual, PCPlus4_IFID_In, PCPlus4_IFID_Out, PC_inter;
logic [INS_W-1:0] Instr_IFID_In, Instr_IFID_Out;
logic [DATA_W-1:0] Result_inter, /*Result,*/ ALUResult_inter, ALUResult;
logic [DATA_W-1:0] Reg1, Reg2;
logic [DATA_W-1:0] ReadData;
logic [DATA_W-1:0] ExtImm;
logic [DATA_W-1:0] SrcB;
logic [4:0] RDest, RS1, RS2;

//// ID/EX Wires
logic ALUSrc_IDEX_Out, MemtoReg_IDEX_Out, RegWrite_IDEX_Out;//, Branch_IDEX_Out;
logic [1:0] MemWrite_IDEX_Out;
logic [2:0] MemRead_IDEX_Out;
logic [PC_W-1:0] PC_IDEX_Out, PCPlus4_IDEX_Out;
logic [DATA_W-1:0] Reg1_IDEX_Out, Reg2_IDEX_Out, ExtImm_IDEX_Out;
//logic [2:0] Funct3_IDEX_Out;
logic [RF_ADDRESS-1:0] RDest_IDEX_Out, RS1_IDEX_Out, RS2_IDEX_Out;
logic [6:0] Funct7;

//// EX/MEM Wires
logic MemtoReg_EXM_Out, RegWrite_EXM_Out;
logic [2:0] MemRead_EXM_Out;
logic [1:0] MemWrite_EXM_Out;
logic Zero_EXM_Out;
logic [DATA_W-1:0] ALUResult_EXM_Out, ALUResult_inter_EXM_Out, Reg2_EXM_Out;
logic [RF_ADDRESS-1:0] RDest_EXM_Out;
logic [PC_W-1:0] PC_EXM_Out, PCPlus4_EXM_Out;
logic [6:0] opcode_EXM_Out;
logic [DATA_W-1:0] ExtImm_EXM_Out;

//// MEM/WB Wires
logic MemtoReg_MW_Out, RegWrite_MW_Out;
logic [DATA_W-1:0] ReadData_MW_Out, ALUResult_MW_Out, ALUResult_inter_MW_Out;
logic [RF_ADDRESS-1:0] RDest_MW_Out;
logic [PC_W-1:0] PC_MW_Out;
logic [6:0] opcode_MW_Out;
logic [DATA_W-1:0] ExtImm_MW_Out;

//// Forwarding Wires
logic [1:0] ForwardA, ForwardB;
logic [DATA_W-1:0] SrcA_F, SrcB_F;

//// Hazard Detection Wires
logic PCWrite, IFIDWrite, HazardSel;
logic ALUSrc_Haz, MemtoReg_Haz, RegWrite_Haz;
logic [1:0] MemWrite_Haz, ALUOp_Haz;
logic [2:0] MemRead_Haz;


assign opcode_IFID_Out = Instr_IFID_Out[6:0];
assign Funct7 = Instr_IFID_Out[31:25];
assign Funct3_IFID_Out = Instr_IFID_Out[14:12];
assign RDest  = Instr_IFID_Out[11:7];
assign RS1    = Instr_IFID_Out[19:15];
assign RS2    = Instr_IFID_Out[24:20];
assign ALU_CC_Out = ALU_CC;

//// Forwarding Unit
ForwardingUnit f_unit (
    RS1_IDEX_Out, RS2_IDEX_Out, RDest_EXM_Out, RDest_MW_Out,
    RegWrite_EXM_Out, RegWrite_MW_Out,
    
    ForwardA, ForwardB
);
mux_forwardA mux_fA (
    ForwardA,
    Reg1_IDEX_Out, ALUResult_EXM_Out, WB_Data,
    SrcA_F
);
mux_forwardB mux_fB (
    ForwardB,
    Reg2_IDEX_Out, ALUResult_EXM_Out, WB_Data,
    SrcB_F
); 

//// Hazard Detection Unit
HazardDetectionUnit hd_unit (
    MemRead_IDEX_Out, RDest_IDEX_Out, RS1, RS2,
    PCWrite, IFIDWrite, HazardSel
);
mux_hazard mux_h (
    HazardSel, ALUSrc, MemtoReg, RegWrite,
    MemWrite, ALUOp,
    MemRead,
    
    ALUSrc_Haz, MemtoReg_Haz, RegWrite_Haz,
    MemWrite_Haz, ALUOp_Haz,
    MemRead_Haz
);

//// next PC
adder #(9) pcadd (PC_IFID_In, 9'b100, PCPlus4_IFID_In);
flopr #(9) pcreg(PCWrite, clk, reset, PC_actual, PC_IFID_In);
mux2  #(9) pcmux(PCPlus4_IFID_In, (PC_EXM_Out + (($signed({ExtImm_IDEX_Out[DATA_W-1],ExtImm_IDEX_Out[7:0]})))), ((Branch & Zero_EXM_Out)/*BR*/ || opcode_IFID_Out == 7'b1101111/*JAL*/), PC_inter);
mux2  #(9) pcmux2(PC_inter, ({ALUResult_EXM_Out[DATA_W-1],ALUResult_EXM_Out[7:0]} & ~(9'b1)), (opcode_IFID_Out == 7'b1100111/*JALR*/), PC_actual);

//// Instruction memory
instructionmemory instr_mem (PC_IFID_In, Instr_IFID_In);

//// IF/ID Reg
IfIdReg ifidreg(IFIDWrite, clk, PC_IFID_In, PCPlus4_IFID_In, Instr_IFID_In, PC_IFID_Out, PCPlus4_IFID_Out, Instr_IFID_Out);

//// Register File
RegFile rf(clk, reset, RegWrite_MW_Out, RDest_MW_Out, RS1, RS2,
        WB_Data, Reg1, Reg2);
        
mux2 #(32) resmux(ALUResult_inter_MW_Out, ReadData_MW_Out, MemtoReg_MW_Out, Result_inter);
mux2 #(32) resmux2(Result_inter, (ExtImm_MW_Out + PC_MW_Out), (opcode_MW_Out == 7'b0010111/*AUIPC*/), WB_Data);
           
//// sign extend
imm_Gen Ext_Imm (Instr_IFID_Out,ExtImm);

//// ID/EX Reg
IdExReg idexreg(
    clk,
    ALUSrc_Haz, MemtoReg_Haz, RegWrite_Haz,// Branch,
    MemWrite_Haz, ALUOp_Haz,
    MemRead_Haz,
    PC_IFID_Out, PCPlus4_IFID_Out,
    Reg1, Reg2, ExtImm,
    Funct3_IFID_Out,
    RDest, RS1, RS2,
    opcode_IFID_Out, Funct7,
    
    ALUSrc_IDEX_Out, MemtoReg_IDEX_Out, RegWrite_IDEX_Out,// Branch_IDEX_Out,
    MemWrite_IDEX_Out, ALUOp_Out,
    MemRead_IDEX_Out,
    PC_IDEX_Out, PCPlus4_IDEX_Out,
    Reg1_IDEX_Out, Reg2_IDEX_Out, ExtImm_IDEX_Out,
    Funct3_IDEX_Out,
    RDest_IDEX_Out, RS1_IDEX_Out, RS2_IDEX_Out,
    opcode_IDEX_Out, Funct7_IDEX_Out
);

//// ALU
mux2 #(32) srcbmux(SrcB_F, ExtImm_IDEX_Out, ALUSrc_IDEX_Out, SrcB);
mux2 #(32) aluresmux(ALUResult, {23'b0,PCPlus4_IDEX_Out}, (opcode_IDEX_Out == 7'b1101111 || opcode_IDEX_Out == 7'b1100111), ALUResult_inter); 
alu alu_module(SrcA_F, SrcB, ALU_CC, ALUResult, Zero);

//// EX/MEM Reg
ExMemReg exmemreg(
    clk,
    MemtoReg_IDEX_Out, RegWrite_IDEX_Out,
    MemRead_IDEX_Out,
    MemWrite_IDEX_Out,
    Zero, ALUResult, ALUResult_inter, SrcB_F, 
    RDest_IDEX_Out,
    PC_IDEX_Out, PCPlus4_IDEX_Out,
    opcode_IDEX_Out,
    ExtImm_IDEX_Out,
    
    MemtoReg_EXM_Out, RegWrite_EXM_Out,
    MemRead_EXM_Out,
    MemWrite_EXM_Out,
    Zero_EXM_Out, ALUResult_EXM_Out, ALUResult_inter_EXM_Out, Reg2_EXM_Out, 
    RDest_EXM_Out,
    PC_EXM_Out, PCPlus4_EXM_Out,
    opcode_EXM_Out,
    ExtImm_EXM_Out
);

//// Data memory 
datamemory data_mem (clk, MemRead_EXM_Out, MemWrite_EXM_Out, ALUResult_inter_EXM_Out[DM_ADDRESS-1:0], Reg2_EXM_Out, ReadData);

//// MEM/WB Reg
MemWbReg memwbreg(
    clk,
    MemtoReg_EXM_Out, RegWrite_EXM_Out,
    ReadData, ALUResult_EXM_Out, ALUResult_inter_EXM_Out,
    RDest_EXM_Out,
    PC_EXM_Out,
    opcode_EXM_Out,
    ExtImm_EXM_Out,
    
    MemtoReg_MW_Out, RegWrite_MW_Out,
    ReadData_MW_Out, ALUResult_MW_Out, ALUResult_inter_MW_Out,
    RDest_MW_Out,
    PC_MW_Out,
    opcode_MW_Out,
    ExtImm_MW_Out
);
     
endmodule