

  
 module MEMORY( input [15:0]DATA_IN,
             input WRITE, READ, CLK,
             input [11:0]ADDRESS,
             output [15:0] DATA_OUT );


 reg [15:0] mem [0:4095] ;

  initial begin
	    $readmemh("memory.txt",mem,0,4095);
          end

   
	  assign DATA_OUT = READ ? mem[ADDRESS] : DATA_OUT ; 

  always @(posedge CLK) begin
  // if(READ)
    // DATA_OUT <= mem[ADDRESS];
   if(WRITE) 
     mem[ADDRESS] <=  DATA_IN;
   end

 endmodule
    
