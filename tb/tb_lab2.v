
module tb_lab2();
  
  reg [1:0] OP;
  reg [3:0] A, B;
  wire [9:0] out;
  
  calculator u1(.OP(OP), .A(A), .B(B), .out(out));
  
  initial begin
    OP = 2'b00;
    A = 4'b0101; //   5
    B = 4'b0010; // + 2
    #10 $display("%b",out);  // should output 00000111 = +7
    OP = 2'b10;
    A = 4'b0110; //   6
    B = 4'b1001; // * 9 
    #10 $display("%b",out);  // should output 00110110 = 54
    OP = 2'b01;
    A = 4'b0110; //   6
    B = 4'b0111; // - 7 
    #10 $display("%b",out);  // should output 00001111 = -1

// add at least 4 more tests to check your implementation

    OP = 2'b00;
    A = 4'b0111; //   7
    B = 4'b0001; // + 1
    #10 $display("%b",out);  // 0100001000 = 1000 with overflow (+7 + +1 = -8)

    OP = 2'b00;
    A = 4'b1101; //  -3
    B = 4'b1110; // + -2
    #10 $display("%b",out);  // 1000001011 = -5, carry out, no overflow

    OP = 2'b00;
    A = 4'b1111; //  -1
    B = 4'b0001; // + 1
    #10 $display("%b",out);  // 1000000000 = 0, carry out, no overflow

    OP = 2'b01;
    A = 4'b0011; //   3
    B = 4'b0101; // - 5
    #10 $display("%b",out);  // 0000001110 = -2

    OP = 2'b01;
    A = 4'b1000; //  -8
    B = 4'b0001; // - 1
    #10 $display("%b",out);  // 1100000111 = overflow (result wraps to +7)

    OP = 2'b10;
    A = 4'b1111; //  15
    B = 4'b1111; // * 15
    #10 $display("%b",out);  // 0011100001 = 225

    OP = 2'b11;  // OP[0] is a don't care for multiply
    A = 4'b1100; //  12
    B = 4'b0011; // * 3
    #10 $display("%b",out);  // 0000100100 = 36

    OP = 2'b10;
    A = 4'b0000; //   0
    B = 4'b1101; // * 13
    #10 $display("%b",out);  // 0000000000 = 0	  
	  
    $finish;
  end
  
endmodule
		   
		   
