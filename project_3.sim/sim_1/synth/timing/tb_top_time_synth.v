// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Fri Feb 23 15:02:54 2018
// Host        : Josh-ASUS running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {C:/Users/joshu/OneDrive/Documents/Winter
//               2018/CSE 132L/project_3/project_3.sim/sim_1/synth/timing/tb_top_time_synth.v}
// Design      : riscv
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module Datapath
   (ALU_Result_OBUF,
    WB_Data_OBUF,
    CLK,
    clear);
  output [3:0]ALU_Result_OBUF;
  output [4:0]WB_Data_OBUF;
  input CLK;
  input clear;

  wire [3:0]ALU_Result_OBUF;
  wire CLK;
  wire [5:5]Funct7;
  wire [8:2]PC;
  wire [4:0]WB_Data_OBUF;
  wire clear;
  wire [8:2]d;
  wire instr_mem_n_2;
  wire [5:0]opcode;

  instructionmemory instr_mem
       (.Funct7(Funct7),
        .\WB_Data[3] (instr_mem_n_2),
        .opcode({opcode[5],opcode[0]}),
        .out(PC));
  adder pcadd
       (.D(d),
        .out(PC));
  flopr pcreg
       (.ALU_Result_OBUF(ALU_Result_OBUF),
        .CLK(CLK),
        .D(d),
        .Funct7(Funct7),
        .Q(PC),
        .WB_Data_OBUF(WB_Data_OBUF),
        .clear(clear),
        .opcode({opcode[5],opcode[0]}),
        .\q_reg[7]_0 (instr_mem_n_2));
endmodule

module adder
   (D,
    out);
  output [6:0]D;
  input [6:0]out;

  wire [6:0]D;
  wire [6:0]out;
  wire \q[8]_i_2_n_0 ;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \q[2]_i_1 
       (.I0(out[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \q[3]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \q[4]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(out[2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \q[5]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(out[2]),
        .I3(out[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \q[6]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(out[1]),
        .I3(out[3]),
        .I4(out[4]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \q[7]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(out[2]),
        .I4(out[4]),
        .I5(out[5]),
        .O(D[5]));
  LUT3 #(
    .INIT(8'h78)) 
    \q[8]_i_1 
       (.I0(\q[8]_i_2_n_0 ),
        .I1(out[5]),
        .I2(out[6]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[8]_i_2 
       (.I0(out[4]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(out[1]),
        .I4(out[3]),
        .O(\q[8]_i_2_n_0 ));
endmodule

module flopr
   (ALU_Result_OBUF,
    Q,
    WB_Data_OBUF,
    \q_reg[7]_0 ,
    opcode,
    Funct7,
    D,
    CLK,
    clear);
  output [3:0]ALU_Result_OBUF;
  output [6:0]Q;
  output [4:0]WB_Data_OBUF;
  input \q_reg[7]_0 ;
  input [1:0]opcode;
  input [0:0]Funct7;
  input [6:0]D;
  input CLK;
  input clear;

  wire [3:0]ALU_Result_OBUF;
  wire CLK;
  wire [6:0]D;
  wire [0:0]Funct7;
  wire [6:0]Q;
  wire [4:0]WB_Data_OBUF;
  wire clear;
  wire [1:0]opcode;
  wire \q_reg[7]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \ALU_Result_OBUF[11]_inst_i_1 
       (.I0(\q_reg[7]_0 ),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[1]),
        .O(ALU_Result_OBUF[1]));
  LUT4 #(
    .INIT(16'h0200)) 
    \ALU_Result_OBUF[2]_inst_i_1 
       (.I0(\q_reg[7]_0 ),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[0]),
        .O(ALU_Result_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \ALU_Result_OBUF[31]_inst_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(\q_reg[7]_0 ),
        .O(ALU_Result_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \WB_Data_OBUF[0]_inst_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(\q_reg[7]_0 ),
        .O(WB_Data_OBUF[0]));
  LUT6 #(
    .INIT(64'h0000000002000000)) 
    \WB_Data_OBUF[11]_inst_i_1 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(opcode[0]),
        .I4(Funct7),
        .I5(opcode[1]),
        .O(ALU_Result_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \WB_Data_OBUF[2]_inst_i_1 
       (.I0(\q_reg[7]_0 ),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[0]),
        .O(WB_Data_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \WB_Data_OBUF[31]_inst_i_1 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(\q_reg[7]_0 ),
        .O(WB_Data_OBUF[4]));
  LUT6 #(
    .INIT(64'h0000000002000000)) 
    \WB_Data_OBUF[3]_inst_i_1 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(opcode[0]),
        .I4(Funct7),
        .I5(opcode[1]),
        .O(WB_Data_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \WB_Data_OBUF[8]_inst_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(\q_reg[7]_0 ),
        .O(WB_Data_OBUF[3]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(clear),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(clear),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(clear),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(clear),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(clear),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(clear),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(clear),
        .D(D[6]),
        .Q(Q[6]));
endmodule

module instructionmemory
   (opcode,
    \WB_Data[3] ,
    Funct7,
    out);
  output [1:0]opcode;
  output \WB_Data[3] ;
  output [0:0]Funct7;
  input [6:0]out;

  wire [0:0]Funct7;
  wire \WB_Data[3] ;
  wire [1:0]opcode;
  wire [6:0]out;

  LUT6 #(
    .INIT(64'h0000000100010001)) 
    \WB_Data_OBUF[11]_inst_i_2 
       (.I0(out[4]),
        .I1(out[3]),
        .I2(out[6]),
        .I3(out[5]),
        .I4(out[1]),
        .I5(out[2]),
        .O(opcode[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \WB_Data_OBUF[11]_inst_i_3 
       (.I0(\WB_Data[3] ),
        .I1(out[0]),
        .I2(out[2]),
        .I3(out[1]),
        .O(Funct7));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \WB_Data_OBUF[11]_inst_i_4 
       (.I0(\WB_Data[3] ),
        .I1(out[2]),
        .I2(out[1]),
        .I3(out[0]),
        .O(opcode[1]));
  LUT4 #(
    .INIT(16'h0001)) 
    \WB_Data_OBUF[31]_inst_i_2 
       (.I0(out[5]),
        .I1(out[6]),
        .I2(out[3]),
        .I3(out[4]),
        .O(\WB_Data[3] ));
endmodule

(* DATA_W = "32" *) 
(* NotValidForBitStream *)
module riscv
   (clk,
    reset,
    WB_Data,
    ALU_Result,
    Zero,
    MemRead,
    MemWrite,
    Reg1,
    Reg2);
  input clk;
  input reset;
  output [31:0]WB_Data;
  output [31:0]ALU_Result;
  output Zero;
  output [2:0]MemRead;
  output [1:0]MemWrite;
  output [31:0]Reg1;
  output [31:0]Reg2;

  wire [31:0]ALU_Result;
  wire [8:0]ALU_Result_OBUF;
  wire [2:0]MemRead;
  wire [1:0]MemWrite;
  wire [31:0]Reg1;
  wire [31:0]Reg2;
  wire [31:0]WB_Data;
  wire [9:0]WB_Data_OBUF;
  wire Zero;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire reset;
  wire reset_IBUF;

initial begin
 $sdf_annotate("tb_top_time_synth.sdf",,,,"tool_control");
end
  OBUF \ALU_Result_OBUF[0]_inst 
       (.I(ALU_Result_OBUF[0]),
        .O(ALU_Result[0]));
  OBUF \ALU_Result_OBUF[10]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[10]));
  OBUF \ALU_Result_OBUF[11]_inst 
       (.I(ALU_Result_OBUF[1]),
        .O(ALU_Result[11]));
  OBUF \ALU_Result_OBUF[12]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[12]));
  OBUF \ALU_Result_OBUF[13]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[13]));
  OBUF \ALU_Result_OBUF[14]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[14]));
  OBUF \ALU_Result_OBUF[15]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[15]));
  OBUF \ALU_Result_OBUF[16]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[16]));
  OBUF \ALU_Result_OBUF[17]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[17]));
  OBUF \ALU_Result_OBUF[18]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[18]));
  OBUF \ALU_Result_OBUF[19]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[19]));
  OBUF \ALU_Result_OBUF[1]_inst 
       (.I(ALU_Result_OBUF[1]),
        .O(ALU_Result[1]));
  OBUF \ALU_Result_OBUF[20]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[20]));
  OBUF \ALU_Result_OBUF[21]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[21]));
  OBUF \ALU_Result_OBUF[22]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[22]));
  OBUF \ALU_Result_OBUF[23]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[23]));
  OBUF \ALU_Result_OBUF[24]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[24]));
  OBUF \ALU_Result_OBUF[25]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[25]));
  OBUF \ALU_Result_OBUF[26]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[26]));
  OBUF \ALU_Result_OBUF[27]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[27]));
  OBUF \ALU_Result_OBUF[28]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[28]));
  OBUF \ALU_Result_OBUF[29]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[29]));
  OBUF \ALU_Result_OBUF[2]_inst 
       (.I(ALU_Result_OBUF[2]),
        .O(ALU_Result[2]));
  OBUF \ALU_Result_OBUF[30]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[30]));
  OBUF \ALU_Result_OBUF[31]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[31]));
  OBUF \ALU_Result_OBUF[3]_inst 
       (.I(ALU_Result_OBUF[1]),
        .O(ALU_Result[3]));
  OBUF \ALU_Result_OBUF[4]_inst 
       (.I(1'b0),
        .O(ALU_Result[4]));
  OBUF \ALU_Result_OBUF[5]_inst 
       (.I(1'b0),
        .O(ALU_Result[5]));
  OBUF \ALU_Result_OBUF[6]_inst 
       (.I(1'b0),
        .O(ALU_Result[6]));
  OBUF \ALU_Result_OBUF[7]_inst 
       (.I(1'b0),
        .O(ALU_Result[7]));
  OBUF \ALU_Result_OBUF[8]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[8]));
  OBUF \ALU_Result_OBUF[9]_inst 
       (.I(ALU_Result_OBUF[8]),
        .O(ALU_Result[9]));
  OBUF \MemRead_OBUF[0]_inst 
       (.I(1'b1),
        .O(MemRead[0]));
  OBUF \MemRead_OBUF[1]_inst 
       (.I(1'b0),
        .O(MemRead[1]));
  OBUF \MemRead_OBUF[2]_inst 
       (.I(1'b1),
        .O(MemRead[2]));
  OBUF \MemWrite_OBUF[0]_inst 
       (.I(1'b1),
        .O(MemWrite[0]));
  OBUF \MemWrite_OBUF[1]_inst 
       (.I(1'b1),
        .O(MemWrite[1]));
  OBUF \Reg1_OBUF[0]_inst 
       (.I(1'b0),
        .O(Reg1[0]));
  OBUF \Reg1_OBUF[10]_inst 
       (.I(1'b0),
        .O(Reg1[10]));
  OBUF \Reg1_OBUF[11]_inst 
       (.I(1'b0),
        .O(Reg1[11]));
  OBUF \Reg1_OBUF[12]_inst 
       (.I(1'b0),
        .O(Reg1[12]));
  OBUF \Reg1_OBUF[13]_inst 
       (.I(1'b0),
        .O(Reg1[13]));
  OBUF \Reg1_OBUF[14]_inst 
       (.I(1'b0),
        .O(Reg1[14]));
  OBUF \Reg1_OBUF[15]_inst 
       (.I(1'b0),
        .O(Reg1[15]));
  OBUF \Reg1_OBUF[16]_inst 
       (.I(1'b0),
        .O(Reg1[16]));
  OBUF \Reg1_OBUF[17]_inst 
       (.I(1'b0),
        .O(Reg1[17]));
  OBUF \Reg1_OBUF[18]_inst 
       (.I(1'b0),
        .O(Reg1[18]));
  OBUF \Reg1_OBUF[19]_inst 
       (.I(1'b0),
        .O(Reg1[19]));
  OBUF \Reg1_OBUF[1]_inst 
       (.I(1'b0),
        .O(Reg1[1]));
  OBUF \Reg1_OBUF[20]_inst 
       (.I(1'b0),
        .O(Reg1[20]));
  OBUF \Reg1_OBUF[21]_inst 
       (.I(1'b0),
        .O(Reg1[21]));
  OBUF \Reg1_OBUF[22]_inst 
       (.I(1'b0),
        .O(Reg1[22]));
  OBUF \Reg1_OBUF[23]_inst 
       (.I(1'b0),
        .O(Reg1[23]));
  OBUF \Reg1_OBUF[24]_inst 
       (.I(1'b0),
        .O(Reg1[24]));
  OBUF \Reg1_OBUF[25]_inst 
       (.I(1'b0),
        .O(Reg1[25]));
  OBUF \Reg1_OBUF[26]_inst 
       (.I(1'b0),
        .O(Reg1[26]));
  OBUF \Reg1_OBUF[27]_inst 
       (.I(1'b0),
        .O(Reg1[27]));
  OBUF \Reg1_OBUF[28]_inst 
       (.I(1'b0),
        .O(Reg1[28]));
  OBUF \Reg1_OBUF[29]_inst 
       (.I(1'b0),
        .O(Reg1[29]));
  OBUF \Reg1_OBUF[2]_inst 
       (.I(1'b0),
        .O(Reg1[2]));
  OBUF \Reg1_OBUF[30]_inst 
       (.I(1'b0),
        .O(Reg1[30]));
  OBUF \Reg1_OBUF[31]_inst 
       (.I(1'b0),
        .O(Reg1[31]));
  OBUF \Reg1_OBUF[3]_inst 
       (.I(1'b0),
        .O(Reg1[3]));
  OBUF \Reg1_OBUF[4]_inst 
       (.I(1'b0),
        .O(Reg1[4]));
  OBUF \Reg1_OBUF[5]_inst 
       (.I(1'b0),
        .O(Reg1[5]));
  OBUF \Reg1_OBUF[6]_inst 
       (.I(1'b0),
        .O(Reg1[6]));
  OBUF \Reg1_OBUF[7]_inst 
       (.I(1'b0),
        .O(Reg1[7]));
  OBUF \Reg1_OBUF[8]_inst 
       (.I(1'b0),
        .O(Reg1[8]));
  OBUF \Reg1_OBUF[9]_inst 
       (.I(1'b0),
        .O(Reg1[9]));
  OBUF \Reg2_OBUF[0]_inst 
       (.I(1'b0),
        .O(Reg2[0]));
  OBUF \Reg2_OBUF[10]_inst 
       (.I(1'b0),
        .O(Reg2[10]));
  OBUF \Reg2_OBUF[11]_inst 
       (.I(1'b0),
        .O(Reg2[11]));
  OBUF \Reg2_OBUF[12]_inst 
       (.I(1'b0),
        .O(Reg2[12]));
  OBUF \Reg2_OBUF[13]_inst 
       (.I(1'b0),
        .O(Reg2[13]));
  OBUF \Reg2_OBUF[14]_inst 
       (.I(1'b0),
        .O(Reg2[14]));
  OBUF \Reg2_OBUF[15]_inst 
       (.I(1'b0),
        .O(Reg2[15]));
  OBUF \Reg2_OBUF[16]_inst 
       (.I(1'b0),
        .O(Reg2[16]));
  OBUF \Reg2_OBUF[17]_inst 
       (.I(1'b0),
        .O(Reg2[17]));
  OBUF \Reg2_OBUF[18]_inst 
       (.I(1'b0),
        .O(Reg2[18]));
  OBUF \Reg2_OBUF[19]_inst 
       (.I(1'b0),
        .O(Reg2[19]));
  OBUF \Reg2_OBUF[1]_inst 
       (.I(1'b0),
        .O(Reg2[1]));
  OBUF \Reg2_OBUF[20]_inst 
       (.I(1'b0),
        .O(Reg2[20]));
  OBUF \Reg2_OBUF[21]_inst 
       (.I(1'b0),
        .O(Reg2[21]));
  OBUF \Reg2_OBUF[22]_inst 
       (.I(1'b0),
        .O(Reg2[22]));
  OBUF \Reg2_OBUF[23]_inst 
       (.I(1'b0),
        .O(Reg2[23]));
  OBUF \Reg2_OBUF[24]_inst 
       (.I(1'b0),
        .O(Reg2[24]));
  OBUF \Reg2_OBUF[25]_inst 
       (.I(1'b0),
        .O(Reg2[25]));
  OBUF \Reg2_OBUF[26]_inst 
       (.I(1'b0),
        .O(Reg2[26]));
  OBUF \Reg2_OBUF[27]_inst 
       (.I(1'b0),
        .O(Reg2[27]));
  OBUF \Reg2_OBUF[28]_inst 
       (.I(1'b0),
        .O(Reg2[28]));
  OBUF \Reg2_OBUF[29]_inst 
       (.I(1'b0),
        .O(Reg2[29]));
  OBUF \Reg2_OBUF[2]_inst 
       (.I(1'b0),
        .O(Reg2[2]));
  OBUF \Reg2_OBUF[30]_inst 
       (.I(1'b0),
        .O(Reg2[30]));
  OBUF \Reg2_OBUF[31]_inst 
       (.I(1'b0),
        .O(Reg2[31]));
  OBUF \Reg2_OBUF[3]_inst 
       (.I(1'b0),
        .O(Reg2[3]));
  OBUF \Reg2_OBUF[4]_inst 
       (.I(1'b0),
        .O(Reg2[4]));
  OBUF \Reg2_OBUF[5]_inst 
       (.I(1'b0),
        .O(Reg2[5]));
  OBUF \Reg2_OBUF[6]_inst 
       (.I(1'b0),
        .O(Reg2[6]));
  OBUF \Reg2_OBUF[7]_inst 
       (.I(1'b0),
        .O(Reg2[7]));
  OBUF \Reg2_OBUF[8]_inst 
       (.I(1'b0),
        .O(Reg2[8]));
  OBUF \Reg2_OBUF[9]_inst 
       (.I(1'b0),
        .O(Reg2[9]));
  OBUF \WB_Data_OBUF[0]_inst 
       (.I(WB_Data_OBUF[0]),
        .O(WB_Data[0]));
  OBUF \WB_Data_OBUF[10]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[10]));
  OBUF \WB_Data_OBUF[11]_inst 
       (.I(ALU_Result_OBUF[0]),
        .O(WB_Data[11]));
  OBUF \WB_Data_OBUF[12]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[12]));
  OBUF \WB_Data_OBUF[13]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[13]));
  OBUF \WB_Data_OBUF[14]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[14]));
  OBUF \WB_Data_OBUF[15]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[15]));
  OBUF \WB_Data_OBUF[16]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[16]));
  OBUF \WB_Data_OBUF[17]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[17]));
  OBUF \WB_Data_OBUF[18]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[18]));
  OBUF \WB_Data_OBUF[19]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[19]));
  OBUF \WB_Data_OBUF[1]_inst 
       (.I(WB_Data_OBUF[1]),
        .O(WB_Data[1]));
  OBUF \WB_Data_OBUF[20]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[20]));
  OBUF \WB_Data_OBUF[21]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[21]));
  OBUF \WB_Data_OBUF[22]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[22]));
  OBUF \WB_Data_OBUF[23]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[23]));
  OBUF \WB_Data_OBUF[24]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[24]));
  OBUF \WB_Data_OBUF[25]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[25]));
  OBUF \WB_Data_OBUF[26]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[26]));
  OBUF \WB_Data_OBUF[27]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[27]));
  OBUF \WB_Data_OBUF[28]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[28]));
  OBUF \WB_Data_OBUF[29]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[29]));
  OBUF \WB_Data_OBUF[2]_inst 
       (.I(WB_Data_OBUF[2]),
        .O(WB_Data[2]));
  OBUF \WB_Data_OBUF[30]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[30]));
  OBUF \WB_Data_OBUF[31]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[31]));
  OBUF \WB_Data_OBUF[3]_inst 
       (.I(WB_Data_OBUF[1]),
        .O(WB_Data[3]));
  OBUF \WB_Data_OBUF[4]_inst 
       (.I(1'b0),
        .O(WB_Data[4]));
  OBUF \WB_Data_OBUF[5]_inst 
       (.I(1'b0),
        .O(WB_Data[5]));
  OBUF \WB_Data_OBUF[6]_inst 
       (.I(1'b0),
        .O(WB_Data[6]));
  OBUF \WB_Data_OBUF[7]_inst 
       (.I(1'b0),
        .O(WB_Data[7]));
  OBUF \WB_Data_OBUF[8]_inst 
       (.I(WB_Data_OBUF[8]),
        .O(WB_Data[8]));
  OBUF \WB_Data_OBUF[9]_inst 
       (.I(WB_Data_OBUF[9]),
        .O(WB_Data[9]));
  OBUF Zero_OBUF_inst
       (.I(1'b0),
        .O(Zero));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  Datapath dp
       (.ALU_Result_OBUF({ALU_Result_OBUF[8],ALU_Result_OBUF[2:0]}),
        .CLK(clk_IBUF_BUFG),
        .WB_Data_OBUF({WB_Data_OBUF[9:8],WB_Data_OBUF[2:0]}),
        .clear(reset_IBUF));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
