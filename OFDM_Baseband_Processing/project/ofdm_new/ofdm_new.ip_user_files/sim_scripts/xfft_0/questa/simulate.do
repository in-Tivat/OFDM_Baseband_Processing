onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib xfft_0_opt

do {wave.do}

view wave
view structure
view signals

do {xfft_0.udo}

run -all

quit -force
