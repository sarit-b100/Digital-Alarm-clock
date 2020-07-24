module Input(input slow_clk,Reset,Plus,Minus,act0,act1,output reg [5:0] Inp=0);

always@(posedge slow_clk or negedge Reset)
     begin
     if(Reset==0 & {act0,act1}==2'b11)
      Inp=0;
     else if(Plus==1 & Minus==0 & {act0,act1}==2'b11)
      Inp=Inp+1'b1;
     else if(Plus==0 & Minus==1 & {act0,act1}==2'b11)
      Inp=Inp-1'b1;
     else
      Inp=Inp;
     end
endmodule