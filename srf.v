`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2022 21:05:39
// Design Name: 
// Module Name: srf
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


module srf(dataout,done,wr,datain,add,clk);
reg RAM[0:3];
output reg dataout, done=0; 
input clk,add,wr;
inout datain;
always@(clk)
begin
case(wr)
1'b1:
    begin
    dataout=RAM[add];
    done=1'b1;
    end

1'b0:
    begin
    RAM[add]= datain;
    //dataout=0;
    done=1'b1;
    end
endcase
end
endmodule
