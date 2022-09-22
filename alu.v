`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2022 21:08:17
// Design Name: 
// Module Name: alu
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


`timescale 1ns/1ps
module alu(in_a,in_b,fun,out_alu,out_carry);

input [3:0]in_a,in_b;
input [3:0]fun;
output [3:0]out_alu;
output out_carry;

wire [3:0]w_b;
wire w_cin;
wire [3:0] w_sum;
wire [3:0] w_logical;

assign w_cin = (fun[3] & fun[0])?1'b1:1'b0;
assign w_b   = (fun[3] & fun[0])?~in_b:in_b;


adder A0(in_a,w_b,w_cin,w_sum,out_carry);
LogicalUnit L0(in_a,w_b,fun[2:0],w_logical);

assign out_alu = fun[3]?w_sum:w_logical;


endmodule
