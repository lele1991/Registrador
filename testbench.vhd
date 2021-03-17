library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
    generic(
        constant NBITS: integer := 16
    );
end entity testbench;

architecture RTL of testbench is
    signal clkT:     std_logic;
    signal sclr_nT:  std_logic;
    signal clk_enaT: std_logic;
    signal datainT:  std_logic_vector(15 downto 0);
    signal reg_outT: std_logic_vector(15 downto 0);

begin
    dut_reg: entity work.reg
        port map(
        --esqerda _vhd >> direita testbench
            clk => clkT,
            sclr_n => sclr_nT,
            clk_ena => clk_enaT,
            datain => datainT,
            reg_out => reg_outT
        );
        
    process
        begin
        datainT <= "1111111111111111";
        clkT <= '0';
        clk_enaT <= '0';
        --n faz nada
        wait for 10 ns; 
        
        clk_enaT <= '1';
        clkT <= '1';
        --saída atribuída à entrada
        wait for 10 ns; 
        
        sclr_nT <= '0';
        --limpa a saída -> reg_out <= "0000000000000000"
        wait for 10 ns; 
        
        clkT <= '1';
        clk_enaT <= '0';
        wait;        
        
    end process;
        
end architecture RTL;