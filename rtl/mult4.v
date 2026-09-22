module mult4 (
         input [3:0] A, B,
         output [7:0] X
         );

   // partial products
   wire [3:0] pp0, pp1, pp2, pp3;
   assign pp0 = A & {4{B[0]}};
   assign pp1 = A & {4{B[1]}};
   assign pp2 = A & {4{B[2]}};
   assign pp3 = A & {4{B[3]}};

   // sums and carries from each adder row
   wire [3:0] s1, s2, s3;
   wire       c1, c2, c3;
   wire       ovf1, ovf2, ovf3;  // unused (unsigned multiply)

   // Row 1: (pp0 >> 1) + pp1
   add4 row1 (.carryin(1'b0), .X({1'b0, pp0[3:1]}), .Y(pp1),
          .S(s1), .carryout(c1), .ovf(ovf1));

   // Row 2: (row 1 result >> 1) + pp2
   add4 row2 (.carryin(1'b0), .X({c1, s1[3:1]}), .Y(pp2),
          .S(s2), .carryout(c2), .ovf(ovf2));

   // Row 3: (row 2 result >> 1) + pp3
   add4 row3 (.carryin(1'b0), .X({c2, s2[3:1]}), .Y(pp3),
          .S(s3), .carryout(c3), .ovf(ovf3));

   // product bits
   assign X[0]   = pp0[0];
   assign X[1]   = s1[0];
   assign X[2]   = s2[0];
   assign X[3]   = s3[0];
   assign X[6:4] = s3[3:1];
   assign X[7]   = c3;

endmodule // mult4