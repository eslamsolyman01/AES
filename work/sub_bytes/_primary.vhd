library verilog;
use verilog.vl_types.all;
entity sub_bytes is
    port(
        sub_bytes_in    : in     vl_logic_vector(0 to 127);
        sub_bytes_out   : out    vl_logic_vector(0 to 127)
    );
end sub_bytes;
