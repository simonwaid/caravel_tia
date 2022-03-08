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
C {/home/simon/code/asic/analog/esd/esd_clamp.sym} 1340 -1150 0 0 {name=x1}
C {devices/vsource.sym} 1570 -1160 0 0 {name=V1 value="DC 0 pulse 0 3 1u 10u 10u 1u"}
C {devices/code.sym} 1790 -1280 0 0 {name=SPICE
only_toplevel=true
value="
*.options savecurrents
.option warn=1
.control
set wr_vecnames
set wr_singlescale
set hcopydevtype=svg
set ITL1=10000

let min_temp=0
let var_temp = min_temp
let max_temp=100
let temp_step=100

option temp=0


tran 100n 30u
 
plot i(v1) 
plot v(vdd) v(x1.vgm1) v(x1.vgm5)


.endc 
"}
C {devices/code.sym} 1790 -1130 0 0 {name=INCLUDE
only_toplevel=true
format="tcleval( @value )"
value="

* .include ../../tia.spice
* .include ../../filter_diff.spice
* .include ../../cmm_sense3.spice

.include esd_clamp.spice

"}
C {devices/code.sym} 1790 -970 0 0 {name=MODELS
only_toplevel=true
format="tcleval( @value )"
value="
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice hl
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice.tt.red tt
* .lib /home/simon/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice.tt.red tt
"}
C {devices/vdd.sym} 1570 -1230 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 1570 -1130 0 0 {name=l2 lab=GND}
