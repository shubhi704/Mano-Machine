
  module test;

 reg clr,clk;
 reg [7:0]INPR_IN;
 wire [7:0]OUTR;
 wire E;
 
   main mano(clk, clr, 
             INPR_IN,
             OUTR,
             E );

 initial
  begin
   clk = 0;
   forever #5 clk = ~clk;
  end
 
  initial
   begin
    clr = 1'b0;
    @(negedge clk) clr = 1'b1;
    @(negedge clk) #1; clr = 1'b0;
    INPR_IN = 8'd7;

  end
 
  initial
   begin
   $dumpfile("s.vcd");
   $dumpvars;
  end
  initial
    #1000 $finish;
 endmodule
