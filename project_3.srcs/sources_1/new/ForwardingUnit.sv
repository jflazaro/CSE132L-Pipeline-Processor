`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2018 05:32:24 PM
// Design Name: 
// Module Name: ForwardingUnit
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


module ForwardingUnit(
    input logic [4:0] RS1_IDEX, RS2_IDEX, RDest_EXM, RDest_MW,
    input logic RegWrite_EXM, RegWrite_MW,
    output logic [1:0] ForwardA, ForwardB
    );

always_comb begin
// ForwardA //
// EX Hazard
if (RegWrite_EXM && (RDest_EXM != 0) && (RDest_EXM == RS1_IDEX))
    ForwardA <= 2'b10;
// MEM Hazard
else if (RegWrite_MW && (RDest_MW != 0) /*&& !(RegWrite_EXM && (RDest_EXM != 0) && (RDest_EXM != RS1_IDEX))*/ && (RDest_MW == RS1_IDEX))
    ForwardA <= 2'b01;
// Else
else
    ForwardA <= 2'b00;

// ForwardB //
// EX Hazard
if (RegWrite_EXM && (RDest_EXM != 0) && (RDest_EXM == RS2_IDEX))
    ForwardB <= 2'b10;
// MEM Hazard
else if (RegWrite_MW && (RDest_MW != 0) /*&& !(RegWrite_EXM && (RDest_EXM != 0) && (RDest_EXM != RS2_IDEX))*/ && (RDest_MW == RS2_IDEX))
    ForwardB <= 2'b01;
// Else
else
    ForwardB <= 2'b00;
end
endmodule