
module mux10 (
	       input [9:0] in0, in1,
	       input sel,
	       output reg [9:0] out
	       );

   always @(in0, in1, sel)
     begin
	if (sel)
	  out = in1;
	else
	  out = in0;
     end
   
endmodule // mux10
