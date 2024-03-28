#BSD

#set synthetic_library [list dw_foundation.sldb ]


set link_library /home/banturr/Desktop/VLSI_Test_Power/Lab4/db/saed90nm_typ_ht.db
set target_library /home/banturr/Desktop/VLSI_Test_Power/Lab4/db/saed90nm_typ_ht.db 
set synthetic_library \
[list dw_foundation.sldb ]
set link_library [concat $link_library \
$synthetic_library $target_library]


#Read in top-level design
read_verilog /home/banturr/Desktop/VLSI_Test_Power/Lab4/src/GCD_bsd_scan.v
read_verilog /home/banturr/Desktop/VLSI_Test_Power/Lab4/src/TOP.v
set current_design TOP
link
#dont_touch CORE and pads
set_dont_touch [list gcd_bsd GTECH_INBUF GTECH_OUTBUF]
#read pin map for BSR cell order
read_pin_map /home/banturr/Desktop/VLSI_Test_Power/Lab4/src/03-pin.txt
#define Tap signals
set_dft_signal -view spec -type TCK -port TCK
set_dft_signal -view spec -type TDI -port TDI
set_dft_signal -view spec -type TDO -port TDO
set_dft_signal -view spec -type TMS -port TMS
set_dft_signal -view spec -type TRST -port TRSTN
#define functional clocks
create_clock CLK -period 100 -waveform {0 50}
#Configure tap
set_bsd_configuration -ir_width 4
#Define standard instructions
#opcodes: extest= 0010, sample & preload=0100, bypass=1111
set_bsd_instruction -view spec [list EXTEST] -code [list 0001] -reg BOUNDARY
set_bsd_instruction -view spec [list SAMPLE] -code [list 0100] -reg BOUNDARY
set_bsd_instruction -view spec [list PRELOAD] -code [list 0100] -reg BOUNDARY
set_bsd_instruction -view spec [list BYPASS] -code [list 1111] -reg BYPASS
#Define instructions for CLAMP [opcode=0010]
set_bsd_instruction -view spec [list CLAMP] -code [list 0010] -reg BYPASS

#Define compliance enable signals for TEST_MODE=1; RESETN=1
#switched these two from 11
set_bsd_compliance -name P1 -pattern {TEST_SE 1 RST 0}
#sets unique identification code for the chip

#set_bsd_instruction IDCODE -register DEVICE_ID -code 0111 -capture_value
#{32'b00000000000000000000000000000111'}

#Enable bsd-insertion
set_dft_configuration -bsd enable -scan disable
#Run preview
preview_dft -bsd all
#insert jtag..includes compile
insert_dft
#Compliance checking
#set_bsd_instruction -view spec [list EXTEST] -code [list 0001] -reg BOUNDARY
#set_bsd_instruction
check_bsd -verbose

#Generate bsdl file
write_bsdl -out /home/banturr/Desktop/VLSI_Test_Power/Lab4/src/TOP_bsd_1.bsdl
#Generate bsd patterns
create_bsd_patterns -type all
write_test -format stil -output /home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/bsd_1_patterns
# generate verilog TAP testbench
write_test -format verilog -output /home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/BSD_1_tb.v
#write out jtag-inserted netlist
write -format ddc -hierarchy -output /home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/TOP_bsd_1.ddc
change_names -rules verilog -hier
write -format verilog -hierarchy -output /home/banturr /Desktop/VLSI_Test_Power/Lab4/reports/TOP_bsd_1.v












