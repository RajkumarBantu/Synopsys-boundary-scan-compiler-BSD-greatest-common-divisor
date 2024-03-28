
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_gcd_bsd is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_gcd_bsd;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_gcd_bsd.all;

entity regis_1 is

   port( rst, clk, load : in std_logic;  input : in std_logic_vector (3 downto 
         0);  output : out std_logic_vector (3 downto 0));

end regis_1;

architecture SYN_regis_arc of regis_1 is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal output_3_port, output_2_port, output_1_port, output_0_port, n7, n8, 
      n9, n10, n11, n12, n_1000, n_1001, n_1002, n_1003 : std_logic;

begin
   output <= ( output_3_port, output_2_port, output_1_port, output_0_port );
   
   output_reg_3_inst : DFFARX1 port map( D => n7, CLK => clk, RSTB => n8, Q => 
                           output_3_port, QN => n_1000);
   output_reg_2_inst : DFFARX1 port map( D => n9, CLK => clk, RSTB => n8, Q => 
                           output_2_port, QN => n_1001);
   output_reg_1_inst : DFFARX1 port map( D => n10, CLK => clk, RSTB => n8, Q =>
                           output_1_port, QN => n_1002);
   output_reg_0_inst : DFFARX1 port map( D => n11, CLK => clk, RSTB => n8, Q =>
                           output_0_port, QN => n_1003);
   U2 : AO22X1 port map( IN1 => output_0_port, IN2 => n12, IN3 => load, IN4 => 
                           input(0), Q => n11);
   U3 : AO22X1 port map( IN1 => output_1_port, IN2 => n12, IN3 => input(1), IN4
                           => load, Q => n10);
   U4 : AO22X1 port map( IN1 => output_2_port, IN2 => n12, IN3 => input(2), IN4
                           => load, Q => n9);
   U5 : INVX0 port map( INP => rst, ZN => n8);
   U6 : AO22X1 port map( IN1 => output_3_port, IN2 => n12, IN3 => input(3), IN4
                           => load, Q => n7);
   U7 : INVX0 port map( INP => load, ZN => n12);

end SYN_regis_arc;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_gcd_bsd.all;

entity regis_0 is

   port( rst, clk, load : in std_logic;  input : in std_logic_vector (3 downto 
         0);  output : out std_logic_vector (3 downto 0));

end regis_0;

architecture SYN_regis_arc of regis_0 is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal output_3_port, output_2_port, output_1_port, output_0_port, n7, n8, 
      n9, n10, n11, n12, n_1004, n_1005, n_1006, n_1007 : std_logic;

begin
   output <= ( output_3_port, output_2_port, output_1_port, output_0_port );
   
   output_reg_3_inst : DFFARX1 port map( D => n7, CLK => clk, RSTB => n8, Q => 
                           output_3_port, QN => n_1004);
   output_reg_2_inst : DFFARX1 port map( D => n9, CLK => clk, RSTB => n8, Q => 
                           output_2_port, QN => n_1005);
   output_reg_1_inst : DFFARX1 port map( D => n10, CLK => clk, RSTB => n8, Q =>
                           output_1_port, QN => n_1006);
   output_reg_0_inst : DFFARX1 port map( D => n11, CLK => clk, RSTB => n8, Q =>
                           output_0_port, QN => n_1007);
   U2 : AO22X1 port map( IN1 => output_0_port, IN2 => n12, IN3 => load, IN4 => 
                           input(0), Q => n11);
   U3 : AO22X1 port map( IN1 => output_1_port, IN2 => n12, IN3 => input(1), IN4
                           => load, Q => n10);
   U4 : AO22X1 port map( IN1 => output_2_port, IN2 => n12, IN3 => input(2), IN4
                           => load, Q => n9);
   U5 : INVX0 port map( INP => rst, ZN => n8);
   U6 : AO22X1 port map( IN1 => output_3_port, IN2 => n12, IN3 => input(3), IN4
                           => load, Q => n7);
   U7 : INVX0 port map( INP => load, ZN => n12);

end SYN_regis_arc;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_gcd_bsd.all;

entity mux_0 is

   port( rst, sLine : in std_logic;  load, result : in std_logic_vector (3 
         downto 0);  output : out std_logic_vector (3 downto 0));

end mux_0;

architecture SYN_mux_arc of mux_0 is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U5 : AO22X1 port map( IN1 => result(3), IN2 => n5, IN3 => load(3), IN4 => n4
                           , Q => output(3));
   U6 : AO22X1 port map( IN1 => result(2), IN2 => n5, IN3 => load(2), IN4 => n4
                           , Q => output(2));
   U7 : AO22X1 port map( IN1 => result(1), IN2 => n5, IN3 => load(1), IN4 => n4
                           , Q => output(1));
   U8 : AO22X1 port map( IN1 => result(0), IN2 => n5, IN3 => load(0), IN4 => n4
                           , Q => output(0));
   U2 : NOR2X0 port map( IN1 => rst, IN2 => sLine, QN => n4);
   U3 : NOR2X0 port map( IN1 => n6, IN2 => rst, QN => n5);
   U4 : INVX0 port map( INP => sLine, ZN => n6);

end SYN_mux_arc;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_gcd_bsd.all;

entity subtractor_0 is

   port( rst : in std_logic;  cmd : in std_logic_vector (1 downto 0);  x, y : 
         in std_logic_vector (3 downto 0);  xout, yout : out std_logic_vector 
         (3 downto 0));

end subtractor_0;

architecture SYN_subtractor_arc of subtractor_0 is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2X1
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component OA221X1
      port( IN1, IN2, IN3, IN4, IN5 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO21X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component XNOR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component AND2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component OA22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   signal n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
      n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34
      , n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, 
      n49, n50 : std_logic;

begin
   
   U31 : NAND3X0 port map( IN1 => n5, IN2 => n18, IN3 => y(3), QN => n17);
   U32 : NAND3X0 port map( IN1 => n19, IN2 => n13, IN3 => n20, QN => n16);
   U33 : XNOR2X1 port map( IN1 => x(3), IN2 => n21, Q => n19);
   U34 : OA22X1 port map( IN1 => y(2), IN2 => n22, IN3 => n23, IN4 => n8, Q => 
                           n21);
   U35 : AND2X1 port map( IN1 => n23, IN2 => n8, Q => n22);
   U36 : NAND3X0 port map( IN1 => n5, IN2 => n26, IN3 => y(2), QN => n25);
   U37 : NAND3X0 port map( IN1 => n27, IN2 => n14, IN3 => n20, QN => n24);
   U38 : XNOR2X1 port map( IN1 => n23, IN2 => x(2), Q => n27);
   U39 : AO22X1 port map( IN1 => n11, IN2 => n9, IN3 => y(1), IN4 => n28, Q => 
                           n23);
   U40 : NAND3X0 port map( IN1 => y(1), IN2 => n32, IN3 => n5, QN => n31);
   U41 : NAND3X0 port map( IN1 => n33, IN2 => n15, IN3 => n20, QN => n30);
   U42 : XNOR2X1 port map( IN1 => n9, IN2 => n29, Q => n33);
   U43 : AO22X1 port map( IN1 => n20, IN2 => n29, IN3 => n5, IN4 => n34, Q => 
                           yout(0));
   U44 : AO21X1 port map( IN1 => y(0), IN2 => cmd(1), IN3 => n10, Q => n34);
   U45 : XOR2X1 port map( IN1 => n37, IN2 => x(3), Q => n36);
   U46 : XNOR2X1 port map( IN1 => y(3), IN2 => n39, Q => n38);
   U47 : OA22X1 port map( IN1 => n40, IN2 => n14, IN3 => x(2), IN4 => n41, Q =>
                           n39);
   U48 : AND2X1 port map( IN1 => n41, IN2 => x(2), Q => n40);
   U49 : XNOR2X1 port map( IN1 => x(2), IN2 => n43, Q => n42);
   U50 : XNOR2X1 port map( IN1 => n41, IN2 => n14, Q => n44);
   U51 : AO22X1 port map( IN1 => x(1), IN2 => n45, IN3 => n46, IN4 => n15, Q =>
                           n41);
   U52 : XNOR2X1 port map( IN1 => n48, IN2 => n9, Q => n47);
   U53 : XNOR2X1 port map( IN1 => n15, IN2 => n10, Q => n49);
   U54 : AO21X1 port map( IN1 => n7, IN2 => n6, IN3 => rst, Q => n35);
   U55 : OA221X1 port map( IN1 => n12, IN2 => n7, IN3 => cmd(0), IN4 => n45, 
                           IN5 => n11, Q => n50);
   U2 : NAND2X1 port map( IN1 => n33, IN2 => n6, QN => n32);
   U3 : INVX0 port map( INP => cmd(1), ZN => n6);
   U4 : NOR2X0 port map( IN1 => n35, IN2 => cmd(1), QN => n20);
   U5 : INVX0 port map( INP => cmd(0), ZN => n7);
   U6 : INVX0 port map( INP => n35, ZN => n5);
   U7 : NOR2X0 port map( IN1 => n50, IN2 => n35, QN => xout(0));
   U8 : NOR2X0 port map( IN1 => n47, IN2 => n35, QN => xout(1));
   U9 : NAND2X1 port map( IN1 => n49, IN2 => n7, QN => n48);
   U10 : NAND2X1 port map( IN1 => n27, IN2 => n6, QN => n26);
   U11 : NAND2X1 port map( IN1 => n19, IN2 => n6, QN => n18);
   U12 : INVX0 port map( INP => n45, ZN => n10);
   U13 : INVX0 port map( INP => n29, ZN => n11);
   U14 : INVX0 port map( INP => y(3), ZN => n13);
   U15 : NOR2X0 port map( IN1 => n42, IN2 => n35, QN => xout(2));
   U16 : NOR2X0 port map( IN1 => cmd(0), IN2 => n44, QN => n43);
   U17 : NOR2X0 port map( IN1 => n36, IN2 => n35, QN => xout(3));
   U18 : NAND2X1 port map( IN1 => n38, IN2 => n7, QN => n37);
   U19 : NAND2X1 port map( IN1 => n24, IN2 => n25, QN => yout(2));
   U20 : NAND2X1 port map( IN1 => n16, IN2 => n17, QN => yout(3));
   U21 : NAND2X1 port map( IN1 => n30, IN2 => n31, QN => yout(1));
   U22 : NOR2X0 port map( IN1 => n12, IN2 => y(0), QN => n29);
   U23 : INVX0 port map( INP => x(1), ZN => n9);
   U24 : INVX0 port map( INP => x(0), ZN => n12);
   U25 : NAND2X1 port map( IN1 => n10, IN2 => n9, QN => n46);
   U26 : INVX0 port map( INP => y(1), ZN => n15);
   U27 : NAND2X1 port map( IN1 => y(0), IN2 => n12, QN => n45);
   U28 : NAND2X1 port map( IN1 => x(1), IN2 => n29, QN => n28);
   U29 : INVX0 port map( INP => x(2), ZN => n8);
   U30 : INVX0 port map( INP => y(2), ZN => n14);

end SYN_subtractor_arc;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_gcd_bsd.all;

entity comparator_0 is

   port( rst : in std_logic;  x, y : in std_logic_vector (3 downto 0);  output 
         : out std_logic_vector (1 downto 0));

end comparator_0;

architecture SYN_comparator_arc of comparator_0 is

   component NAND2X1
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component OR3X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI21X1
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component OA221X1
      port( IN1, IN2, IN3, IN4, IN5 : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component AO21X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component OA21X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   signal n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
      n20, n21, n22, n23 : std_logic;

begin
   
   U17 : OA21X1 port map( IN1 => y(3), IN2 => n7, IN3 => n13, Q => n12);
   U18 : NAND3X0 port map( IN1 => n14, IN2 => n15, IN3 => n16, QN => n13);
   U19 : AO21X1 port map( IN1 => n9, IN2 => n17, IN3 => n18, Q => n15);
   U20 : NAND3X0 port map( IN1 => n19, IN2 => n10, IN3 => y(0), QN => n17);
   U21 : OA221X1 port map( IN1 => y(3), IN2 => n7, IN3 => n6, IN4 => n21, IN5 
                           => n5, Q => output(0));
   U22 : AOI21X1 port map( IN1 => n16, IN2 => n22, IN3 => n18, QN => n21);
   U23 : OR3X1 port map( IN1 => n10, IN2 => y(0), IN3 => n20, Q => n23);
   U3 : INVX0 port map( INP => n20, ZN => n9);
   U4 : INVX0 port map( INP => n14, ZN => n6);
   U5 : INVX0 port map( INP => rst, ZN => n5);
   U6 : NOR2X0 port map( IN1 => rst, IN2 => n12, QN => output(1));
   U7 : INVX0 port map( INP => x(2), ZN => n8);
   U8 : INVX0 port map( INP => y(1), ZN => n11);
   U9 : NOR2X0 port map( IN1 => n11, IN2 => x(1), QN => n20);
   U10 : INVX0 port map( INP => x(3), ZN => n7);
   U11 : NOR2X0 port map( IN1 => n8, IN2 => y(2), QN => n18);
   U12 : NAND2X1 port map( IN1 => x(1), IN2 => n11, QN => n19);
   U13 : NAND2X1 port map( IN1 => y(3), IN2 => n7, QN => n14);
   U14 : INVX0 port map( INP => x(0), ZN => n10);
   U15 : NAND2X1 port map( IN1 => y(2), IN2 => n8, QN => n16);
   U16 : NAND2X1 port map( IN1 => n23, IN2 => n19, QN => n22);

end SYN_comparator_arc;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_gcd_bsd.all;

entity regis_2 is

   port( rst, clk, load : in std_logic;  input : in std_logic_vector (3 downto 
         0);  output : out std_logic_vector (3 downto 0));

end regis_2;

architecture SYN_regis_arc of regis_2 is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal output_3_port, output_2_port, output_1_port, output_0_port, n1, n2, 
      n3, n4, n5, n6, n_1008, n_1009, n_1010, n_1011 : std_logic;

begin
   output <= ( output_3_port, output_2_port, output_1_port, output_0_port );
   
   output_reg_3_inst : DFFARX1 port map( D => n6, CLK => clk, RSTB => n5, Q => 
                           output_3_port, QN => n_1008);
   output_reg_2_inst : DFFARX1 port map( D => n4, CLK => clk, RSTB => n5, Q => 
                           output_2_port, QN => n_1009);
   output_reg_1_inst : DFFARX1 port map( D => n3, CLK => clk, RSTB => n5, Q => 
                           output_1_port, QN => n_1010);
   output_reg_0_inst : DFFARX1 port map( D => n2, CLK => clk, RSTB => n5, Q => 
                           output_0_port, QN => n_1011);
   U2 : AO22X1 port map( IN1 => output_0_port, IN2 => n1, IN3 => load, IN4 => 
                           input(0), Q => n2);
   U3 : AO22X1 port map( IN1 => output_1_port, IN2 => n1, IN3 => input(1), IN4 
                           => load, Q => n3);
   U4 : AO22X1 port map( IN1 => output_2_port, IN2 => n1, IN3 => input(2), IN4 
                           => load, Q => n4);
   U5 : INVX0 port map( INP => rst, ZN => n5);
   U6 : AO22X1 port map( IN1 => output_3_port, IN2 => n1, IN3 => input(3), IN4 
                           => load, Q => n6);
   U7 : INVX0 port map( INP => load, ZN => n1);

end SYN_regis_arc;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_gcd_bsd.all;

entity mux_1 is

   port( rst, sLine : in std_logic;  load, result : in std_logic_vector (3 
         downto 0);  output : out std_logic_vector (3 downto 0));

end mux_1;

architecture SYN_mux_arc of mux_1 is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   signal n1, n2, n3 : std_logic;

begin
   
   U5 : AO22X1 port map( IN1 => result(3), IN2 => n2, IN3 => load(3), IN4 => n3
                           , Q => output(3));
   U6 : AO22X1 port map( IN1 => result(2), IN2 => n2, IN3 => load(2), IN4 => n3
                           , Q => output(2));
   U7 : AO22X1 port map( IN1 => result(1), IN2 => n2, IN3 => load(1), IN4 => n3
                           , Q => output(1));
   U8 : AO22X1 port map( IN1 => result(0), IN2 => n2, IN3 => load(0), IN4 => n3
                           , Q => output(0));
   U2 : NOR2X0 port map( IN1 => rst, IN2 => sLine, QN => n3);
   U3 : NOR2X0 port map( IN1 => n1, IN2 => rst, QN => n2);
   U4 : INVX0 port map( INP => sLine, ZN => n1);

end SYN_mux_arc;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_gcd_bsd.all;

entity fsm_0 is

   port( rst, clk, proceed : in std_logic;  comparison : in std_logic_vector (1
         downto 0);  enable, xsel, ysel, xld, yld : out std_logic);

end fsm_0;

architecture SYN_fsm_arc of fsm_0 is

   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component NAND2X1
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component OR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO221X1
      port( IN1, IN2, IN3, IN4, IN5 : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND4X0
      port( IN1, IN2, IN3, IN4 : in std_logic;  QN : out std_logic);
   end component;
   
   component AND3X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component OA21X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal xsel_port, xld_port, cState_2_port, cState_1_port, cState_0_port, 
      nState_2_port, nState_1_port, nState_0_port, n1, n2, n3, n5, n6, n7, n8, 
      n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19 : std_logic;

begin
   xsel <= xsel_port;
   xld <= xld_port;
   
   cState_reg_0_inst : DFFARX1 port map( D => nState_0_port, CLK => clk, RSTB 
                           => n1, Q => cState_0_port, QN => n7);
   cState_reg_1_inst : DFFARX1 port map( D => nState_1_port, CLK => clk, RSTB 
                           => n1, Q => cState_1_port, QN => n6);
   cState_reg_2_inst : DFFARX1 port map( D => nState_2_port, CLK => clk, RSTB 
                           => n1, Q => cState_2_port, QN => n3);
   U3 : INVX0 port map( INP => rst, ZN => n1);
   U14 : OA21X1 port map( IN1 => n9, IN2 => n5, IN3 => cState_2_port, Q => ysel
                           );
   U15 : NAND3X0 port map( IN1 => n10, IN2 => n11, IN3 => n12, QN => yld);
   U16 : AND3X1 port map( IN1 => n14, IN2 => n3, IN3 => n15, Q => nState_2_port
                           );
   U17 : OR2X1 port map( IN1 => comparison(0), IN2 => comparison(1), Q => n15);
   U18 : NAND4X0 port map( IN1 => n16, IN2 => n17, IN3 => n11, IN4 => n13, QN 
                           => nState_1_port);
   U19 : NAND3X0 port map( IN1 => cState_0_port, IN2 => n3, IN3 => n18, QN => 
                           n16);
   U20 : XOR2X1 port map( IN1 => comparison(0), IN2 => n8, Q => n18);
   U21 : AO221X1 port map( IN1 => proceed, IN2 => n7, IN3 => n14, IN4 => n8, 
                           IN5 => n19, Q => nState_0_port);
   U22 : OR2X1 port map( IN1 => xld_port, IN2 => cState_2_port, Q => n19);
   U23 : NAND3X0 port map( IN1 => n7, IN2 => n6, IN3 => cState_2_port, QN => 
                           n17);
   U24 : NAND3X0 port map( IN1 => n7, IN2 => n3, IN3 => cState_1_port, QN => 
                           n11);
   U25 : NAND3X0 port map( IN1 => cState_1_port, IN2 => n7, IN3 => 
                           cState_2_port, QN => n10);
   U4 : INVX0 port map( INP => comparison(1), ZN => n8);
   U5 : NAND2X1 port map( IN1 => n10, IN2 => n17, QN => xsel_port);
   U6 : INVX0 port map( INP => n10, ZN => enable);
   U7 : NAND2X1 port map( IN1 => n11, IN2 => n2, QN => xld_port);
   U8 : INVX0 port map( INP => xsel_port, ZN => n2);
   U9 : INVX0 port map( INP => n13, ZN => n5);
   U10 : NAND2X1 port map( IN1 => n5, IN2 => cState_2_port, QN => n12);
   U11 : NOR2X0 port map( IN1 => cState_0_port, IN2 => n6, QN => n9);
   U12 : NAND2X1 port map( IN1 => cState_0_port, IN2 => n6, QN => n13);
   U13 : NOR2X0 port map( IN1 => n7, IN2 => n6, QN => n14);

end SYN_fsm_arc;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_gcd_bsd.all;

entity gcd_0 is

   port( rst, clk, go_i : in std_logic;  x_i, y_i : in std_logic_vector (3 
         downto 0);  d_o : out std_logic_vector (3 downto 0));

end gcd_0;

architecture SYN_gcd_arc of gcd_0 is

   component regis_0
      port( rst, clk, load : in std_logic;  input : in std_logic_vector (3 
            downto 0);  output : out std_logic_vector (3 downto 0));
   end component;
   
   component subtractor_0
      port( rst : in std_logic;  cmd : in std_logic_vector (1 downto 0);  x, y 
            : in std_logic_vector (3 downto 0);  xout, yout : out 
            std_logic_vector (3 downto 0));
   end component;
   
   component comparator_0
      port( rst : in std_logic;  x, y : in std_logic_vector (3 downto 0);  
            output : out std_logic_vector (1 downto 0));
   end component;
   
   component regis_1
      port( rst, clk, load : in std_logic;  input : in std_logic_vector (3 
            downto 0);  output : out std_logic_vector (3 downto 0));
   end component;
   
   component regis_2
      port( rst, clk, load : in std_logic;  input : in std_logic_vector (3 
            downto 0);  output : out std_logic_vector (3 downto 0));
   end component;
   
   component mux_0
      port( rst, sLine : in std_logic;  load, result : in std_logic_vector (3 
            downto 0);  output : out std_logic_vector (3 downto 0));
   end component;
   
   component mux_1
      port( rst, sLine : in std_logic;  load, result : in std_logic_vector (3 
            downto 0);  output : out std_logic_vector (3 downto 0));
   end component;
   
   component fsm_0
      port( rst, clk, proceed : in std_logic;  comparison : in std_logic_vector
            (1 downto 0);  enable, xsel, ysel, xld, yld : out std_logic);
   end component;
   
   signal comparison_1_port, comparison_0_port, enable, xsel, ysel, xld, yld, 
      xsub_3_port, xsub_2_port, xsub_1_port, xsub_0_port, xmux_3_port, 
      xmux_2_port, xmux_1_port, xmux_0_port, ysub_3_port, ysub_2_port, 
      ysub_1_port, ysub_0_port, ymux_3_port, ymux_2_port, ymux_1_port, 
      ymux_0_port, xreg_3_port, xreg_2_port, xreg_1_port, xreg_0_port, 
      yreg_3_port, yreg_2_port, yreg_1_port, yreg_0_port : std_logic;

begin
   
   TOFSM : fsm_0 port map( rst => rst, clk => clk, proceed => go_i, 
                           comparison(1) => comparison_1_port, comparison(0) =>
                           comparison_0_port, enable => enable, xsel => xsel, 
                           ysel => ysel, xld => xld, yld => yld);
   X_MUX : mux_1 port map( rst => rst, sLine => xsel, load(3) => x_i(3), 
                           load(2) => x_i(2), load(1) => x_i(1), load(0) => 
                           x_i(0), result(3) => xsub_3_port, result(2) => 
                           xsub_2_port, result(1) => xsub_1_port, result(0) => 
                           xsub_0_port, output(3) => xmux_3_port, output(2) => 
                           xmux_2_port, output(1) => xmux_1_port, output(0) => 
                           xmux_0_port);
   Y_MUX : mux_0 port map( rst => rst, sLine => ysel, load(3) => y_i(3), 
                           load(2) => y_i(2), load(1) => y_i(1), load(0) => 
                           y_i(0), result(3) => ysub_3_port, result(2) => 
                           ysub_2_port, result(1) => ysub_1_port, result(0) => 
                           ysub_0_port, output(3) => ymux_3_port, output(2) => 
                           ymux_2_port, output(1) => ymux_1_port, output(0) => 
                           ymux_0_port);
   X_REG : regis_2 port map( rst => rst, clk => clk, load => xld, input(3) => 
                           xmux_3_port, input(2) => xmux_2_port, input(1) => 
                           xmux_1_port, input(0) => xmux_0_port, output(3) => 
                           xreg_3_port, output(2) => xreg_2_port, output(1) => 
                           xreg_1_port, output(0) => xreg_0_port);
   Y_REG : regis_1 port map( rst => rst, clk => clk, load => yld, input(3) => 
                           ymux_3_port, input(2) => ymux_2_port, input(1) => 
                           ymux_1_port, input(0) => ymux_0_port, output(3) => 
                           yreg_3_port, output(2) => yreg_2_port, output(1) => 
                           yreg_1_port, output(0) => yreg_0_port);
   U_COMP : comparator_0 port map( rst => rst, x(3) => xreg_3_port, x(2) => 
                           xreg_2_port, x(1) => xreg_1_port, x(0) => 
                           xreg_0_port, y(3) => yreg_3_port, y(2) => 
                           yreg_2_port, y(1) => yreg_1_port, y(0) => 
                           yreg_0_port, output(1) => comparison_1_port, 
                           output(0) => comparison_0_port);
   X_SUB : subtractor_0 port map( rst => rst, cmd(1) => comparison_1_port, 
                           cmd(0) => comparison_0_port, x(3) => xreg_3_port, 
                           x(2) => xreg_2_port, x(1) => xreg_1_port, x(0) => 
                           xreg_0_port, y(3) => yreg_3_port, y(2) => 
                           yreg_2_port, y(1) => yreg_1_port, y(0) => 
                           yreg_0_port, xout(3) => xsub_3_port, xout(2) => 
                           xsub_2_port, xout(1) => xsub_1_port, xout(0) => 
                           xsub_0_port, yout(3) => ysub_3_port, yout(2) => 
                           ysub_2_port, yout(1) => ysub_1_port, yout(0) => 
                           ysub_0_port);
   OUT_REG : regis_0 port map( rst => rst, clk => clk, load => enable, input(3)
                           => xsub_3_port, input(2) => xsub_2_port, input(1) =>
                           xsub_1_port, input(0) => xsub_0_port, output(3) => 
                           d_o(3), output(2) => d_o(2), output(1) => d_o(1), 
                           output(0) => d_o(0));

end SYN_gcd_arc;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_gcd_bsd.all;

entity gcd_bsd is

   port( rst, clk, go_i : in std_logic;  x_i, y_i : in std_logic_vector (3 
         downto 0);  d_o : out std_logic_vector (3 downto 0));

end gcd_bsd;

architecture SYN_gcd_bsd_arc of gcd_bsd is

   component gcd_0
      port( rst, clk, go_i : in std_logic;  x_i, y_i : in std_logic_vector (3 
            downto 0);  d_o : out std_logic_vector (3 downto 0));
   end component;

begin
   
   M_GCD : gcd_0 port map( rst => rst, clk => clk, go_i => go_i, x_i(3) => 
                           x_i(3), x_i(2) => x_i(2), x_i(1) => x_i(1), x_i(0) 
                           => x_i(0), y_i(3) => y_i(3), y_i(2) => y_i(2), 
                           y_i(1) => y_i(1), y_i(0) => y_i(0), d_o(3) => d_o(3)
                           , d_o(2) => d_o(2), d_o(1) => d_o(1), d_o(0) => 
                           d_o(0));

end SYN_gcd_bsd_arc;
