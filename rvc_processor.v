`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2022 09:53:10
// Design Name: 
// Module Name: rvc_processor
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

#risc processor
module rvc_processor();
reg a clk;
decoder d1(a,clk);
srf s1(dataout,done,wr,datain,add,clk);
alu a1 (in_a,in_b,fun,out_alu,out_carry);
endmodule
