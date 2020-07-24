`timescale 1ns / 1ns
module main(input Plus_in,Minus_in,masCLK,Reset,Time,Alarm,H,M,Alarm_ON,output reg a,b,c,d,e,f,g,AN0,AN1,AN2,AN3,Ring=0,clock_1s=0);

//generating 500 Hz clock for 7 segment multiplexing T=2ms
    reg [26:0] tictoc2=0;
    reg CLK=0;
    always@(posedge masCLK)
    begin
    if(tictoc2<100000)
     tictoc2<=tictoc2+1'b1;
    else
    begin
     tictoc2<=0;
     CLK<=~CLK;
    end
    end
    
//generating T=1s clock for time display
    reg [26:0] tictoc3=0;
    always@(posedge masCLK)
    begin
    if(tictoc3<50000000)//count upto 5*10^7 for 1s clock
     tictoc3<=tictoc3+1'b1;
    else
    begin
     tictoc3<=0;
     clock_1s=~clock_1s;
    end
    end

//generating slow_clk for debouncing T=2.5 ms
    reg [26:0]counter=0;
    reg slow_clk;
    always @(posedge masCLK)
    begin
        counter <= (counter>=249999)?0:counter+1;
        slow_clk <= (counter < 125000)?1'b0:1'b1;
    end
    
    wire [5:0] TH,TM,AH,AM;
    reg [5:0] THour,TMin,AHour,AMin;//6-bit registers for Hour,Min of Clock and Alarm
    reg [5:0] sec=0;//6-bit register for counting seconds
    wire [10:0] L1,L2;
    wire Plus,Minus; 

    Debounce inst0(Plus_in,slow_clk,Plus);
    Debounce inst1(Minus_in,slow_clk,Minus);

    Input inst2(slow_clk,Reset,Plus,Minus,Time,H,TH);
    Input inst3(slow_clk,Reset,Plus,Minus,Time,M,TM);
    Input inst4(slow_clk,Reset,Plus,Minus,Alarm,H,AH);
    Input inst5(slow_clk,Reset,Plus,Minus,Alarm,M,AM);

    always@(AH or AM) //assign the changes to the alarm registers 
    begin
     AHour<=AH;
     AMin<=AM;
    end

    always@(posedge clock_1s) //clock update
    begin 
     if(sec<59 & Time==0)
     begin
      sec=sec+1'b1;
     end
     else if(sec==59 & Time==0)
     begin
      sec=0;
      TMin=(TMin==59)?0:TMin+1'b1;
      THour=(TMin==0)?((THour==23)?0:THour+1'b1):THour;
     end
     else if(Time==1) //if Time==1,the user input of the current hour and min is copied to the respective registers
     begin
      THour=TH;
      TMin=TM;
     end
    end

    always@(posedge clock_1s) //Alarm manager
    begin
     if({AHour,AMin}=={THour,TMin} && Alarm_ON==1)
      Ring=1;
     else
      Ring=0;
    end
  
    
    Display inst10(THour,TMin,CLK,L1[10],L1[9],L1[8],L1[7],L1[6],L1[5],L1[4],L1[3],L1[2],L1[1],L1[0]);
    Display inst11(AHour,AMin,CLK,L2[10],L2[9],L2[8],L2[7],L2[6],L2[5],L2[4],L2[3],L2[2],L2[1],L2[0]);

    always@(*)
    begin
     if({Time,Alarm}==2'b00 || {Time,Alarm}==2'b10)
      {a,b,c,d,e,f,g,AN0,AN1,AN2,AN3}=L1;
     else if({Time,Alarm}==2'b01)
      {a,b,c,d,e,f,g,AN0,AN1,AN2,AN3}=L2;
    end
endmodule