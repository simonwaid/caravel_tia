v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -470 -410 -400 -410 { lab=Vref}
N -470 -450 -310 -450 { lab=Vin}
N -310 -450 -240 -450 { lab=Vin}
N -400 -410 -240 -410 { lab=Vref}
N 120 -500 120 -490 { lab=VDD}
N -230 -570 -230 -560 { lab=VDD}
N 120 -370 120 -350 { lab=GND}
N -620 -340 -620 -320 { lab=GND}
N -510 -340 -510 -320 { lab=GND}
N -620 -410 -620 -400 { lab=Vin}
N -620 -450 -470 -450 { lab=Vin}
N -620 -450 -620 -410 { lab=Vin}
N -510 -410 -470 -410 { lab=Vref}
N -510 -410 -510 -400 { lab=Vref}
N -560 -190 -560 -180 { lab=VDD}
N -560 -120 -560 -100 { lab=GND}
N 100 -390 120 -390 { lab=GND}
N 120 -390 120 -370 { lab=GND}
N 100 -410 240 -410 { lab=Voutd_outp}
N 240 -410 240 -400 { lab=Voutd_outp}
N 100 -430 310 -430 { lab=Voutd_outn}
N 310 -430 310 -400 { lab=Voutd_outn}
N 240 -340 240 -320 { lab=GND}
N 310 -340 310 -320 { lab=GND}
N 100 -450 120 -450 { lab=VDD}
N 120 -490 120 -450 { lab=VDD}
N -240 -410 -200 -410 { lab=Vref}
N -240 -430 -200 -430 { lab=Vin}
N -240 -450 -240 -430 { lab=Vin}
N -230 -450 -200 -450 { lab=Voutd_bias}
N -230 -490 -230 -450 { lab=Voutd_bias}
N -230 -500 -230 -490 { lab=Voutd_bias}
C {devices/code.sym} 460 -590 0 0 {name=SPICE
only_toplevel=true
value="
*.options savecurrents
.option warn=1
.control
set wr_vecnames
set wr_singlescale
set hcopydevtype=svg

reset

op
save currents
write test_outd.raw
run
reset

ac dec 10 1 1T
plot db(v(voutd_outp)-v(voutd_outn)) 
plot db(v(xoutd.V_da2_P)-v(xoutd.V_da2_N))
plot db(v(xoutd.V_da1_P)-v(xoutd.V_da1_N))

* hardcopy filter_gain.svg db(v(Vfilt1_N)-v(Vfilt1_P))
* noise v(voutd_outp) v2 dec 1000 2MEG 2G
* print all
* * wrdata result_noise.csv inoise_total onoise_total
* setplot noise1
* plot inoise_spectrum
* plot onoise_spectrum

reset
* noise v(xoutd.v_da1_p) v2 dec 1000 2MEG 2G
* setplot noise1
* plot inoise_spectrum
* plot onoise_spectrum
* run

* noise v(xoutd.v_da1_p) v2 dec 1000 10 1T
* print all
* setplot noise3
* plot inoise_spectrum
* plot onoise_spectrum
* run

* noise v(V_da2_P) v2 dec 1000 2MEG 2G
* setplot noise5
* plot inoise_spectrum
* plot onoise_spectrum
* run


noise v(voutd_outp) v2 dec 100 10 1T
print all
setplot noise1
plot inoise_spectrum
plot onoise_spectrum
run

noise v(voutd_outp) v2 dec 100 1MEG 10G
print all
setplot noise3
plot inoise_spectrum
plot onoise_spectrum
run




* noise v(V_da2_P) v2 dec 1000 10 1T
* print all
* setplot noise11
* plot inoise_spectrum
* plot onoise_spectrum
* run



.endc 
"}
C {devices/code.sym} 460 -420 0 0 {name=INCLUDE
only_toplevel=true
format="tcleval( @value )"
value="

* .include ../../tia.spice
* .include ../../filter_diff.spice
* .include ../../cmm_sense3.spice

* .include tia.spice
* .include filter_diff.spice
* .include diffamp.spice
* .include cmm_sense3.spice
* .include comp.spice
.include outdriver.spice

"}
C {devices/code.sym} 460 -250 0 0 {name=MODELS
only_toplevel=true
format="tcleval( @value )"
value="
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice #model#
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice.tt.red tt
* .lib /home/simon/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice.tt.red tt
"}
C {devices/gnd.sym} 120 -350 0 0 {name=l9 lab=GND}
C {devices/vdd.sym} 120 -500 0 0 {name=l10 lab=VDD}
C {devices/isource.sym} -230 -530 0 0 {name=I2 value=96u}
C {devices/vdd.sym} -230 -570 0 0 {name=l12 lab=VDD}
C {devices/lab_wire.sym} -230 -480 0 1 {name=l16 sig_type=std_logic lab=Voutd_bias}
C {devices/ngspice_get_value.sym} -440 -450 0 0 {name=r9 node="v(Vin)"
descr="v(Vin)"}
C {devices/vsource.sym} -620 -370 0 0 {name=V2 value="DC 1.3 AC 1"}
C {devices/vsource.sym} -510 -370 0 0 {name=V3 value=1.3}
C {devices/gnd.sym} -510 -320 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -620 -320 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -560 -150 0 0 {name=V4 value=1.8}
C {devices/vdd.sym} -560 -190 0 0 {name=l5 lab=VDD}
C {devices/gnd.sym} -560 -100 0 0 {name=l6 lab=GND}
C {/home/simon/code/asic/analog/outdriver/outdriver.sym} -50 -420 0 0 {name=xoutd}
C {devices/capa.sym} 240 -370 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 310 -370 0 0 {name=C2
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 240 -320 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 310 -320 0 0 {name=l4 lab=GND}
C {devices/ngspice_get_value.sym} -440 -410 0 0 {name=r1 node="v(Vref)"
descr="v(Vref)"}
C {devices/lab_wire.sym} 160 -430 0 1 {name=l7 sig_type=std_logic lab=Voutd_outn}
C {devices/lab_wire.sym} 160 -410 0 1 {name=l8 sig_type=std_logic lab=Voutd_outp}
C {devices/lab_wire.sym} -340 -450 0 1 {name=l11 sig_type=std_logic lab=Vin}
C {devices/lab_wire.sym} -340 -410 0 1 {name=l13 sig_type=std_logic lab=Vref}
C {devices/ngspice_get_value.sym} -130 -470 0 0 {name=r2 node="v(voutd_bias)"
descr="v(voutd_bias)"}
