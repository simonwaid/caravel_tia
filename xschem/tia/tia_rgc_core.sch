v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
L 3 620 -930 620 -130 {}
L 3 40 -920 40 -120 {}
L 3 1180 -930 1180 -130 {}
L 3 1740 -930 1740 -130 {}
T {disable
fet} 90 -230 0 0 0.2 0.2 {}
T {disable
fet} 870 -280 0 0 0.2 0.2 {}
T {disable
fet} 1430 -280 0 0 0.2 0.2 {}
T {TIA} 800 -940 0 0 0.4 0.4 {}
T {Dummy TIA for 
dark current
detection} 1360 -1000 0 0 0.4 0.4 {}
T {Current mirrors} 120 -930 0 0 0.4 0.4 {}
T {Expected area usage: 200µm²
Bandwidth ~1.3GHz (1.1 to 1.4GHz)
Gain ~59 dBOhm
Power consumption: ~3mA => ~5.4mW (FB off)
Input impedance ~30 to 50 Ohm
Output Noise (1MHz to 2 GHz): <20 nV/sqrt(Hz)

Feedback modes:
- No FB: dark current up to +/-5µA
- FB en: dark current up to +/-20µA
- FB Push pull: dark current up to +/-200µA} 0 -1300 0 0 0.4 0.4 {}
T {limit rush-in current 
when enabling TIA} -140 -400 0 0 0.2 0.2 {}
N -550 -880 740 -880 { lab=VP}
N 930 -720 930 -390 { lab=Out_1}
N 780 -620 930 -620 { lab=Out_1}
N 870 -360 890 -360 { lab=Input}
N 870 -800 870 -360 { lab=Input}
N 870 -800 890 -800 { lab=Input}
N 740 -620 740 -590 { lab=Input}
N 930 -830 930 -800 { lab=VP}
N 930 -880 930 -830 { lab=VP}
N 740 -680 740 -650 { lab=Out_2}
N 740 -880 880 -880 { lab=VP}
N 310 -210 310 -180 { lab=VN}
N 740 -550 740 -400 { lab=Input}
N 700 -370 700 -240 { lab=I_Bias1}
N 740 -370 820 -370 { lab=VN}
N 820 -370 820 -180 { lab=VN}
N 230 -330 310 -330 { lab=VN}
N 230 -330 230 -180 { lab=VN}
N 350 -330 350 -240 { lab=I_Bias1}
N 310 -300 310 -270 { lab=VM6D}
N 740 -340 740 -270 { lab=VM5D}
N 350 -360 350 -330 { lab=I_Bias1}
N 310 -360 350 -360 { lab=I_Bias1}
N 300 -400 310 -400 { lab=I_Bias1}
N 310 -400 310 -360 { lab=I_Bias1}
N 740 -210 740 -180 { lab=VN}
N 740 -240 820 -240 { lab=VN}
N 230 -240 310 -240 { lab=VN}
N 150 -360 150 -270 { lab=I_Bias1}
N 150 -360 310 -360 { lab=I_Bias1}
N 150 -240 150 -210 { lab=VN}
N 150 -210 150 -180 { lab=VN}
N 110 -600 110 -240 { lab=Disable_TIA}
N -540 -600 110 -600 { lab=Disable_TIA}
N -150 -240 -150 -210 { lab=VN}
N -150 -210 -150 -180 { lab=VN}
N -150 -770 -150 -270 { lab=Disable_TIA_B}
N -190 -600 -190 -240 { lab=Disable_TIA}
N -190 -800 -190 -600 { lab=Disable_TIA}
N -150 -830 -150 -800 { lab=VP}
N -150 -880 -150 -830 { lab=VP}
N 930 -220 930 -190 { lab=VN}
N 930 -190 930 -180 { lab=VN}
N 930 -330 930 -250 { lab=VM28D}
N 740 -880 740 -860 { lab=VP}
N 740 -800 740 -710 { lab=Out_2}
N 930 -620 940 -620 { lab=Out_1}
N 650 -830 700 -830 { lab=VN}
N 650 -830 650 -180 { lab=VN}
N 930 -250 1040 -250 { lab=VM28D}
N 1490 -770 1490 -390 { lab=Out_ref}
N 1330 -640 1490 -640 { lab=Out_ref}
N 1430 -360 1450 -360 { lab=VM39D}
N 1430 -800 1430 -360 { lab=VM39D}
N 1430 -800 1450 -800 { lab=VM39D}
N 1290 -610 1290 -540 { lab=VM39D}
N 1290 -640 1290 -610 { lab=VM39D}
N 1490 -830 1490 -800 { lab=VP}
N 1490 -880 1490 -830 { lab=VP}
N 1290 -760 1290 -670 { lab=VM31D}
N 1290 -540 1290 -400 { lab=VM39D}
N 1250 -370 1250 -240 { lab=I_Bias1}
N 1290 -370 1370 -370 { lab=VN}
N 1370 -370 1370 -180 { lab=VN}
N 1290 -340 1290 -270 { lab=VM36D}
N 1290 -210 1290 -180 { lab=VN}
N 1290 -240 1370 -240 { lab=VN}
N 1490 -220 1490 -190 { lab=VN}
N 1490 -190 1490 -180 { lab=VN}
N 1490 -330 1490 -250 { lab=VM40D}
N 1290 -840 1290 -810 { lab=VP}
N 1290 -880 1290 -840 { lab=VP}
N 1290 -780 1290 -760 { lab=VM31D}
N 1200 -810 1250 -810 { lab=VN}
N 1200 -810 1200 -180 { lab=VN}
N 860 -220 890 -220 { lab=Disable_TIA_B}
N 1420 -220 1450 -220 { lab=Disable_TIA_B}
N 1290 -590 1430 -590 { lab=VM39D}
N 700 -420 700 -370 { lab=I_Bias1}
N 700 -420 1250 -420 { lab=I_Bias1}
N 1250 -420 1250 -370 { lab=I_Bias1}
N 1140 -820 1140 -250 { lab=VM28D}
N 1040 -250 1140 -250 { lab=VM28D}
N 350 -240 510 -240 { lab=I_Bias1}
N 510 -240 700 -240 { lab=I_Bias1}
N 1590 -880 1700 -880 { lab=VP}
N 1700 -820 1700 -250 { lab=VM40D}
N -520 -820 -350 -820 { lab=VN}
N -540 -760 -520 -760 { lab=VP}
N -540 -880 -540 -760 { lab=VP}
N -350 -820 -350 -180 { lab=VN}
N -150 -360 -70 -360 { lab=Disable_TIA_B}
N 930 -770 930 -720 { lab=Out_1}
N 580 -570 740 -570 { lab=Input}
N 740 -570 870 -570 { lab=Input}
N 740 -710 740 -680 { lab=Out_2}
N 740 -590 740 -550 { lab=Input}
N 740 -750 760 -750 { lab=Out_2}
N 740 -860 740 -830 { lab=VP}
N 1490 -560 1510 -560 { lab=Out_ref}
N 1490 -250 1700 -250 { lab=VM40D}
N 880 -880 1590 -880 { lab=VP}
N 930 -360 1050 -360 { lab=VN}
N 1050 -360 1050 -180 { lab=VN}
N 1490 -360 1590 -360 { lab=VN}
N 1590 -360 1590 -180 { lab=VN}
N -530 -180 1590 -180 { lab=VN}
N -520 -760 -430 -760 { lab=VP}
N -260 -70 -260 -40 { lab=VN}
N -260 -40 220 -40 { lab=VN}
N 220 -60 220 -40 { lab=VN}
N 180 -70 180 -40 { lab=VN}
N 70 -70 70 -40 { lab=VN}
N -40 -70 -40 -40 { lab=VN}
N -150 -70 -150 -40 { lab=VN}
N 110 -60 110 -40 { lab=VN}
N 0 -60 0 -40 { lab=VN}
N -110 -60 -110 -40 { lab=VN}
N -220 -60 -220 -40 { lab=VN}
N -220 -120 220 -120 { lab=Disable_TIA_B}
N -70 -360 -70 -120 { lab=Disable_TIA_B}
N -260 -180 -260 -70 { lab=VN}
C {devices/iopin.sym} -530 -180 0 1 {name=p4 lab=VN}
C {devices/iopin.sym} -550 -880 0 1 {name=p5 lab=VP}
C {devices/ngspice_get_value.sym} 550 -370 0 0 {name=r6 node="@m.xtia.xm10.msky130_fd_pr__pfet_01v8[gm]"
descr="M10 gm"}
C {devices/ngspice_get_value.sym} 560 -340 0 0 {name=r7 node="@m.xtia.xm10.msky130_fd_pr__pfet_01v8[gds]"
descr="M10 gds"}
C {devices/opin.sym} 760 -750 0 0 {name=p15 lab=Out_2}
C {sky130_fd_pr/nfet_01v8.sym} 720 -240 0 0 {name=M5
L=1
W=2
nf=1 
mult=6
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} 300 -400 0 0 {name=p7 lab=I_Bias1}
C {sky130_fd_pr/nfet_01v8.sym} 330 -240 0 1 {name=M6
L=1.0
W=2
nf=1 
mult=6
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 910 -360 0 0 {name=M7
L=0.2
W=2
nf=1
mult=100
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 910 -800 0 0 {name=M8
L=0.2
W=2
nf=1
mult=60
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 720 -370 0 0 {name=M9
L=0.15
W=2
nf=1 
mult=12
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 330 -330 0 1 {name=M10
L=0.15
W=2
nf=1 
mult=12
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_wire.sym} 740 -280 0 1 {name=l1 sig_type=std_logic lab=VM5D}
C {devices/ngspice_get_value.sym} 740 -310 0 0 {name=r3 node="v(xtia.vm5D)"
descr="v(xtia.vm5D)"}
C {devices/ipin.sym} 580 -570 0 0 {name=p8 lab=Input}
C {devices/ipin.sym} -540 -600 0 0 {name=p1 lab=Disable_TIA}
C {sky130_fd_pr/nfet_01v8.sym} 130 -240 0 0 {name=M23
L=0.15
W=2
nf=1 
mult=5
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -170 -240 0 0 {name=M26
L=1
W=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -170 -800 0 0 {name=M27
L=1
W=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 910 -220 0 0 {name=M28
L=0.15
W=2
nf=1 
mult=100
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_wire.sym} 930 -260 0 1 {name=l6 sig_type=std_logic lab=VM28D}
C {devices/ngspice_get_value.sym} 930 -280 0 0 {name=r4 node="v(xtia.vm28D)"
descr="v(xtia.vm28D)"}
C {devices/lab_wire.sym} -150 -660 3 1 {name=l9 sig_type=std_logic lab=Disable_TIA_B}
C {devices/opin.sym} 940 -620 0 0 {name=p6 lab=Out_1}
C {devices/ngspice_get_value.sym} -120 -690 0 0 {name=r9 node="v(xtia.Disable_TIA_B)"
descr="v(xtia.Disable_TIA_B)"}
C {sky130_fd_pr/nfet_01v8.sym} 1270 -240 0 0 {name=M36
L=1
W=2
nf=1 
mult=6
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1470 -360 0 0 {name=M37
L=0.2
W=2
nf=1
mult=100
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 1470 -800 0 0 {name=M38
L=0.2
W=2
nf=1
mult=60
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 1270 -370 0 0 {name=M39
L=0.15
W=2
nf=1 
mult=12
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 1470 -220 0 0 {name=M40
L=0.15
W=2
nf=1 
mult=100
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_wire.sym} 860 -220 3 1 {name=l13 sig_type=std_logic lab=Disable_TIA_B}
C {devices/lab_wire.sym} 1420 -220 3 1 {name=l14 sig_type=std_logic lab=Disable_TIA_B}
C {sky130_fd_pr/cap_mim_m3_2.sym} -520 -850 0 0 {name=C20 model=cap_mim_m3_2 W=30 L=30 MF=1 spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym} 720 -830 0 0 {name=M16
L=0.5
W=2
nf=1
mult=10
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 760 -620 0 1 {name=M15
L=0.2
W=2
nf=1
mult=30
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1310 -640 0 1 {name=M31
L=0.2
W=2
nf=1
mult=30
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 1270 -810 0 0 {name=M35
L=0.5
W=2
nf=1
mult=10
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/opin.sym} 1510 -560 0 0 {name=p3 lab=Out_ref}
C {sky130_fd_pr/cap_mim_m3_2.sym} -430 -790 2 0 {name=C7 model=cap_mim_m3_2 W=30 L=30 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_2.sym} 1140 -850 0 1 {name=C2 model=cap_mim_m3_2 W=25 L=18 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_1.sym} 570 -210 2 0 {name=C5 model=cap_mim_m3_1 W=15 L=12 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_1.sym} 460 -210 2 0 {name=C4 model=cap_mim_m3_1 W=15 L=12 MF=1 spiceprefix=X}
C {devices/lab_wire.sym} 1290 -530 0 1 {name=l2 sig_type=std_logic lab=VM39D}
C {devices/lab_wire.sym} 1490 -270 0 1 {name=l3 sig_type=std_logic lab=VM40D}
C {devices/lab_wire.sym} 1290 -280 0 1 {name=l4 sig_type=std_logic lab=VM36D}
C {devices/lab_wire.sym} 1290 -750 0 1 {name=l5 sig_type=std_logic lab=VM31D}
C {devices/lab_wire.sym} 310 -270 0 0 {name=l7 sig_type=std_logic lab=VM6D}
C {sky130_fd_pr/cap_mim_m3_2.sym} 1700 -850 0 1 {name=C1 model=cap_mim_m3_2 W=25 L=18 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_var_lvt.sym} -220 -90 0 0 {name=C10 model=cap_var_lvt W=5 L=2 VM=1 spiceprefix=X}
C {sky130_fd_pr/cap_var_lvt.sym} -110 -90 0 0 {name=C3 model=cap_var_lvt W=5 L=2 VM=1 spiceprefix=X}
C {sky130_fd_pr/cap_var_lvt.sym} 0 -90 0 0 {name=C6 model=cap_var_lvt W=5 L=2 VM=1 spiceprefix=X}
C {sky130_fd_pr/cap_var_lvt.sym} 110 -90 0 0 {name=C8 model=cap_var_lvt W=5 L=2 VM=1 spiceprefix=X}
C {sky130_fd_pr/cap_var_lvt.sym} 220 -90 0 0 {name=C9 model=cap_var_lvt W=5 L=2 VM=1 spiceprefix=X}
