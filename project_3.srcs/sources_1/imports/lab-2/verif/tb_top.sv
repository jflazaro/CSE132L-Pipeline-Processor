`timescale 1ns / 1ps

module tb_top;

//clock and reset signal declaration
  logic tb_clk, reset;
  logic [31:0] tb_WB_Data/*, tb_ALU_Result, tb_Reg1, tb_Reg2*/;
  logic [3:0] tb_ALU_CC;
  logic [8:0] tb_PC_IDEX_Out;
  logic [31:0] tb_Reg1_IDEX_Out;
  logic [31:0] tb_SrcB;
  logic [31:0] tb_ALUResult;
  logic [4:0] tb_RDest_MW_Out;
  logic [31:0] tb_Result_inter;
  logic [31:0] tb_ALUResult_EXM_Out;
  logic [31:0] tb_ALUResult_MW_Out;
  /*logic tb_Zero;
  logic [2:0] tb_Mem_Read;
  logic [1:0] tb_Mem_Write;
  logic [3:0] tb_Operation;
  logic [8:0] tb_PC;
  logic [31:0] tb_ExtImm;
  logic [1:0] tb_ALUop;*/
  
    //clock generation
  always #5 tb_clk = ~tb_clk; // #10
  
  //reset Generation
  initial begin
    tb_clk = 0;
    reset = 1;
    #15 reset =0; //#25
  end
  
  
  riscv riscV(
      .clk(tb_clk),
      .reset(reset),
      .WB_Data(tb_WB_Data),
      .ALU_CC(tb_ALU_CC),
      .PC_IDEX_Out(tb_PC_IDEX_Out),
      .Reg1_IDEX_Out(tb_Reg1_IDEX_Out),
      .SrcB(tb_SrcB),
      .ALUResult(tb_ALUResult),
      .RDest_MW_Out(tb_RDest_MW_Out),
      .Result_inter(tb_Result_inter),
      .ALUResult_EXM_Out(tb_ALUResult_EXM_Out),
      .ALUResult_MW_Out(tb_ALUResult_MW_Out)
      /*
      .Zero(tb_Zero),
      .MemRead(tb_Mem_Read),
      .MemWrite(tb_Mem_Write),
      .Reg1(tb_Reg1),
      .Reg2(tb_Reg2),
      .Operation(tb_Operation),
      .PC(tb_PC),
      .ExtImm(tb_ExtImm),
      .ALUop(tb_ALUop)*/
     );

  initial begin
    #1000;
    $finish;
   end
endmodule
