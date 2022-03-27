


  `timescale 1ns/1ns
 module IN_OUT_REG(
            output reg[7:0]REG_OUT,
            input [7:0]REG_IN,
            input CLK,LD );
 
 
 always @(posedge CLK)
 begin
  if(LD)
    REG_OUT = REG_IN;
  else
    REG_OUT = REG_OUT;
  end
 endmodule
