


 module ALU(
                input [15:0]from_AC, from_DR,
                input [7:0] from_INPR,
		input clk,enable,
                input [2:0]con_signals,
                output [15:0] ALU_out,
                output reg E	);

   reg [15:0]AC;
   reg Cout;

    always @(posedge clk) begin
       E <= Cout; end
        
     always @(*) begin
        case(con_signals)
            3'd0 : AC = from_AC & from_DR ;
            3'd1 : {Cout,AC} = from_AC + from_DR;
            3'd2 : AC =  from_DR;
            3'd3 : AC = ~from_AC;
            3'd4 : AC = from_AC >> E;
            3'd5 : AC = from_AC << E;
            3'd6 : AC = 16'd0;
            3'd7 : AC = from_AC + 1;
        endcase
       end 
      //  assign ALU_out = enable ? AC : ALU_out ;
           assign ALU_out = AC;
  endmodule   
                


  
