module calculator (
           input [1:0]    OP,
           input [3:0]    A, B,
           output [9:0]    out
           );

   wire                cout, ovf;  // carry_out and overflow
   wire [3:0]            outa;  // adder output
   wire [7:0]            outm;  // multiplier output

   // OP[0] is the add/sub control
   addsub4 u_addsub (
             .A(A),
             .B(B),
             .subsel(OP[0]),
             .X(outa),
             .cout(cout),
             .ovf(ovf)
             );

   mult4 u_mult (
         .A(A),
         .B(B),
         .X(outm)
         );

   // OP[1] = 0: {carry_out, overflow, 0000, sum}   OP[1] = 1: {00, product}
   mux10 u_mux (
        .in0({cout, ovf, 4'b0000, outa}),
        .in1({2'b00, outm}),
        .sel(OP[1]),
        .out(out)
        );

endmodule // calculator