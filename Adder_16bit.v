module Adder_16bit( A, B, Cin, SUM, Co);

    // Inputs
    input [15:0] A , B;
    input Cin;

    // Outputs
    output   [15:0] SUM;
    output   Co;
 
	// Carry bits
    wire [15:0]cin;
    
    assign cin [0] = Cin;
    
    generate genvar i;
        
        for( i = 0 ; i < 16 ; i= i + 1)begin
            
        Full_Adder fa0( A[i], B[i], cin[i], SUM[i],cin[i+1] );
            
        end

    endgenerate    
    
    assign Co = cin[15];

endmodule
