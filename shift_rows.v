module shift_rows 
(
    input [0:127] shift_rows_in,
    output [0:127] shift_rows_out
);
    localparam byte_size = 8;

//wires for data "a"
    wire [0:byte_size-1] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15;

//wires for output "b"
    wire [0:byte_size-1] b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15;


//partitoining the data 
    assign a0 = shift_rows_in[0 : byte_size - 1];
    assign a1 = shift_rows_in[byte_size : 2 * byte_size - 1];
    assign a2 = shift_rows_in[2 * byte_size : 3 * byte_size - 1];
    assign a3 = shift_rows_in[3 * byte_size : 4 * byte_size - 1];
    assign a4 = shift_rows_in[4 * byte_size : 5 * byte_size - 1];
    assign a5 = shift_rows_in[5 * byte_size : 6 * byte_size - 1];
    assign a6 = shift_rows_in[6 * byte_size : 7 * byte_size - 1];
    assign a7 = shift_rows_in[7 * byte_size : 8 * byte_size - 1];
    assign a8 = shift_rows_in[8 * byte_size : 9 * byte_size - 1];
    assign a9 = shift_rows_in[9 * byte_size : 10 * byte_size - 1];
    assign a10 = shift_rows_in[10 * byte_size : 11 * byte_size - 1];
    assign a11 = shift_rows_in[11 * byte_size : 12 * byte_size - 1];
    assign a12 = shift_rows_in[12 * byte_size : 13 * byte_size - 1];
    assign a13 = shift_rows_in[13 * byte_size : 14 * byte_size - 1];
    assign a14 = shift_rows_in[14 * byte_size : 15 * byte_size - 1];
    assign a15 = shift_rows_in[15 * byte_size : 16 * byte_size - 1];

//operation logic
    //part with no change
        assign b0 = a0 ;
        assign b4 = a4 ;
        assign b8 = a8 ;
        assign b12 = a12 ;

    //part shifted by 1
        assign b1 = a5 ;
        assign b5 = a9 ;
        assign b9 = a13 ;
        assign b13 = a1 ;

    //part shifted by 2
        assign b2 = a10 ;
        assign b6 = a14 ;
        assign b10 = a2 ;
        assign b14 = a6 ;

    //part shifted by 4
        assign b3 = a15 ;
        assign b7 = a3 ;
        assign b11 = a7 ;
        assign b15 = a11 ;


//output logic
    assign shift_rows_out = {b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15};
  
    
endmodule