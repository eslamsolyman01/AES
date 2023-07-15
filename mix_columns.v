module mix_columns 
(
    input [0:127] mix_columns_in,
    output [0:127] mix_columns_out
);
localparam byte_size = 8;

//wires for data "a"
    wire [0:byte_size-1] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15;

//wires for output "b"
    wire [0:byte_size-1] b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15;

//partitoining the data 
    assign a0 = mix_columns_in[0 : byte_size - 1];
    assign a1 = mix_columns_in[byte_size : 2 * byte_size - 1];
    assign a2 = mix_columns_in[2 * byte_size : 3 * byte_size - 1];
    assign a3 = mix_columns_in[3 * byte_size : 4 * byte_size - 1];
    assign a4 = mix_columns_in[4 * byte_size : 5 * byte_size - 1];
    assign a5 = mix_columns_in[5 * byte_size : 6 * byte_size - 1];
    assign a6 = mix_columns_in[6 * byte_size : 7 * byte_size - 1];
    assign a7 = mix_columns_in[7 * byte_size : 8 * byte_size - 1];
    assign a8 = mix_columns_in[8 * byte_size : 9 * byte_size - 1];
    assign a9 = mix_columns_in[9 * byte_size : 10 * byte_size - 1];
    assign a10 = mix_columns_in[10 * byte_size : 11 * byte_size - 1];
    assign a11 = mix_columns_in[11 * byte_size : 12 * byte_size - 1];
    assign a12 = mix_columns_in[12 * byte_size : 13 * byte_size - 1];
    assign a13 = mix_columns_in[13 * byte_size : 14 * byte_size - 1];
    assign a14 = mix_columns_in[14 * byte_size : 15 * byte_size - 1];
    assign a15 = mix_columns_in[15 * byte_size : 16 * byte_size - 1];

//block logic
    //first column
        assign b0 = (2 * a0) ^ (3 * a1) ^  a2 ^ a3;
        assign b1 = a0 ^ (2 * a1 ) ^ ( 3* a2) ^ a3;
        assign b2 = a0 ^ a1  ^ ( 2* a2) ^ ( 3* a3);
        assign b3 = ( 3* a0) ^ a1  ^ a2 ^ ( 2* a3);

    //second column
        assign b4 = (2 * a4) ^ (3 * a5) ^  a6 ^ a7;
        assign b5 = a4 ^ (2 * a5 ) ^ ( 3* a6) ^ a7;
        assign b6 = a4 ^ a5  ^ ( 2* a6) ^ ( 3* a7);
        assign b7 = ( 3* a4) ^ a5  ^ a6 ^ ( 2* a7);

    //third column
        assign b8 = (2 * a8) ^ (3 * a9) ^  a10 ^ a11;
        assign b9 = a8 ^ (2 * a9 ) ^ ( 3* a10) ^ a11;
        assign b10 = a8 ^ a9  ^ ( 2* a10) ^ ( 3* a11);
        assign b11 = ( 3* a8) ^ a9  ^ a10 ^ ( 2* a11);

    //fourth column
        assign b12 = (2 * a12) ^ (3 * a13) ^  a14 ^ a15;
        assign b13 = a12 ^ (2 * a13 ) ^ ( 3* a14) ^ a15;
        assign b14 = a12 ^ a13  ^ ( 2* a14) ^ ( 3* a15);
        assign b15 = ( 3* a12) ^ a13  ^ a14 ^ ( 2* a15);


//output logic
    assign mix_columns_out = {b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15};
  
endmodule