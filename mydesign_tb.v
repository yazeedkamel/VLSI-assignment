`timescale 1ns/100ps 
module mydesign_tb;
 reg [7:0] A;
 reg [7:0] B;
 reg [7:0] C;
 reg [2:0] i, j;
 wire [15:0] F;
 // Mydesign one round in hardware
 mydesign mydesign (
 .A (A),
 .B (B),
 .C (C),
 .i (i),
 .j (j), 
 .F (F)
 );
 initial begin
 $monitor (" (values are in HEX) A=%h B=%h C=%h i=%h j=%h F=%h", A, B, C, 
i, j, F);
 A= 8'h06; B=8'h06; C=8'h06 ; i=3'h1; j=3'h1; 
 #10;
 A= 8'h01; B=8'h01; C=8'h01 ; i=3'h1; j=3'h1; 
 #10;
 
 A= 8'hFF; B=8'hFF; C=8'hFF ; i=3'h7; j=3'h7; 
 #10;
 A= 8'hFF; B=8'hFF; C=8'hFF ; i=3'h0; j=3'h0; 
 #10;
 
 $stop;
 end 
 
endmodule