#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Tue Nov 17 11:26:16 JST 2020
# SW Build 2902540 on Wed May 27 19:54:35 MDT 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto 26dd921ec1604845a7275c6a811fa575 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot cpu_tb_behav xil_defaultlib.cpu_tb xil_defaultlib.glbl -log elaborate.log"
xelab -wto 26dd921ec1604845a7275c6a811fa575 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot cpu_tb_behav xil_defaultlib.cpu_tb xil_defaultlib.glbl -log elaborate.log

