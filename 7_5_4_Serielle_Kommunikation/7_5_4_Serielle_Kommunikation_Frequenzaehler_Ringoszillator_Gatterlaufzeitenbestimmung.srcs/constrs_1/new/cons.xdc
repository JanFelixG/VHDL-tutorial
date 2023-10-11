set_property PACKAGE_PIN W5 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK]

set_property -dict { PACKAGE_PIN t18   IOSTANDARD LVCMOS33 } [get_ports {BTN[0]}];
set_property -dict { PACKAGE_PIN w19   IOSTANDARD LVCMOS33 } [get_ports {BTN[1]}];
set_property -dict { PACKAGE_PIN t17   IOSTANDARD LVCMOS33 } [get_ports {BTN[2]}];
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports {BTN[3]}];
                                                                                    
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports {BTN[4]}];

##USB-RS232 Interface
##Bank = 16, Pin name = ,					Sch name = UART_TXD_IN
#set_property PACKAGE_PIN B18 [get_ports RsRx]
#set_property IOSTANDARD LVCMOS33 [get_ports RsRx]
#Bank = 16, Pin name = ,					Sch name = UART_RXD_OUT
set_property PACKAGE_PIN A18 [get_ports UART_TXD]
set_property IOSTANDARD LVCMOS33 [get_ports UART_TXD]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

set_property DONT_TOUCH true [get_cells Inst_Frequenzmessung/ringosz/GEN_INV[0].inve1.inv1/aus_i]
set_property DONT_TOUCH true [get_cells Inst_Frequenzmessung/ringosz/GEN_INV[1].inve1.inv1/aus_i]
set_property DONT_TOUCH true [get_cells Inst_Frequenzmessung/ringosz/GEN_INV[2].inve1.inv1/aus_i]
set_property DONT_TOUCH true [get_cells Inst_Frequenzmessung/ringosz/GEN_INV[3].inve1.inv1/aus_i]
set_property DONT_TOUCH true [get_cells Inst_Frequenzmessung/ringosz/GEN_INV[4].inve1.inv1/aus_i]

set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[0].inve1.inv1/aus]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[1].inve1.inv1/aus]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[2].inve1.inv1/aus]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[3].inve1.inv1/aus]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[4].inve1.inv1/aus]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[5].inve1.inv1/aus]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[6].inve1.inv1/aus]

set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[0].inve1.inv1/ein]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[1].inve1.inv1/ein]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[2].inve1.inv1/ein]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[3].inve1.inv1/ein]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[4].inve1.inv1/ein]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[5].inve1.inv1/aus]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/GEN_INV[6].inve1.inv1/aus]

set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/uhr_ring]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/b_1]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/b_2]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/b_3]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/b_4]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/b_5]
set_property DONT_TOUCH true [get_nets Inst_Frequenzmessung/ringosz/b_6]

set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells Inst_Frequenzmessung/ringosz/GEN_INV[4].inve1.inv1/aus]]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells Inst_Frequenzmessung/ringosz/GEN_INV[1].inve1.inv1/aus_inferred__0_i_1]]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells Inst_Frequenzmessung/ringosz/GEN_INV[2].inve1.inv1/aus_inferred__0_i_1__0]]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells Inst_Frequenzmessung/ringosz/GEN_INV[3].inve1.inv1/aus_inferred__0_i_1__1]]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells Inst_Frequenzmessung/ringosz/GEN_INV[3].inve1.inv1/aus_inferred__0_i_1__2]]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells Inst_Frequenzmessung/ringosz/GEN_INV[3].inve1.inv1/aus_inferred__0_i_1__3]]

##set_property SEVERITY {Warning}  [get_drc_checks LUTLP-1]

##set_property SEVERITY {Warning} [get_drc_checks NSTD-1]