-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Tue Nov 17 02:39:05 2020
-- Host        : DJ00308 running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/denjo/risc/work/cpu_single/cpu_single.srcs/sources_1/bd/design_1/ip/design_1_cpu_0_1/design_1_cpu_0_1_stub.vhdl
-- Design      : design_1_cpu_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_cpu_0_1 is
  Port ( 
    sysclk : in STD_LOGIC;
    cpu_resetn : in STD_LOGIC;
    uart_tx : out STD_LOGIC
  );

end design_1_cpu_0_1;

architecture stub of design_1_cpu_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "sysclk,cpu_resetn,uart_tx";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "cpu,Vivado 2020.1";
begin
end;
