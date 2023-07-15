module final_round 
(
    input [0:127] final_round_data, final_round_key,
    output [0:127] final_round_out

);

wire [0:127] sub_bytes_out, shift_rows_out;

//block instantiations
    //sub_bytes
        sub_bytes sub_bytes_final_inst (.sub_bytes_in(final_round_data), .sub_bytes_out(sub_bytes_out));
    //shift_rows
        shift_rows shift_rows_final_inst (.shift_rows_in(sub_bytes_out), .shift_rows_out(shift_rows_out));
    //add_round_key
        add_round_key add_round_key_final_inst (.add_round_key_in(shift_rows_out), .key(final_round_key), .add_round_key_out(final_round_out));


endmodule