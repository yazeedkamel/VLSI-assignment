module Adder_8bit( A, B, Cin, SUM, Co);

    // Inputs
    input [7:0] A , B;
    input Cin;

    // Outputs
    output   [7:0] SUM;
    output   Co;

    // Carry bits
    wire [7:0]cin;
    
    assign cin [0] = Cin;
    
    generate genvar i;
        
        for( i = 0 ; i < 8 ; i= i + 1)begin
            
        Full_Adder fa0( A[i], B[i], cin[i], SUM[i],cin[i+1] );
            
        end

    endgenerate    
    
    assign Co = cin[7];

endmodule
