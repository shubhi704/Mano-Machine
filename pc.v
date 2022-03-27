

 module pc_reg (
  output reg[11:0]to_BUS,
  input INR,
  input CLK,
  input CLR,
  input LD,
  input [11:0]from_BUS );
  
  //reg [11:0]tempc ;

  //assign to_BUS = tempc;

  always @(posedge CLK, posedge CLR) 
    begin
     if(CLR == 1)
      to_BUS <= 12'd0;
     else if(LD == 1)
      to_BUS <= from_BUS;
     else if(INR == 1)
       to_BUS <= (to_BUS + 1);
     else 
	to_BUS <= to_BUS;
      end
  endmodule
