// Name:           ID:
// Issa   Qandah   2036177
// Yazeed Kamel    ------
// Ayham  Abdullah -------

module mydesign ( A, B, C, i, j, F);

    // This is an implementation of this equations
    // E =( A / 2^i ) +( B × 2^j ) 
    // F = E × C  
    // A, B, C and E are 8-bit unsigned numbers
    // i and j are 3-bit unsigned numbers
    // F is 16-bit unsigned number

    // Inputs 
    input [7:0] A;
    input [7:0] B;
    input [7:0] C;
    input [2:0] i;
    input [2:0] j;

    // Output 
    output [15:0] F;
    
    // Internal wires
    wire [7:0] Aout , Bout ;
    wire [7:0] E;
    
    // Shifting A by i bits to the right
    Logarithmic_Funnel_Shifter _SRL_A_by_i( .dataIn(A), .dataOut(Aout), .k(i), .left(1'b0) );
    
    // Shifting B by j bits to the left
    Logarithmic_Funnel_Shifter _SLL_B_by_j( .dataIn(B), .dataOut(Bout), .k(j), .left(1'b1) );

    // compute E
    Adder_8bit _E ( .A(Aout), .B(Bout), .Cin(1'b0), .SUM(E), .Co());

    // compute F
    Multiplier _F( .A(E), .B(C), .R(F) );
    
endmodule