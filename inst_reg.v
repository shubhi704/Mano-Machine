

 `timescale 1ns/1ns
 module INST_REG(
            output reg[11:0]INST_OUT12,
	    output reg[2:0]INST_OUT3,
	    output reg I,
            input [15:0]REG_IN,
            input CLK,LD );
   //reg [15:0]temp;

 always @(posedge CLK)

  if(LD)
    {I,INST_OUT3,INST_OUT12} <= REG_IN;
  endmodule
       
