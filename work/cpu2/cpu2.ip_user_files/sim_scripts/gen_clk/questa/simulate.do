onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib gen_clk_opt

do {wave.do}

view wave
view structure
view signals

do {gen_clk.udo}

run -all

quit -force
