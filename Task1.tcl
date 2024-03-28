#Step 1
#Set target library
set target_library /home/banturr/Desktop/VLSI_Test_Power/Lab4/db/saed90nm_typ_ht.db

#Set link library
set link_library /home/banturr/Desktop/VLSI_Test_Power/Lab4/db/saed90nm_typ_ht.db

#Set symbol library
set symbol_library /home/banturr/Desktop/VLSI_Test_Power/Lab4/db/saed90nm.sdb

# Removes any previous design from DC memory
#remove_design -all

#Analyze
analyze -library work -format vhdl {/home/banturr/Desktop/VLSI_Test_Power/Lab4/src/Gcd_Vhdl.vhd}

#Elaborate
elaborate gcd_bsd -architecture gcd_bsd_arc -library DEFAULT

#Linking the design
link

#Uniquify the design
uniquify -force


#Providing constraints
create_clock clk -period 40 -waveform {0 20}
set_clock_latency 0.3 clk
set_input_delay 2.0 -clock clk [all_inputs]
set_output_delay 1.65 -clock clk [all_outputs]
set_load 0.1 [all_outputs]
set_max_fanout 1 [all_inputs]
set_fanout_load 8 [all_outputs]
report_port
set_max_area 0

#Checking design and timing
check_design
check_timing

#Compile
compile -exact_map

# Critical path in the design
change_selection -name global -replace [get_timing_paths -delay_type max -nworst 1 -max_paths 1 -include_hierarchical_pins]

#Reports
report_area -hierarchy > /home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/GCD.area 
report_timing > /home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/GCD.timing
report_power > /home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/GCD.power
report_cell > /home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/GCD.cell

#Gate Level Netlist .v File
write -hierarchy -format vhdl -output write -hierarchy -format vhdl -output /home/banturr/Desktop/VLSI_Test_Power/Lab4/src/GCD_gtl.vhd

#Step 2
set dft_runname scan
set scan_library [list /home/banturr/Desktop/VLSI_Test_Power/Lab4/db/saed90nm_typ_ht.db]
set scancell DFFPOSX1_SCAN
set test_default_delay 0
set test_default_bidir_delay 0
set test_default_strobe 40
set test_default_period 100
set test_default_scan_style multiplexed_flip_flop




#Step 3
# Update filebase
set basename {GCD_bsd}
set filebase [format "%s%s" [format "%s%s" $basename "_"] $dft_runname]
# Set the scan cells to use in the design
set_scan_register_type -type {DFFPOSX1_SCAN} ;
#set_scan_register_type -type ${scancell}
# Make sure to add a test_out port
set_scan_configuration -create_dedicated_scan_out_ports true
# Infer clock and reset lines
create_test_protocol -infer_async -infer_clock
dft_drc -verbose >> "/home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/dft_drc_report.txt"
# Replace flip flops with multiplexed flipflops
compile -scan
# Check for constraint violations
report_constraint -all_violators >> "/home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/constraint_report.txt"


#Step 4
# connects all scan-enabled ff's together into scan-chain
# note, it creates two new ports: test_si & test_se
insert_dft
# set drive strength of the test ports to 2 (so it isn't assumed to be infinite)
set_drive 2 test_si
set_drive 2 test_se
# since you've already inserted scan-ff's, we don't want that to happen again,
# when we run insert_dft
set_scan_configuration -replace false
# run insert_scan again to set drive-strength constraints
insert_dft
# report any constraints that may have been violated by inserting the test
# structures
report_constraint -all_violators >> "/home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/post_dft_insert_constr_report.txt"
dft_drc -verbose -coverage_estimate >> "/home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/post_dft_insert_drc_report.txt"
report_scan_path -view existing -chain all >> "/home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/report_scan_path_results.txt"
report_cell


#Step 5
# report dft_drc
set filename [format "%s%s%s" /home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/ $filebase ".violators"]
redirect $filename { report_constraint -all_violators }
# report dft_drc
set filename [format "%s%s%s" /home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/ $filebase ".dft_drc"]
redirect $filename { dft_drc -verbose -coverage_estimate }
# report scan path
set filename [format "%s%s%s" /home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/ $filebase ".scan_path"]
redirect $filename { report_scan_path -view existing -chain all }
# report cells
set filename [format "%s%s%s" /home/banturr/Desktop/VLSI_Test_Power/Lab4/reports/ $filebase ".cell"]
redirect $filename { report_cell }
# Write out protocol
set filename [format "%s%s%s" /home/banturr/Desktop/VLSI_Test_Power/Lab4/src/ $filebase ".spf"]
write_test_protocol -output $filename
# Write out scan chain design
set filename [format "%s%s%s" /home/banturr/Desktop/VLSI_Test_Power/Lab4/src/ $filebase ".v"]
redirect change_names { change_names -rules verilog -hierarchy -verbose }
write -format verilog -hierarchy -output $filename

#man test_default_scan_style
