library verilog;
use verilog.vl_types.all;
entity shift_rows is
    port(
        shift_rows_in   : in     vl_logic_vector(0 to 127);
        shift_rows_out  : out    vl_logic_vector(0 to 127)
    );
end shift_rows;
