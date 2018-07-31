`timescale 1ns / 1ps

module riscv #(
    parameter DATA_W = 32)
    (input logic clk, reset, // clock and reset signals
    output logic [DATA_W-1:0] WB_Data //The ALU_Result
//    output logic [3:0] ALU_CC,
//    output logic [8:0] PC_IFID_In,
//    output logic [8:0] PC_IFID_Out,
//    output logic [8:0] PC_IDEX_Out,
//    output logic [DATA_W-1:0] SrcA_F,
//    output logic [DATA_W-1:0] Reg1_IDEX_Out,
//    output logic [DATA_W-1:0] SrcB,
//    output logic [DATA_W-1:0] SrcB_F,
//    output logic [DATA_W-1:0] Reg2_IDEX_Out,
//    output logic [DATA_W-1:0] ExtImm_IDEX_Out,
//    output logic [DATA_W-1:0] ALUResult,
//    output logic [4:0] RDest_MW_Out,
//    output logic [2:0] MemRead_EXM_Out,
//    output logic [1:0] MemWrite_EXM_Out,
//    output logic [DATA_W-1:0] ReadData_MW_Out,
//    output logic [DATA_W-1:0] register_file [31:0],
//    output logic [DATA_W-1:0] mem [(2**9)-1:0],
//    output logic [DATA_W-1:0] Result_inter,
//    output logic [DATA_W-1:0] ALUResult_EXM_Out,
//    output logic [DATA_W-1:0] ALUResult_MW_Out,
//    output logic [1:0] ForwardA,
//    output logic [1:0] ForwardB,
//    output logic HazardSel
    /*output logic [DATA_W-1:0] ALU_Result,
    output logic Zero,
    output logic [2:0] MemRead,
    output logic [1:0] MemWrite,
    output logic [DATA_W-1:0] Reg1,Reg2,
    output logic [3:0] Operation,
    output logic [8:0] PC,
    output logic [DATA_W-1:0] ExtImm,
    output logic [1:0] ALUop*/
    );

logic [6:0] opcode_IFID_Out;
logic [6:0] opcode_IDEX_Out;
logic [2:0] MemRead;
logic [1:0] MemWrite, ALUOp;
logic ALUSrc, MemtoReg, RegWrite/*, Branch*/;
logic [1:0] ALUop, ALUOp_IDEX;
logic [6:0] Funct7_IDEX_Out;
logic [2:0] Funct3_IFID_Out;
logic [2:0] Funct3_IDEX_Out;
logic [3:0] Operation;

Controller c(opcode_IFID_Out, Funct3_IFID_Out, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, /*Branch,*/ ALUop);

ALUController ac(ALUOp_IDEX, Funct7_IDEX_Out, Funct3_IDEX_Out, opcode_IDEX_Out, Operation);

Datapath dp(/*Branch,*/ 
            clk, 
            reset, 
            RegWrite , 
            MemtoReg, 
            ALUSrc , 
            ALUop, 
            MemWrite, 
            MemRead, 
            Operation, 
            opcode_IFID_Out, 
            opcode_IDEX_Out, 
            Funct7_IDEX_Out, 
            Funct3_IFID_Out, 
            WB_Data, 
            ALUOp_IDEX, 
//            ALU_CC, 
//            PC_IFID_In, 
//            PC_IFID_Out,
//            PC_IDEX_Out,
//            SrcA_F, 
//            Reg1_IDEX_Out,
//            SrcB, 
//            SrcB_F,
//            Reg2_IDEX_Out,
//            ExtImm_IDEX_Out,
//            ALUResult, 
            Funct3_IDEX_Out
//            RDest_MW_Out, 
//            ReadData_MW_Out,
//            MemRead_EXM_Out,
//            MemWrite_EXM_Out,
//            register_file,
//            mem,
//            Result_inter, 
//            ALUResult_EXM_Out, 
//            ALUResult_MW_Out,
//            ForwardA,
//            ForwardB,
//            HazardSel
            );
        
endmodule
