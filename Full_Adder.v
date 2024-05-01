module Full_Adder( a, b, cin, s, co );

    // Inputs
    input a,b,cin;

    // Output
    output s, co;

    assign s = a ^ b ^ cin;
    assign co = (a&b) | (b&cin) | (a&cin) ;


endmodule