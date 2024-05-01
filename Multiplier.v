// Multiplier implementation using ADD shift method
module Multiplier ( A, B, R );

    // Inputs   (multiplicand , multiplier)
    input [7:0] A, B;
    
    // Output   (result)
    output [15:0] R;

    // Partial Products
    wire [15:0] pp0,pp1,pp2,pp3,pp4,pp5,pp6,pp7;
    
    // summation of partial products
    wire [15:0] p0,p1,p2,p3,p4,p5,p6,p7;
    
    // Carry bits
    wire c0,c1,c2,c3,c4,c5,c6,c7;
    
    // Extracting Partial Products
    assign pp0 =(B[0]) ? { {8{1'b0}} ,A}           :16'b0 ;
    assign pp1 =(B[1]) ? { {7{1'b0}} ,A,    1'b0}  :16'b0 ;
    assign pp2 =(B[2]) ? { {6{1'b0}} ,A, {2{1'b0}}}:16'b0 ;
    assign pp3 =(B[3]) ? { {5{1'b0}} ,A, {3{1'b0}}}:16'b0 ;
    assign pp4 =(B[4]) ? { {4{1'b0}} ,A, {4{1'b0}}}:16'b0 ;
    assign pp5 =(B[5]) ? { {3{1'b0}} ,A, {5{1'b0}}}:16'b0 ;
    assign pp6 =(B[6]) ? { {2{1'b0}} ,A, {6{1'b0}}}:16'b0 ;
    assign pp7 =(B[7]) ? {    1'b0   ,A, {7{1'b0}}}:16'b0 ;

    // Summation of partial products
    Adder_16bit _p0( pp0,pp1, 1'b0, p0, c0);
    Adder_16bit _p1( p0,pp2, c0, p1, c1);
    Adder_16bit _p2( p1,pp3, c1, p2, c2);
    Adder_16bit _p3( p2,pp4, c2, p3, c3);
    Adder_16bit _p4( p3,pp5, c3, p4, c4);
    Adder_16bit _p5( p4,pp6, c4, p5, c5);
    Adder_16bit _p6( p5,pp7, c5, p6, c6);

    // Final result
    assign R = p6;       



endmodule