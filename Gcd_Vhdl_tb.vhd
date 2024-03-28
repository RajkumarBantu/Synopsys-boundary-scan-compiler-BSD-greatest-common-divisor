library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.all;

entity tb_gcd_bsd is
end tb_gcd_bsd;

architecture tb_gcd_behav of tb_gcd_bsd is

component gcd_bsd

    port(	
		rst, clk, go_i: in std_logic;
		x_i, y_i: in std_logic_vector( 3 downto 0 );
		d_o: out std_logic_vector( 3 downto 0 )
	);
end component;

signal t_xinput, t_yinput : std_logic_vector(3 downto 0);
signal t_clk, t_rst, t_go_i : std_logic;
signal t_output : std_logic_vector(3 downto 0);

begin


	gcd_tester : gcd_bsd 

	port map (t_rst, t_clk, t_go_i, t_xinput, t_yinput, t_output);


	Clockprocess : process
	begin
		for i in 1 to 300 loop
		t_clk <= '0';
		wait for 5 ns;
		t_clk <= '1';
		wait for 5 ns;
		end loop;
	wait;
	end process;

	gcd_test : process
	begin
		t_rst <= '1';
		t_go_i <= '0';
		wait for 10 ns;

		t_rst <= '0';
		--wait for 10 ns;
		t_xinput <= "1010";  
		t_yinput <= "0101";
		t_go_i <= '1';
       		wait for 400 ns;                    

		t_rst <= '1';
		t_go_i <= '0';
       		wait for 10 ns;

		t_rst <= '0';
		t_xinput <= "1100";
		t_yinput <= "1000";
		t_go_i <= '1';
		wait for 250 ns;

		t_rst <= '1';
		t_go_i <= '0';
       		wait for 10 ns;

		t_rst <= '0';
		t_xinput <= "1111";
		t_yinput <= "1000";
		t_go_i <= '1';
		wait for 250 ns;

        t_rst <= '1';
		t_go_i <= '0';
       		wait for 10 ns;

		t_rst <= '0';
		t_xinput <= "1100";	
		t_yinput <= "0010";
		t_go_i <= '1';
		wait for 350 ns;

        t_rst <= '1';
		t_go_i <= '0';
       		wait for 10 ns;

		t_rst <= '0';
		t_xinput <= "1010";
		t_yinput <= "0011";	
		t_go_i <= '1';
		wait for 250 ns;

        t_rst <= '1';
		t_go_i <= '0';
       		wait for 10 ns;

		t_rst <= '0';
		t_xinput <= "1011"; 
		t_yinput <= "0101"; 
		t_go_i <= '1';
		wait for 250 ns;

        t_rst <= '1';
		t_go_i <= '0';
       		wait for 10 ns;

		t_rst <= '0';
		t_xinput <= "0011";
		t_yinput <= "0001";	
		t_go_i <= '1';
		wait for 250 ns;

        t_rst <= '1';
		t_go_i <= '0';
       		wait for 10 ns;

		t_rst <= '0';
		t_xinput <= "0011"; 
		t_yinput <= "1001"; 
		t_go_i <= '1';
		wait for 250 ns;
        
		wait;
	end process;
end tb_gcd_behav;

