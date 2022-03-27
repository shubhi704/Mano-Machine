 
 `include "memory.v"
 `include "pc.v"
 `include "alu.v"
 `include "inst_reg.v"
 `include "reg8.v"
 `include "reg16.v"
 `include "controller.v"


 module main(input CLK, CLR, 
             input [7:0]INPR_IN,
             output [7:0] REG_OUT,
             output E );

     wire [2:0]OUT3;
     wire [11:0]PC_out,AR_out;
     wire [17:0]CON;
     wire [7:0]INPR_out;
     wire [15:0]TR_out,DR_out,AC_out,MEM_out,IR_out,ALU_out;
     reg [15:0]bus;
     reg [17:0]CON_reg;
     wire [2:0] S;

      assign S = CON[2:0] ;
     always @(*) begin
      case({CON[2:0]})     
       3'd1 : bus = {4'd0,AR_out};
       3'd2 : bus = {4'd0,PC_out};
       3'd3 : bus = DR_out;
       3'd4 : bus = AC_out;
       3'd5 : bus = IR_out;
       3'd6 : bus = TR_out;
       3'd7 : bus = MEM_out;
     default: bus = 16'dz;
    endcase
    end
    
    pc_reg pc( PC_out, CON[16], CLK, CLR, CON[17], bus[11:0] );
    
    pc_reg AR_reg( AR_out, CON[14], CLK, CLR, CON[15], bus[11:0] );


    INST_REG IR(IR_out[11:0], IR_out[14:12], IR_out[15], bus, CLK, CON[11] );

    IN_OUT_REG INPR(INPR_out, INPR_IN, CLK, CON[3] );

    reg16_INR TR( TR_out, CON[5], CLK, CLR, CON[6], bus );
 
    reg16_INR DR( DR_out, CON[9], CLK, CLR, CON[10], bus );

    reg16_INR AC( AC_out, CON[7], CLK, CLR, CON[8], ALU_out );

    MEMORY memory( bus , CON[13], CON[12], CLK, AR_out, MEM_out );

    ALU aluuu(AC_out, DR_out, INPR_out,CLK,CON[8], IR_out[14:12] , ALU_out, E);

    IN_OUT_REG outr(REG_OUT, bus[7:0], CLK, CON[4] );

    controller cont(CON, IR_out[14:12], CLK , CLR);
   
    always @(posedge CLK, posedge CLR) begin
	    CON_reg <= CON;
    end

  endmodule


 



  
