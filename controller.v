`timescale 1ns/1ns
  

  module controller(CON,op_code,clk,clr);

   output reg [17:0]CON;
   input clk;
   input clr;
   input [2:0]op_code;
   reg [5:0]state;

  parameter  AND= 3'b000,
             ADD= 3'b001,
             LDA= 3'b010,
             STA= 3'b011,
             BUN= 3'b100,
             BSA= 3'b101,
             ISZ= 3'b110,
	     HLT= 3'b111;

    always @(posedge clk,posedge clr)  
    begin
     if(clr)
        begin state <= 6'd1; end
     else if(state == 6'd32)
        begin state <= 6'd1; end
     else
       begin state <= state << 1; end
    end

  always @(state,clr)
  begin
   if(!clr)
    begin
    case(state)
     6'd1 : begin CON = 18'h09002; end 
     6'd2 : begin CON = 18'h10807; end 
     6'd4 : begin CON = 18'h08005; end 
    // 6'd8 : begin CON = 18'h09007; end 

     6'd8 : begin
            if(op_code == AND || op_code == ADD || op_code == LDA || op_code == ISZ)     
              begin CON = 18'h01407; end 
           else if(op_code == STA)   
             begin CON = 18'h02004; end
           else if(op_code == BUN)     
	     begin CON = 18'h20001; end
	   else if(op_code == BSA)
             begin CON = 18'h07402; end
	   else if(op_code == HLT)
	     begin   $stop;
                       end
           end

   6'd16 : begin
           if(op_code == LDA)        // LDA
             begin 
	      
	      CON = 18'h00103; end  
	      else if(op_code == ADD || op_code ==AND) begin
		      CON = 18'H00100; end
             else if( op_code == STA || op_code == BUN)      // ADD + AND	
             begin 
	        
		CON = 18'h0; end
           else if(op_code == BSA)      //BSA
             begin CON = 18'h20001; end
	   else if(op_code == ISZ)
	     begin CON = 18'h00200; end
           end
    
   6'd32 : begin
            if(op_code == ISZ)
               begin CON = 18'h02003; end
	    else if(op_code == ADD || op_code == AND) begin
		   
		   CON = 18'h0; end
            end
   default: $display($time,"output come in next state",state,clr,clk,op_code); 
  endcase
 end 
else begin CON = 18'h0; end 

 end
endmodule     









    
