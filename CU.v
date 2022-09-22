`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2022 11:43:45
// Design Name: 
// Module Name: CU
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


module CU(srf_en,ram_en,data_out,data_in,chip_sel,done,clk,addr);
input data_in,clk;
input [2:0] addr;
input [1:0]chip_sel;
output data_out,done;
output reg srf_en;
output reg ram_en;
always @(posedge clk)
begin 
    srf_en =0;
    ram_en =0;
    case(chip_sel)
    2'b00: srf_en =1;
    2'b01: ram_en =1;
    default: $display("NONE");
    endcase 
end
endmodule