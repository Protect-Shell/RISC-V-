`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2022 09:38:13
// Design Name: 
// Module Name: decoder
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

module Dec(addr, req_data, chip_sel, opcode,clk,cu_done,cu_dataout);
input [15:0]opcode;
input clk, cu_done , cu_dataout;
output reg [2:0]addr;
output reg req_data;
output reg [1:0]chip_sel;
always @(posedge clk)
begin

case(opcode[1:0])
2'b00:$display("00");
2'b01:begin
    $display("01");
    case(opcode[15:13])
        3'b000:begin
               if(opcode[12:2]==0)
                $display("NOP");
               else
                $display("addi");
               end
        3'b001:begin
               if(1) $display("jal");
               else $display("addiw");
               end
        3'b010:$display("li");
        3'b011:begin
                if(opcode[11:7]==2)
                    $display("addi16sp");
                else
                    $display("lui");
               end
        3'b100:begin
                case(opcode[11:10])
                  2'b00:begin
                       $display("opcode[11:10]=00");
                       if(opcode[12]==0&opcode[6:2]==0)
                            $display("srli64");
                       else $display("srli");
                       end
                  2'b01:begin $display("opcode[11:10]=01");
                        if(opcode[12]==0&opcode[6:2]==0)
                              $display("srai64");
                        else $display("srai");
                        end
                  2'b10:begin 
                        $display("opcode[11:10]=10, and");
                        chip_sel = 2'b00;
                        addr = opcode[9:7];
                        req_data = 1;
                        end
                  2'b11:begin
                        case(opcode[12])
                            2'b0:begin $display("opcode[12]=0");
                                case(opcode[6:5])
                                    2'b00:$display("opcode[6:5]=00,sub");
                                    2'b01:$display("opcode[6:50]=01,xor");
                                    2'b10:$display("opcode[6:5]=10,or");
                                    2'b11:$display("opcode[6:5]=11,and");
                                 endcase
                                 end
                            2'b1:begin
                                 case(opcode[6:5])
                                    2'b00:$display("opcode[6:5]=00,subw");
                                    2'b01:$display("opcode[6:50]=01,addw");
                                    2'b10:$display("opcode[6:5]=10,rev");
                                    2'b11:$display("opcode[6:5]=11,rev");
                                 endcase
                                 end
                        endcase
                       end  
                endcase
                end
        3'b101:$display("j");
        3'b110:$display("beqz");
        3'b111:$display("bnez");
    endcase
    end
2'b10:$display("10");
2'b11:$display("11 and >16bit");
default:$display("NONE");
endcase
end
endmodule