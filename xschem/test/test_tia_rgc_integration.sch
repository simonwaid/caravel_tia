v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 110 -120 130 -120 { lab=GND}
N 130 -120 130 -90 { lab=GND}
N 110 -160 150 -160 { lab=VDD}
N 150 -180 150 -160 { lab=VDD}
N 110 -140 260 -140 { lab=#net1}
N 10 40 10 60 { lab=GND}
N 10 -40 10 -20 { lab=VDD}
N 560 -120 640 -120 { lab=#net2}
N 560 -140 610 -140 { lab=VDD}
N 590 0 590 20 { lab=GND}
N 560 20 590 20 { lab=GND}
N 560 -0 590 0 { lab=GND}
N 560 -100 590 -100 { lab=GND}
N 590 -100 590 -0 { lab=GND}
N 560 -20 590 -20 { lab=GND}
N 560 -40 590 -40 { lab=GND}
N 560 -60 590 -60 { lab=GND}
N 560 -80 590 -80 { lab=GND}
N 940 -40 970 -40 { lab=GND}
N 970 -40 970 -30 { lab=GND}
N 940 -120 970 -120 { lab=VDD}
N 970 -140 970 -120 { lab=VDD}
N 940 -100 1040 -100 { lab=#net3}
N 1210 -120 1250 -120 { lab=GND}
N 1210 -130 1210 -120 { lab=GND}
N 1550 -120 1590 -120 { lab=VDD}
N 1550 -40 1590 -40 { lab=GND}
N 1590 -40 1590 -30 { lab=GND}
N -130 -350 -130 -330 { lab=GND}
N -130 -480 -130 -410 { lab=#net4}
N -10 -480 -10 -420 { lab=#net4}
N -130 -480 -10 -480 { lab=#net4}
N -10 -480 20 -480 { lab=#net4}
N 110 -360 110 -340 { lab=GND}
N -10 -360 -10 -340 { lab=GND}
N 80 -480 140 -480 { lab=Vinb}
N 110 -480 110 -420 { lab=Vinb}
N 140 -480 920 -480 { lab=Vinb}
N 1160 -100 1250 -100 { lab=Vinb}
N 1160 -480 1160 -100 { lab=Vinb}
N 1030 -480 1160 -480 { lab=Vinb}
N 1550 -80 1710 -80 { lab=Vtia_out_ref}
N 1550 -100 1710 -100 { lab=Vtia_outP_2}
N 1710 -80 1740 -80 { lab=Vtia_out_ref}
N 560 40 560 60 { lab=GND}
N 940 -60 1030 -60 { lab=GND}
N 940 -80 1010 -80 { lab=#net5}
N 1010 -80 1010 20 { lab=#net5}
N 1040 -80 1250 -80 { lab=#net3}
N 1040 -100 1040 -80 { lab=#net3}
N 1030 -60 1070 -60 { lab=GND}
N 1070 -60 1070 -50 { lab=GND}
N 1010 20 1720 20 { lab=#net5}
N 1720 0 1800 0 { lab=#net5}
N 1720 0 1720 20 { lab=#net5}
N 1770 20 1800 20 { lab=Vtia_outP_1}
N 1770 -50 1770 20 { lab=Vtia_outP_1}
N 1770 -60 1770 -50 { lab=Vtia_outP_1}
N 1550 -60 1770 -60 { lab=Vtia_outP_1}
N 1750 40 1800 40 { lab=Vtia_out_ref}
N 1750 -80 1750 40 { lab=Vtia_out_ref}
N 1740 -80 1750 -80 { lab=Vtia_out_ref}
N 2100 0 2140 0 { lab=VDD}
N 2100 60 2140 60 { lab=GND}
N 2140 60 2140 70 { lab=GND}
N 2440 100 2440 120 { lab=GND}
N 2100 40 2440 40 { lab=V_outP}
N 2520 100 2520 120 { lab=GND}
N 2520 20 2520 40 { lab=V_outN}
N 2100 20 2520 20 { lab=V_outN}
N 920 -480 1030 -480 { lab=Vinb}
N 960 -580 1000 -580 { lab=GND}
N 1000 -580 1000 -550 { lab=GND}
N 960 -620 1000 -620 { lab=VDD}
N 1000 -660 1000 -620 { lab=VDD}
N 960 -600 1060 -600 { lab=Vinb}
N 1060 -600 1060 -480 { lab=Vinb}
N 2190 -140 2230 -140 { lab=GND}
N 2230 -140 2230 -110 { lab=GND}
N 2190 -180 2230 -180 { lab=VDD}
N 2230 -220 2230 -180 { lab=VDD}
N 2190 -160 2290 -160 { lab=V_outN}
N 2290 -160 2290 20 { lab=V_outN}
N 2210 200 2250 200 { lab=GND}
N 2250 200 2250 230 { lab=GND}
N 2210 160 2250 160 { lab=VDD}
N 2250 120 2250 160 { lab=VDD}
N 2210 180 2310 180 { lab=V_outP}
N 2310 40 2310 180 { lab=V_outP}
C {/home/simon/code/asic/analog/bias/current_mirrorx8.sym} 410 -50 0 0 {name=xcurm}
C {/home/simon/code/asic/analog/bias/low_pvt_source.sym} -40 -140 0 0 {name=xisource}
C {/home/simon/code/asic/analog/bias/current_mirror_channel.sym} 790 -80 0 0 {name=x1}
C {devices/vsource.sym} 10 10 0 0 {name=V1 value=1.8}
C {devices/gnd.sym} 130 -90 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 10 -40 0 0 {name=l2 lab=VDD}
C {devices/gnd.sym} 10 60 0 0 {name=l3 lab=GND}
C {devices/vdd.sym} 150 -180 0 0 {name=l4 lab=VDD}
C {devices/vdd.sym} 610 -140 0 0 {name=l5 lab=VDD}
C {devices/gnd.sym} 590 20 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} 970 -140 0 0 {name=l7 lab=VDD}
C {devices/gnd.sym} 970 -30 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 1210 -130 2 0 {name=l9 lab=GND}
C {devices/vdd.sym} 1590 -120 0 0 {name=l12 lab=VDD}
C {devices/gnd.sym} 1590 -30 0 0 {name=l13 lab=GND}
C {devices/lab_wire.sym} 1160 -380 0 1 {name=l14 sig_type=std_logic lab=Vinb}
C {devices/isource.sym} -130 -380 0 0 {name=I1 value="DC 0 AC 1"
* "pulse 0 50E-9 10n 0.1n 0.1n 5n 10n"
* 
*
*}
C {devices/gnd.sym} -130 -330 0 0 {name=l16 lab=GND}
C {devices/ngspice_get_value.sym} 1160 -410 0 0 {name=r2 node="v(Vinb)"
descr="v(Vinb)"}
C {devices/capa.sym} 110 -390 0 0 {name=C1
m=1
value=200f
footprint=1206
device="ceramic capacitor"}
C {devices/ind.sym} 50 -480 1 0 {name=L1
m=1
value=1n
footprint=1206
device=inductor}
C {devices/capa.sym} -10 -390 0 0 {name=C2
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 110 -340 0 0 {name=l15 lab=GND}
C {devices/gnd.sym} -10 -340 0 0 {name=l17 lab=GND}
C {devices/gnd.sym} 1140 -520 0 0 {name=l22 lab=GND}
C {devices/isource.sym} 1140 -550 0 0 {name=I4 value=5u}
C {devices/vdd.sym} 1140 -580 0 0 {name=l19 lab=VDD}
C {devices/code.sym} 2870 -360 0 0 {name=SPICE
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
write test_tia_rgc_integration.raw
run
reset

ac dec 1000 10 1T
plot vdb(Vtia_outP_1) vdb(Vtia_outP_2)
plot v(Vinb)
plot phase(Vinb)/pi*180 phase(Vtia_outP_1)/pi*180

plot db(v(V_outP)-v(V_outN))

* tran 1p 100n
* plot v(Vtia_outP_1) v(Vtia_outP_2)
* plot v(Vinb)

meas ac gain FIND vdb(vtia_outp_1) AT=10MEG
meas ac max_gain max vdb(vtia_outp_1) from=1MEG to=100G
meas ac min_gain min vdb(vtia_outp_1) from=1MEG to=100MEG
let bw_gain=gain-3
meas ac bandwidth when vdb(vtia_outp_1)=bw_gain fall = LAST
wrdata result_ac_tia.csv gain max_gain min_gain bandwidth


noise v(vtia_outp_1) i1 dec 1000 10 2G
print all
* wrdata result_noise.csv inoise_total onoise_total
setplot noise1
plot inoise_spectrum
plot onoise_spectrum
* hardcopy tia_rgc_inoise_spectrum.svg inoise_spectrum
* hardcopy tia_rgc_onoise_spectrum.svg onoise_spectrum
* plot log(inoise_spectrum)
* write noise_tia2.raw

noise v(vtia_outp_1) i1 dec 1000 2MEG 2G
print all
* wrdata result_noise.csv inoise_total onoise_total
setplot noise3
plot inoise_spectrum
plot onoise_spectrum
* hardcopy tia_rgc_inoise_spectrum_zoom.svg inoise_spectrum
* hardcopy tia_rgc_onoise_spectrum_zoom.svg onoise_spectrum
* plot log(inoise_spectrum)
* write noise_tia2.raw

noise v(v_outp) i1 dec 1000 2MEG 2G
print all
setplot noise5
plot inoise_spectrum
plot onoise_spectrum

noise v(v_outp) i1 dec 1000 10 2G
print all
setplot noise7
plot inoise_spectrum
plot onoise_spectrum


.endc 
"}
C {devices/code.sym} 2870 -190 0 0 {name=INCLUDE
only_toplevel=true
format="tcleval( @value )"
value="

* .include ../../tia.spice
* .include ../../filter_diff.spice
* .include ../../cmm_sense3.spice

.include tia_rgc_core.spice
.include current_mirror_channel.spice
.include current_mirrorx8.spice
.include low_pvt_source.spice
.include outdriver.spice
.include esd_diodes.spice

"}
C {devices/code.sym} 2870 -20 0 0 {name=MODELS
only_toplevel=true
format="tcleval( @value )"
value="
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice #model#
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice sf
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice.ll.red ll
* .lib /home/simon/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice.tt.red tt
"}
C {devices/lab_wire.sym} 1600 -100 0 1 {name=l23 sig_type=std_logic lab=Vtia_outP_2}
C {devices/lab_wire.sym} 1600 -60 0 1 {name=l24 sig_type=std_logic lab=Vtia_outP_1}
C {devices/noconn.sym} 1710 -100 2 0 {name=l26}
C {devices/ngspice_get_value.sym} 1670 -240 0 0 {name=r6 node="v(Vtia_outP_2)"
descr="v(Vtia_outP_2)"}
C {devices/ngspice_get_value.sym} 1670 -210 0 0 {name=r4 node="v(Vtia_outP_1)"
descr="v(Vtia_outP_1)"}
C {devices/gnd.sym} 560 60 0 0 {name=l27 lab=GND}
C {/home/simon/code/asic/analog/outdriver/outdriver.sym} 1950 30 0 0 {name=xoutd}
C {/home/simon/code/asic/analog/tia/tia_rgc_core.sym} 1400 -80 0 0 {name=x3}
C {devices/gnd.sym} 1070 -50 0 0 {name=l10 lab=GND}
C {devices/vdd.sym} 2140 0 0 0 {name=l11 lab=VDD}
C {devices/gnd.sym} 2140 70 0 0 {name=l25 lab=GND}
C {devices/capa.sym} 2440 70 0 0 {name=C3
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 2440 120 0 0 {name=l28 lab=GND}
C {devices/capa.sym} 2520 70 0 0 {name=C4
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 2520 120 0 0 {name=l29 lab=GND}
C {devices/lab_wire.sym} 2380 20 0 1 {name=l30 sig_type=std_logic lab=V_outN}
C {devices/lab_wire.sym} 2380 40 0 1 {name=l31 sig_type=std_logic lab=V_outP}
C {devices/lab_wire.sym} 1600 -80 0 1 {name=l32 sig_type=std_logic lab=Vtia_out_ref}
C {devices/ngspice_get_value.sym} 1670 -180 0 0 {name=r1 node="v(Vtia_out_ref)"
descr="v(Vtia_out_ref)"}
C {/home/simon/code/asic/analog/esd_diodes.sym} 810 -600 0 0 {name=x2}
C {devices/vdd.sym} 1000 -660 0 0 {name=l18 lab=VDD}
C {devices/gnd.sym} 1000 -550 0 0 {name=l20 lab=GND}
C {/home/simon/code/asic/analog/esd_diodes.sym} 2040 -160 0 0 {name=x4}
C {devices/vdd.sym} 2230 -220 0 0 {name=l21 lab=VDD}
C {devices/gnd.sym} 2230 -110 0 0 {name=l33 lab=GND}
C {/home/simon/code/asic/analog/esd_diodes.sym} 2060 180 0 0 {name=x5}
C {devices/vdd.sym} 2250 120 0 0 {name=l34 lab=VDD}
C {devices/gnd.sym} 2250 230 0 0 {name=l35 lab=GND}
