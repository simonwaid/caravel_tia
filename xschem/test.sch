v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {enable TIA} 580 -140 0 0 0.4 0.4 {}
T {provide a separate waveform for each TIA} 640 30 0 0 0.4 0.4 {}
N 210 -110 340 -110 { lab=GND}
N 340 -120 340 -110 { lab=GND}
N 210 70 320 70 { lab=io_analog[10:0]}
N 470 160 470 180 { lab=GND}
N 470 90 470 100 { lab=io_analog[6]}
N 690 160 690 180 { lab=GND}
N 690 90 690 100 { lab=io_analog[7]}
N 570 -90 690 -90 { lab=io_analog[3]}
N 570 0 570 10 { lab=GND}
N 570 -90 570 -60 { lab=io_analog[3]}
N 990 -400 1080 -400 { lab=tia1_outp}
N 990 -320 1080 -320 { lab=tia1_outn}
N 990 -240 1080 -240 { lab=tia2_outp}
N 990 -160 1080 -160 { lab=tia2_outn}
N 800 -400 930 -400 { lab=io_analog[4]}
N 800 -320 930 -320 { lab=io_analog[5]}
N 800 -240 930 -240 { lab=io_analog[0]}
N 800 -160 930 -160 { lab=io_analog[1]}
N 1190 -140 1190 -130 { lab=tia2_outn}
N 1190 -70 1190 -50 { lab=GND}
N 1260 -70 1260 -50 { lab=GND}
N 1080 -160 1190 -160 { lab=tia2_outn}
N 1190 -160 1190 -140 { lab=tia2_outn}
N 1080 -240 1250 -240 { lab=tia2_outp}
N 1250 -240 1260 -240 { lab=tia2_outp}
N 1260 -240 1260 -130 { lab=tia2_outp}
N 1350 -140 1350 -130 { lab=tia1_outn}
N 1350 -70 1350 -50 { lab=GND}
N 1420 -70 1420 -50 { lab=GND}
N 1080 -320 1340 -320 { lab=tia1_outn}
N 1340 -320 1350 -320 { lab=tia1_outn}
N 1350 -320 1350 -140 { lab=tia1_outn}
N 1080 -400 1420 -400 { lab=tia1_outp}
N 1420 -400 1420 -130 { lab=tia1_outp}
N 210 90 240 90 { lab=GND}
N 240 90 240 140 { lab=GND}
N 210 -210 240 -210 { lab=GND}
N 240 -210 240 90 { lab=GND}
N 210 130 240 130 { lab=GND}
N 240 140 240 150 { lab=GND}
N 210 110 240 110 { lab=GND}
N 210 10 240 10 { lab=GND}
N 210 50 240 50 { lab=GND}
N 210 30 240 30 { lab=GND}
N 210 -50 240 -50 { lab=GND}
N 210 -10 240 -10 { lab=GND}
N 210 -30 240 -30 { lab=GND}
N 210 -190 240 -190 { lab=GND}
N 210 -170 240 -170 { lab=GND}
N 210 -130 240 -130 { lab=GND}
N 210 -70 240 -70 { lab=GND}
N 210 -90 240 -90 { lab=GND}
N -120 -230 -90 -230 { lab=GND}
N -120 -230 -120 160 { lab=GND}
N -120 -210 -90 -210 { lab=GND}
N -120 -190 -90 -190 { lab=GND}
N -120 -170 -90 -170 { lab=GND}
N -120 -150 -90 -150 { lab=GND}
N -120 -130 -90 -130 { lab=GND}
N -120 -110 -90 -110 { lab=GND}
N -120 -90 -90 -90 { lab=GND}
N -120 -70 -90 -70 { lab=GND}
N -120 -50 -90 -50 { lab=GND}
N -120 -30 -90 -30 { lab=GND}
N -120 -10 -90 -10 { lab=GND}
N -120 10 -90 10 { lab=GND}
N 210 -150 300 -150 { lab=#net1}
N 300 -180 300 -150 { lab=#net1}
N 300 -180 340 -180 { lab=#net1}
N 210 -230 240 -230 { lab=GND}
N 240 -230 240 -210 { lab=GND}
C {user_analog_project_wrapper.sym} 60 -50 0 0 {name=x1}
C {devices/vsource.sym} 340 -150 0 0 {name=V1 value=1.8}
C {devices/isource.sym} 470 130 0 0 {name=I0 value="pulse 0 1e-6 5n 1n 1n 5n 20n"}
C {devices/lab_wire.sym} 250 70 0 1 {name=l1 sig_type=std_logic lab=io_analog[10:0]}
C {devices/gnd.sym} 470 180 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 340 -110 0 0 {name=l3 lab=GND}
C {devices/lab_wire.sym} 470 90 0 1 {name=l4 sig_type=std_logic lab=io_analog[6]}
C {devices/isource.sym} 690 130 0 0 {name=I1 value="pulse 0 1e-6 2n 1n 1n 5n 20n"}
C {devices/gnd.sym} 690 180 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 690 90 0 1 {name=l6 sig_type=std_logic lab=io_analog[7]}
C {devices/gnd.sym} 570 10 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} 630 -90 0 1 {name=l8 sig_type=std_logic lab=io_analog[3]}
C {devices/res.sym} 570 -30 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 960 -400 3 0 {name=R3
value=1
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 960 -320 3 0 {name=R2
value=1
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 960 -240 3 0 {name=R4
value=1
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 960 -160 3 0 {name=R5
value=1
footprint=1206
device=resistor
m=1}
C {devices/lab_wire.sym} 1010 -400 0 1 {name=l9 sig_type=std_logic lab=tia1_outp}
C {devices/lab_wire.sym} 1010 -320 0 1 {name=l10 sig_type=std_logic lab=tia1_outn}
C {devices/lab_wire.sym} 1000 -240 0 1 {name=l11 sig_type=std_logic lab=tia2_outp}
C {devices/lab_wire.sym} 1000 -160 0 1 {name=l12 sig_type=std_logic lab=tia2_outn}
C {devices/lab_wire.sym} 810 -320 0 1 {name=l13 sig_type=std_logic lab=io_analog[5]}
C {devices/lab_wire.sym} 810 -400 0 1 {name=l14 sig_type=std_logic lab=io_analog[4]}
C {devices/lab_wire.sym} 810 -160 0 1 {name=l15 sig_type=std_logic lab=io_analog[1]}
C {devices/lab_wire.sym} 810 -240 0 1 {name=l16 sig_type=std_logic lab=io_analog[0]}
C {devices/code.sym} 1620 -410 0 0 {name=SPICE
only_toplevel=true
value="
*.options savecurrents
.option warn=1
.control
set wr_vecnames
set wr_singlescale
set hcopydevtype=svg

tran 10p 10n
plot tia1_outp tia1_outn
plot tia2_outp tia2_outn





.endc 
"}
C {devices/code.sym} 1620 -240 0 0 {name=INCLUDE
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
C {devices/code.sym} 1620 -70 0 0 {name=MODELS
only_toplevel=true
format="tcleval( @value )"
value="
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice #model#
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice.tt.red tt
* .lib /home/simon/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice.tt.red tt
"}
C {devices/capa.sym} 1190 -100 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1260 -100 0 0 {name=C2
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1190 -50 0 0 {name=l17 lab=GND}
C {devices/gnd.sym} 1260 -50 0 0 {name=l18 lab=GND}
C {devices/capa.sym} 1350 -100 0 0 {name=C3
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1420 -100 0 0 {name=C4
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1350 -50 0 0 {name=l19 lab=GND}
C {devices/gnd.sym} 1420 -50 0 0 {name=l20 lab=GND}
C {devices/gnd.sym} 240 150 0 0 {name=l21 lab=GND}
C {devices/gnd.sym} -120 160 0 0 {name=l22 lab=GND}
