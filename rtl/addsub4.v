module addsub4 (
           input [3:0] A, B,
           input subsel,
           output [3:0] X,
           output cout, ovf
           );

   wire [3:0] Bx;

   // subsel = 0: pass B through (add); subsel = 1: invert B (1's complement)
   assign Bx = B ^ {4{subsel}};

   // subsel also drives carry-in to supply the +1 for 2's complement
   add4 u_add (
           .carryin(subsel),
           .X(A),
           .Y(Bx),
           .S(X),
           .carryout(cout),
           .ovf(ovf)
           );

endmodule