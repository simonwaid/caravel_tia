v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -230 -200 30 -200 { lab=Vtia_outP_2}
N -1720 -150 -1720 -130 { lab=GND}
N -1720 -400 -1720 -210 { lab=#net1}
N -1030 -250 -1030 -240 { lab=VDD}
N -1030 -240 -1030 -220 { lab=VDD}
N -1600 -400 -1600 -340 { lab=#net1}
N -1720 -400 -1600 -400 { lab=#net1}
N -1600 -400 -1570 -400 { lab=#net1}
N -1480 -280 -1480 -260 { lab=GND}
N -1600 -280 -1600 -260 { lab=GND}
N -1510 -400 -1450 -400 { lab=Vinb}
N -1480 -400 -1480 -340 { lab=Vinb}
N -1410 -310 -1410 -280 { lab=GND}
N -1410 -280 -1370 -280 { lab=GND}
N -1370 -280 -1370 -260 { lab=GND}
N -1370 -310 -1370 -280 { lab=GND}
N -1450 -400 -1370 -400 { lab=Vinb}
N -1370 -400 -1370 -340 { lab=Vinb}
N -1260 -400 -910 -400 { lab=Vinb}
N -1370 -400 -1260 -400 { lab=Vinb}
N -230 -180 30 -180 { lab=Vtia_outP_1}
N 30 -120 30 -30 { lab=GND}
N 30 -30 90 -30 { lab=GND}
N 90 -120 90 -30 { lab=GND}
N 60 -120 60 -30 { lab=GND}
N 30 -180 60 -180 { lab=Vtia_outP_1}
N 60 -180 60 -160 { lab=Vtia_outP_1}
N -1370 -450 -1370 -400 { lab=Vinb}
N -1240 -400 -1240 -350 { lab=Vinb}
N -1240 -290 -1240 -270 { lab=GND}
N 30 -200 110 -200 { lab=Vtia_outP_2}
N -910 -400 -740 -400 { lab=Vinb}
N -740 -400 -740 -200 { lab=Vinb}
N -740 -200 -650 -200 { lab=Vinb}
N -800 -220 -650 -220 { lab=GND}
N -810 -560 -640 -560 { lab=Vbias2}
N -630 -540 -580 -540 { lab=GND}
N -640 -560 -580 -560 { lab=Vbias2}
N -350 -180 -320 -180 { lab=#net2}
N -320 -420 -320 -180 { lab=#net2}
N -630 -420 -320 -420 { lab=#net2}
N -630 -520 -630 -420 { lab=#net2}
N -630 -520 -580 -520 { lab=#net2}
N -610 -500 -580 -500 { lab=Vtia_outP_1}
N -610 -500 -610 -370 { lab=Vtia_outP_1}
N -610 -370 -300 -370 { lab=Vtia_outP_1}
N -300 -370 -300 -160 { lab=Vtia_outP_1}
N -350 -160 -300 -160 { lab=Vtia_outP_1}
N -350 -140 -350 -90 { lab=GND}
N -350 -270 -350 -220 { lab=VDD}
N -910 -180 -650 -180 { lab=Vbias1}
N -910 -180 -910 -160 { lab=Vbias1}
N -1030 -160 -910 -160 { lab=Vbias1}
N -350 -200 -230 -200 { lab=Vtia_outP_2}
N -300 -180 -230 -180 { lab=Vtia_outP_1}
N -280 -540 -250 -540 { lab=Vinb}
N -250 -540 -250 -340 { lab=Vinb}
N -280 -560 -230 -560 { lab=VDD}
N -230 -590 -230 -560 { lab=VDD}
N -280 -520 -230 -520 { lab=GND}
N -230 -520 -230 -510 { lab=GND}
N -700 -480 -580 -480 { lab=GND}
N -700 -480 -700 -470 { lab=GND}
N -810 -560 -810 -550 { lab=Vbias2}
N -810 -490 -810 -470 { lab=GND}
N -740 -340 -250 -340 { lab=Vinb}
N -720 -540 -630 -540 { lab=GND}
N -720 -540 -720 -520 { lab=GND}
N -650 -600 -650 -540 { lab=GND}
C {devices/code.sym} 570 -440 0 0 {name=SPICE
only_toplevel=true
value="
*.options savecurrents
.option warn=1
* .option temp=100
.control
set wr_vecnames
set wr_singlescale
set hcopydevtype=svg
** TIA


op
write test_tia_rgc_full.raw
run
reset
* option temp=20
* noise v(Vtia_outP-Vtia_outN) iin dec 100 1 100G
* print all
* setplot noise2
* write noise_tia2.raw
* wrdata result_noise_tia2.csv
* run
* reset

ac dec 1000 10 1T
plot vdb(Vtia_outP_1) vdb(Vtia_outP_2)
plot v(Vinb)
plot phase(Vinb)/pi*180 phase(Vtia_outP_1)/pi*180
hardcopy bandwidth.svg vdb(Vtia_outP_1)
hardcopy impedance.svg v(Vinb)


* tran 1p 100n
* plot v(Vtia_outP_1) v(Vtia_outP_2)
* plot v(Vinb)
meas ac gain FIND vdb(vtia_outp_1) AT=10MEG
meas ac max_gain max vdb(vtia_outp_1) from=1MEG to=100G
meas ac min_gain min vdb(vtia_outp_1) from=1MEG to=100MEG
let bw_gain=gain-3
meas ac bandwidth when vdb(vtia_outp_1)=bw_gain fall = LAST
wrdata result_freq.csv gain max_gain min_gain bandwidth
run
reset
noise v(vtia_outp_1) i1 dec 1000 10 2G
print all
* wrdata result_noise.csv inoise_total onoise_total
setplot noise1
plot inoise_spectrum
plot onoise_spectrum
hardcopy tia_rgc_inoise_spectrum.svg inoise_spectrum
hardcopy tia_rgc_onoise_spectrum.svg onoise_spectrum
* plot log(inoise_spectrum)
* write noise_tia2.raw
run
* 
reset
noise v(vtia_outp_1) i1 dec 1000 2MEG 2G
print all
* wrdata result_noise.csv inoise_total onoise_total
setplot noise3
plot inoise_spectrum
plot onoise_spectrum
hardcopy tia_rgc_inoise_spectrum_zoom.svg inoise_spectrum
hardcopy tia_rgc_onoise_spectrum_zoom.svg onoise_spectrum
* plot log(inoise_spectrum)
* write noise_tia2.raw
run
* 


.endc 
"}
C {devices/lab_wire.sym} -1240 -400 0 1 {name=l5 sig_type=std_logic lab=Vinb}
C {devices/code.sym} 570 -270 0 0 {name=INCLUDE
only_toplevel=true
format="tcleval( @value )"
value="

* .include ../../tia.spice
* .include ../../filter_diff.spice
* .include ../../cmm_sense3.spice

.include tia_rgc_core.spice
.include tia_rgc_feedback.spice

"}
C {devices/code.sym} 570 -100 0 0 {name=MODELS
only_toplevel=true
format="tcleval( @value )"
value="
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice #model#
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice sf
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice.tt.red tt
* .lib /home/simon/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice.tt.red tt
"}
C {devices/vdd.sym} -890 -630 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} -890 -600 0 0 {name=V2 value=1.8
*#UB#}
C {devices/gnd.sym} -890 -570 0 0 {name=l8 lab=GND}
C {devices/lab_wire.sym} -200 -180 0 1 {name=l10 sig_type=std_logic lab=Vtia_outP_1}
C {devices/ngspice_get_value.sym} -90 -150 0 0 {name=r4 node="v(Vtia_outP_1)"
descr="v(Vtia_outP_1)"}
C {devices/isource.sym} -1720 -180 0 0 {name=I1 value="DC 0 AC 1"
* "pulse 0 50E-9 10n 0.1n 0.1n 5n 10n"
* 
*
*}
C {devices/gnd.sym} -1720 -130 0 0 {name=l16 lab=GND}
C {devices/isource.sym} -1030 -190 0 0 {name=I2 value=80u}
C {devices/ngspice_get_value.sym} -1310 -400 0 0 {name=r2 node="v(Vinb)"
descr="v(Vinb)"}
C {devices/vdd.sym} -1030 -250 0 0 {name=l4 lab=VDD}
C {devices/capa.sym} -1480 -310 0 0 {name=C1
m=1
value=200f
footprint=1206
device="ceramic capacitor"}
C {devices/ind.sym} -1540 -400 1 0 {name=L1
m=1
value=1n
footprint=1206
device=inductor}
C {devices/capa.sym} -1600 -310 0 0 {name=C2
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} -1480 -260 0 0 {name=l9 lab=GND}
C {devices/gnd.sym} -1600 -260 0 0 {name=l13 lab=GND}
C {devices/ngspice_get_value.sym} -880 -260 0 0 {name=r3 node="v(Vbias1)"
descr="v(Vbias1)"}
C {sky130_fd_pr/nfet_01v8_esd.sym} -1390 -310 0 0 {name=M1
L=0.165
W=20.35
nf=1
mult=5
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=esd_nfet_01v8
spiceprefix=X
}
C {devices/gnd.sym} -1370 -260 0 0 {name=l15 lab=GND}
C {devices/lab_wire.sym} -910 -180 0 1 {name=l3 sig_type=std_logic lab=Vbias1}
C {devices/ngspice_get_value.sym} -730 -570 0 0 {name=r5 node="v(Vbias2)"
descr="v(Vbias2)"}
C {devices/lab_wire.sym} -200 -200 0 1 {name=l14 sig_type=std_logic lab=Vtia_outP_2}
C {devices/ngspice_get_value.sym} -100 -200 0 0 {name=r6 node="v(Vtia_outP_2)"
descr="v(Vtia_outP_2)"}
C {devices/isource.sym} -810 -520 0 0 {name=I3 value=8u}
C {devices/lab_wire.sym} -810 -560 0 1 {name=l18 sig_type=std_logic lab=Vbias2}
C {devices/gnd.sym} -810 -470 0 0 {name=l2 lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 60 -140 1 0 {name=M2
L=0.2
W=1.5
nf=1 
mult=30
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/gnd.sym} 60 -30 0 0 {name=l12 lab=GND}
C {devices/gnd.sym} -1240 -270 0 0 {name=l22 lab=GND}
C {devices/vdd.sym} -1370 -510 0 0 {name=l21 lab=VDD}
C {/home/simon/code/asic/analog/tia/tia_rgc_core.sym} -500 -180 0 0 {name=x1}
C {/home/simon/code/asic/analog/tia/tia_rgc_feedback.sym} -430 -520 0 0 {name=x2}
C {devices/gnd.sym} -800 -220 0 0 {name=l19 lab=GND}
C {devices/gnd.sym} -350 -90 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -350 -270 0 0 {name=l17 lab=VDD}
C {devices/vdd.sym} -230 -590 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -230 -510 0 0 {name=l11 lab=GND}
C {devices/noconn.sym} 110 -200 2 0 {name=l24}
C {devices/isource.sym} -1240 -320 0 0 {name=I4 value=20u}
C {devices/gnd.sym} -720 -520 0 0 {name=l25 lab=GND}
C {devices/gnd.sym} -700 -470 0 0 {name=l20 lab=GND}
