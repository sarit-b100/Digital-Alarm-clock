# Clock signal
set_property PACKAGE_PIN W5 [get_ports masCLK]
	set_property IOSTANDARD LVCMOS33 [get_ports masCLK]

#Buttons
set_property PACKAGE_PIN W19 [get_ports Minus_in]
	set_property IOSTANDARD LVCMOS33 [get_ports Minus_in]
set_property PACKAGE_PIN T17 [get_ports Plus_in]
	set_property IOSTANDARD LVCMOS33 [get_ports Plus_in]

# Switches
set_property PACKAGE_PIN V17 [get_ports {Reset}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Reset}]
set_property PACKAGE_PIN R3 [get_ports {Alarm_ON}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Alarm_ON}]
set_property PACKAGE_PIN W2 [get_ports {M}]
	set_property IOSTANDARD LVCMOS33 [get_ports {M}]
set_property PACKAGE_PIN U1 [get_ports {H}]
	set_property IOSTANDARD LVCMOS33 [get_ports {H}]
set_property PACKAGE_PIN T1 [get_ports {Alarm}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Alarm}]
set_property PACKAGE_PIN R2 [get_ports {Time}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Time}]

#7 segment display
set_property PACKAGE_PIN W7 [get_ports {a}]
	set_property IOSTANDARD LVCMOS33 [get_ports {a}]
set_property PACKAGE_PIN W6 [get_ports {b}]
	set_property IOSTANDARD LVCMOS33 [get_ports {b}]
set_property PACKAGE_PIN U8 [get_ports {c}]
	set_property IOSTANDARD LVCMOS33 [get_ports {c}]
set_property PACKAGE_PIN V8 [get_ports {d}]
	set_property IOSTANDARD LVCMOS33 [get_ports {d}]
set_property PACKAGE_PIN U5 [get_ports {e}]
	set_property IOSTANDARD LVCMOS33 [get_ports {e}]
set_property PACKAGE_PIN V5 [get_ports {f}]
	set_property IOSTANDARD LVCMOS33 [get_ports {f}]
set_property PACKAGE_PIN U7 [get_ports {g}]
	set_property IOSTANDARD LVCMOS33 [get_ports {g}]


set_property PACKAGE_PIN U2 [get_ports {AN0}]
	set_property IOSTANDARD LVCMOS33 [get_ports {AN0}]
set_property PACKAGE_PIN U4 [get_ports {AN1}]
	set_property IOSTANDARD LVCMOS33 [get_ports {AN1}]
set_property PACKAGE_PIN V4 [get_ports {AN2}]
	set_property IOSTANDARD LVCMOS33 [get_ports {AN2}]
set_property PACKAGE_PIN W4 [get_ports {AN3}]
	set_property IOSTANDARD LVCMOS33 [get_ports {AN3}]

# LEDs
set_property PACKAGE_PIN U16 [get_ports {Ring}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Ring}]
set_property PACKAGE_PIN N3 [get_ports {clock_1s}]
	set_property IOSTANDARD LVCMOS33 [get_ports {clock_1s}]