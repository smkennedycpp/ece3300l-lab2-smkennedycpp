
module add4 (
	     input	      carryin,
	     input [3:0]      X, Y,
	     output reg [3:0] S,
	     output reg	      carryout,
	     output reg	      ovf
	     );
   
   reg [4:0]		      C;
   integer		      k;
   
   always @(X, Y, carryin)
     begin
	C[0] = carryin;
	for (k = 0; k < 4; k = k+1)
	  begin
	     S[k] = X[k] ^ Y[k] ^ C[k];
	     C[k+1] = (X[k] & Y[k]) | (X[k] & C[k]) | (Y[k] & C[k]);
 	  end
	carryout = C[4];
	ovf = C[4] ^ C[3];
     end
endmodule

