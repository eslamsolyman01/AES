library verilog;
use verilog.vl_types.all;
entity AES_top is
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        key             : in     vl_logic_vector(0 to 127);
        data            : in     vl_logic_vector(0 to 127);
        done            : out    vl_logic;
        cipher          : out    vl_logic_vector(0 to 127)
    );
end AES_top;
