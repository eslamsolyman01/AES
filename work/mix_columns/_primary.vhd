library verilog;
use verilog.vl_types.all;
entity mix_columns is
    port(
        mix_columns_in  : in     vl_logic_vector(0 to 127);
        mix_columns_out : out    vl_logic_vector(0 to 127)
    );
end mix_columns;
