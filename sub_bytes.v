module sub_bytes (
    input [0:127] sub_bytes_in,
    output [0:127] sub_bytes_out
);
    localparam byte_size = 8;

//wires for data "a"
    wire [0:byte_size-1] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15;

//wires for output "b"
    wire [0:byte_size-1] b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15;


//partitoining the data 
    assign a0 = sub_bytes_in[0 : byte_size - 1];
    assign a1 = sub_bytes_in[byte_size : 2 * byte_size - 1];
    assign a2 = sub_bytes_in[2 * byte_size : 3 * byte_size - 1];
    assign a3 = sub_bytes_in[3 * byte_size : 4 * byte_size - 1];
    assign a4 = sub_bytes_in[4 * byte_size : 5 * byte_size - 1];
    assign a5 = sub_bytes_in[5 * byte_size : 6 * byte_size - 1];
    assign a6 = sub_bytes_in[6 * byte_size : 7 * byte_size - 1];
    assign a7 = sub_bytes_in[7 * byte_size : 8 * byte_size - 1];
    assign a8 = sub_bytes_in[8 * byte_size : 9 * byte_size - 1];
    assign a9 = sub_bytes_in[9 * byte_size : 10 * byte_size - 1];
    assign a10 = sub_bytes_in[10 * byte_size : 11 * byte_size - 1];
    assign a11 = sub_bytes_in[11 * byte_size : 12 * byte_size - 1];
    assign a12 = sub_bytes_in[12 * byte_size : 13 * byte_size - 1];
    assign a13 = sub_bytes_in[13 * byte_size : 14 * byte_size - 1];
    assign a14 = sub_bytes_in[14 * byte_size : 15 * byte_size - 1];
    assign a15 = sub_bytes_in[15 * byte_size : 16 * byte_size - 1];

//SBox instances
    SBox U0 (.addr(a0), .dout(b0));
    SBox U1 (.addr(a1), .dout(b1));
    SBox U2 (.addr(a2), .dout(b2));
    SBox U3 (.addr(a3), .dout(b3));
    SBox U4 (.addr(a4), .dout(b4));
    SBox U5 (.addr(a5), .dout(b5));
    SBox U6 (.addr(a6), .dout(b6));
    SBox U7 (.addr(a7), .dout(b7));
    SBox U8 (.addr(a8), .dout(b8));
    SBox U9 (.addr(a9), .dout(b9));
    SBox U10 (.addr(a10), .dout(b10));
    SBox U11 (.addr(a11), .dout(b11));
    SBox U12 (.addr(a12), .dout(b12));
    SBox U13 (.addr(a13), .dout(b13));
    SBox U14 (.addr(a14), .dout(b14));
    SBox U15 (.addr(a15), .dout(b15));


//output logic
    assign sub_bytes_out = {b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15};


endmodule