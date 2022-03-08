v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1490 -1230 1490 -1160 { lab=VDD}
N 1490 -1230 1570 -1230 { lab=VDD}
N 1570 -1230 1570 -1190 { lab=VDD}
N 1490 -1130 1570 -1130 { lab=GND}
N 1490 -1140 1490 -1130 { lab=GND}
C {/home/simon/code/asic/analog/esd/esd_clamp.sym} 1340 -1150 0 0 {name=xesd}
C {devices/vsource.sym} 1570 -1160 0 0 {name=V1 value="DC #UB# pulse 0 3 100n 1u 1u 100n"}
C {devices/code.sym} 1790 -1280 0 0 {name=SPICE
only_toplevel=true
value="
.options savecurrents
.option warn=1
.control
set wr_vecnames
set wr_singlescale
set hcopydevtype=svg
set ITL1=10000

set model=\\"#model#\\"
let mc_runs=100
let mc_runNo = 1

dowhile mc_runNo <= mc_runs
   destroy all
	let min_temp=0
	let var_temp = min_temp
	let max_temp=100
	let temp_step=10
	dowhile var_temp <= max_temp
		option temp=$&var_temp
		tran 5n 5u
		wrdata 'result_tran_tran_\{$&var_temp\}deg_\{$&mc_runNo\}.csv' i(v1) v(vdd) v(xesd.VGM1)
		run
		reset
		op
		wrdata 'result_op_op_\{$&var_temp\}deg_\{$&mc_runNo\}.csv' i(v1) v(vdd) v(xesd.VGM1)
		run
		reset
		let var_temp = var_temp + temp_step
	end
	let  mc_runNo = mc_runNo +1 
	reset
end

.endc 
"}
C {devices/code.sym} 1790 -1130 0 0 {name=INCLUDE
only_toplevel=true
format="tcleval( @value )"
value="

* .include ../../tia.spice
* .include ../../filter_diff.spice
* .include ../../cmm_sense3.spice

* .include esd_clamp.spice
.include ../../../esd_clamp.spice

"}
C {devices/code.sym} 1790 -970 0 0 {name=MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice #model#
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice.tt.red tt
* .lib /home/simon/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice.tt.red tt
"}
C {devices/vdd.sym} 1570 -1230 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 1570 -1130 0 0 {name=l2 lab=GND}
