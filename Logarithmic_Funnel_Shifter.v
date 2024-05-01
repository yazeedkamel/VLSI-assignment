// Logarithmic Funnel Shifter
// which handles only logical shift operations
module Logarithmic_Funnel_Shifter( dataIn, dataOut, k, left);

    // Inputs
    
    // 8-bit input data
    input [7:0] dataIn;
    // 3-bit shift amount
    input [2:0] k;
    // 1-bit left signal
    input left;

    // Z layer
    wire [14:0] Z;

    // Output

    // 8-bit output data
    output [7:0] dataOut;

    // Implementing z layer
    assign Z = ( ~left ) ? { {7{1'b0}}   , dataIn[7] , dataIn[6:0] } :/*SRL*/
                           { dataIn[7:1] , dataIn[0] , {7{1'b0}}   } ;/*SLL*/
    
    // final shifted output (select from Z[k] to Z[k+7] of the Z layer )
    assign dataOut = (~left) ? Z[k+:8]  : Z[~k+:8 ];


endmodule
