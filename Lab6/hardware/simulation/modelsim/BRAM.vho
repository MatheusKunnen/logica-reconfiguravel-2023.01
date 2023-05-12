-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "04/26/2023 23:20:13"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	BRAM IS
    PORT (
	RST : IN std_logic;
	CLK : IN std_logic;
	READDATA : OUT std_logic_vector(7 DOWNTO 0);
	WRITEDATA : IN std_logic_vector(7 DOWNTO 0);
	WR_EN : IN std_logic;
	RD_EN : IN std_logic;
	CS : IN std_logic;
	ADD : IN std_logic_vector(9 DOWNTO 0)
	);
END BRAM;

-- Design Ports Information
-- RST	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- READDATA[0]	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- READDATA[1]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- READDATA[2]	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- READDATA[3]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- READDATA[4]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- READDATA[5]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- READDATA[6]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- READDATA[7]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD_EN	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CS	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WR_EN	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WRITEDATA[0]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADD[0]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADD[1]	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADD[2]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADD[3]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADD[4]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADD[5]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADD[6]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADD[7]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADD[8]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADD[9]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WRITEDATA[1]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WRITEDATA[2]	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WRITEDATA[3]	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WRITEDATA[4]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WRITEDATA[5]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WRITEDATA[6]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WRITEDATA[7]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF BRAM IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_RST : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_READDATA : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_WRITEDATA : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_WR_EN : std_logic;
SIGNAL ww_RD_EN : std_logic;
SIGNAL ww_CS : std_logic;
SIGNAL ww_ADD : std_logic_vector(9 DOWNTO 0);
SIGNAL \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \RST~input_o\ : std_logic;
SIGNAL \READDATA[0]~output_o\ : std_logic;
SIGNAL \READDATA[1]~output_o\ : std_logic;
SIGNAL \READDATA[2]~output_o\ : std_logic;
SIGNAL \READDATA[3]~output_o\ : std_logic;
SIGNAL \READDATA[4]~output_o\ : std_logic;
SIGNAL \READDATA[5]~output_o\ : std_logic;
SIGNAL \READDATA[6]~output_o\ : std_logic;
SIGNAL \READDATA[7]~output_o\ : std_logic;
SIGNAL \CS~input_o\ : std_logic;
SIGNAL \WR_EN~input_o\ : std_logic;
SIGNAL \wren_internal~combout\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \WRITEDATA[0]~input_o\ : std_logic;
SIGNAL \ADD[0]~input_o\ : std_logic;
SIGNAL \ADD[1]~input_o\ : std_logic;
SIGNAL \ADD[2]~input_o\ : std_logic;
SIGNAL \ADD[3]~input_o\ : std_logic;
SIGNAL \ADD[4]~input_o\ : std_logic;
SIGNAL \ADD[5]~input_o\ : std_logic;
SIGNAL \ADD[6]~input_o\ : std_logic;
SIGNAL \ADD[7]~input_o\ : std_logic;
SIGNAL \ADD[8]~input_o\ : std_logic;
SIGNAL \ADD[9]~input_o\ : std_logic;
SIGNAL \WRITEDATA[1]~input_o\ : std_logic;
SIGNAL \WRITEDATA[2]~input_o\ : std_logic;
SIGNAL \WRITEDATA[3]~input_o\ : std_logic;
SIGNAL \WRITEDATA[4]~input_o\ : std_logic;
SIGNAL \WRITEDATA[5]~input_o\ : std_logic;
SIGNAL \WRITEDATA[6]~input_o\ : std_logic;
SIGNAL \WRITEDATA[7]~input_o\ : std_logic;
SIGNAL \RD_EN~input_o\ : std_logic;
SIGNAL \READDATA~8_combout\ : std_logic;
SIGNAL \bram0|altsyncram_component|auto_generated|q_a\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_RST <= RST;
ww_CLK <= CLK;
READDATA <= ww_READDATA;
ww_WRITEDATA <= WRITEDATA;
ww_WR_EN <= WR_EN;
ww_RD_EN <= RD_EN;
ww_CS <= CS;
ww_ADD <= ADD;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\bram0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & \WRITEDATA[7]~input_o\ & \WRITEDATA[6]~input_o\ & \WRITEDATA[5]~input_o\ & \WRITEDATA[4]~input_o\ & \WRITEDATA[3]~input_o\ & \WRITEDATA[2]~input_o\ & \WRITEDATA[1]~input_o\
& \WRITEDATA[0]~input_o\);

\bram0|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\ADD[9]~input_o\ & \ADD[8]~input_o\ & \ADD[7]~input_o\ & \ADD[6]~input_o\ & \ADD[5]~input_o\ & \ADD[4]~input_o\ & \ADD[3]~input_o\ & \ADD[2]~input_o\ & \ADD[1]~input_o\ & 
\ADD[0]~input_o\);

\bram0|altsyncram_component|auto_generated|q_a\(0) <= \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\bram0|altsyncram_component|auto_generated|q_a\(1) <= \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\bram0|altsyncram_component|auto_generated|q_a\(2) <= \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\bram0|altsyncram_component|auto_generated|q_a\(3) <= \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\bram0|altsyncram_component|auto_generated|q_a\(4) <= \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\bram0|altsyncram_component|auto_generated|q_a\(5) <= \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\bram0|altsyncram_component|auto_generated|q_a\(6) <= \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\bram0|altsyncram_component|auto_generated|q_a\(7) <= \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);

-- Location: IOOBUF_X33_Y11_N2
\READDATA[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bram0|altsyncram_component|auto_generated|q_a\(0),
	oe => \READDATA~8_combout\,
	devoe => ww_devoe,
	o => \READDATA[0]~output_o\);

-- Location: IOOBUF_X26_Y0_N2
\READDATA[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bram0|altsyncram_component|auto_generated|q_a\(1),
	oe => \READDATA~8_combout\,
	devoe => ww_devoe,
	o => \READDATA[1]~output_o\);

-- Location: IOOBUF_X33_Y12_N2
\READDATA[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bram0|altsyncram_component|auto_generated|q_a\(2),
	oe => \READDATA~8_combout\,
	devoe => ww_devoe,
	o => \READDATA[2]~output_o\);

-- Location: IOOBUF_X33_Y24_N2
\READDATA[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bram0|altsyncram_component|auto_generated|q_a\(3),
	oe => \READDATA~8_combout\,
	devoe => ww_devoe,
	o => \READDATA[3]~output_o\);

-- Location: IOOBUF_X33_Y25_N2
\READDATA[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bram0|altsyncram_component|auto_generated|q_a\(4),
	oe => \READDATA~8_combout\,
	devoe => ww_devoe,
	o => \READDATA[4]~output_o\);

-- Location: IOOBUF_X24_Y31_N9
\READDATA[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bram0|altsyncram_component|auto_generated|q_a\(5),
	oe => \READDATA~8_combout\,
	devoe => ww_devoe,
	o => \READDATA[5]~output_o\);

-- Location: IOOBUF_X26_Y0_N9
\READDATA[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bram0|altsyncram_component|auto_generated|q_a\(6),
	oe => \READDATA~8_combout\,
	devoe => ww_devoe,
	o => \READDATA[6]~output_o\);

-- Location: IOOBUF_X26_Y31_N2
\READDATA[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bram0|altsyncram_component|auto_generated|q_a\(7),
	oe => \READDATA~8_combout\,
	devoe => ww_devoe,
	o => \READDATA[7]~output_o\);

-- Location: IOIBUF_X20_Y0_N1
\CS~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CS,
	o => \CS~input_o\);

-- Location: IOIBUF_X22_Y0_N1
\WR_EN~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WR_EN,
	o => \WR_EN~input_o\);

-- Location: LCCOMB_X21_Y1_N22
wren_internal : cycloneiv_lcell_comb
-- Equation(s):
-- \wren_internal~combout\ = (\CS~input_o\ & \WR_EN~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CS~input_o\,
	datad => \WR_EN~input_o\,
	combout => \wren_internal~combout\);

-- Location: IOIBUF_X16_Y0_N15
\CLK~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G17
\CLK~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X33_Y15_N8
\WRITEDATA[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WRITEDATA(0),
	o => \WRITEDATA[0]~input_o\);

-- Location: IOIBUF_X33_Y27_N8
\ADD[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADD(0),
	o => \ADD[0]~input_o\);

-- Location: IOIBUF_X31_Y0_N1
\ADD[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADD(1),
	o => \ADD[1]~input_o\);

-- Location: IOIBUF_X33_Y14_N1
\ADD[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADD(2),
	o => \ADD[2]~input_o\);

-- Location: IOIBUF_X29_Y31_N1
\ADD[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADD(3),
	o => \ADD[3]~input_o\);

-- Location: IOIBUF_X33_Y22_N1
\ADD[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADD(4),
	o => \ADD[4]~input_o\);

-- Location: IOIBUF_X33_Y14_N8
\ADD[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADD(5),
	o => \ADD[5]~input_o\);

-- Location: IOIBUF_X16_Y31_N1
\ADD[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADD(6),
	o => \ADD[6]~input_o\);

-- Location: IOIBUF_X16_Y31_N8
\ADD[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADD(7),
	o => \ADD[7]~input_o\);

-- Location: IOIBUF_X24_Y0_N8
\ADD[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADD(8),
	o => \ADD[8]~input_o\);

-- Location: IOIBUF_X33_Y16_N8
\ADD[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADD(9),
	o => \ADD[9]~input_o\);

-- Location: IOIBUF_X33_Y16_N1
\WRITEDATA[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WRITEDATA(1),
	o => \WRITEDATA[1]~input_o\);

-- Location: IOIBUF_X33_Y15_N1
\WRITEDATA[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WRITEDATA(2),
	o => \WRITEDATA[2]~input_o\);

-- Location: IOIBUF_X33_Y10_N8
\WRITEDATA[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WRITEDATA(3),
	o => \WRITEDATA[3]~input_o\);

-- Location: IOIBUF_X33_Y12_N8
\WRITEDATA[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WRITEDATA(4),
	o => \WRITEDATA[4]~input_o\);

-- Location: IOIBUF_X33_Y11_N8
\WRITEDATA[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WRITEDATA(5),
	o => \WRITEDATA[5]~input_o\);

-- Location: IOIBUF_X33_Y22_N8
\WRITEDATA[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WRITEDATA(6),
	o => \WRITEDATA[6]~input_o\);

-- Location: IOIBUF_X24_Y31_N1
\WRITEDATA[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WRITEDATA(7),
	o => \WRITEDATA[7]~input_o\);

-- Location: M9K_X28_Y16_N0
\bram0|altsyncram_component|auto_generated|ram_block1a0\ : cycloneiv_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "qbram:bram0|altsyncram:altsyncram_component|altsyncram_vkf1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 9,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_width => 10,
	port_b_data_width => 9,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \wren_internal~combout\,
	portare => VCC,
	clk0 => \CLK~inputclkctrl_outclk\,
	portadatain => \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bram0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: IOIBUF_X20_Y0_N8
\RD_EN~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RD_EN,
	o => \RD_EN~input_o\);

-- Location: LCCOMB_X21_Y1_N8
\READDATA~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \READDATA~8_combout\ = (\CS~input_o\ & \RD_EN~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CS~input_o\,
	datad => \RD_EN~input_o\,
	combout => \READDATA~8_combout\);

-- Location: IOIBUF_X8_Y0_N8
\RST~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RST,
	o => \RST~input_o\);

ww_READDATA(0) <= \READDATA[0]~output_o\;

ww_READDATA(1) <= \READDATA[1]~output_o\;

ww_READDATA(2) <= \READDATA[2]~output_o\;

ww_READDATA(3) <= \READDATA[3]~output_o\;

ww_READDATA(4) <= \READDATA[4]~output_o\;

ww_READDATA(5) <= \READDATA[5]~output_o\;

ww_READDATA(6) <= \READDATA[6]~output_o\;

ww_READDATA(7) <= \READDATA[7]~output_o\;
END structure;


