library verilog;
use verilog.vl_types.all;
entity cronometro is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        stst            : in     vl_logic;
        en              : in     vl_logic;
        out_3           : out    vl_logic_vector(7 downto 0);
        out_2           : out    vl_logic_vector(7 downto 0);
        out_1           : out    vl_logic_vector(7 downto 0);
        out_0           : out    vl_logic_vector(7 downto 0)
    );
end cronometro;
