v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {8uA in} -110 -230 0 0 0.3 0.3 {}
T {8uA out} 790 -210 0 0 0.3 0.3 {}
T {80uA out} 790 -340 0 0 0.3 0.3 {}
T {96uA out} 980 -340 0 0 0.3 0.3 {}
N -40 -140 -40 -50 { lab=I_in_channel}
N -40 -200 -40 -150 { lab=I_in_channel}
N -60 -200 -40 -200 { lab=I_in_channel}
N -40 -150 -40 -140 { lab=I_in_channel}
N -40 -170 -0 -170 { lab=I_in_channel}
N -0 -110 0 -80 { lab=#net1}
N -120 0 1030 0 { lab=VN}
N 0 -20 0 0 { lab=VN}
N -100 -530 1050 -530 { lab=VP}
N 110 -140 110 -50 { lab=I_in_channel}
N 150 -110 150 -80 { lab=#net2}
N 150 -20 150 0 { lab=VN}
N 720 -140 720 -50 { lab=I_in_channel}
N 760 -110 760 -80 { lab=#net3}
N 760 -20 760 0 { lab=VN}
N 760 -230 760 -200 { lab=TIA_I_Bias2}
N 760 -230 780 -230 { lab=TIA_I_Bias2}
N -40 -50 -40 20 { lab=I_in_channel}
N -40 20 720 20 { lab=I_in_channel}
N 720 -50 720 20 { lab=I_in_channel}
N 110 -50 110 20 { lab=I_in_channel}
N 150 -490 150 -460 { lab=VP}
N 150 -530 150 -490 { lab=VP}
N 110 -340 150 -340 { lab=#net4}
N 110 -460 110 -370 { lab=#net4}
N 150 -430 150 -400 { lab=#net5}
N 150 -370 230 -370 { lab=VP}
N 230 -530 230 -370 { lab=VP}
N 0 -140 70 -140 { lab=VN}
N 70 -140 70 -0 { lab=VN}
N 150 -140 220 -140 { lab=VN}
N 220 -140 220 -0 { lab=VN}
N 760 -140 830 -140 { lab=VN}
N 830 -140 830 0 { lab=VN}
N 760 -50 830 -50 { lab=VN}
N 150 -50 220 -50 { lab=VN}
N -0 -50 70 -50 { lab=VN}
N 760 -490 760 -460 { lab=VP}
N 760 -530 760 -490 { lab=VP}
N 720 -460 720 -370 { lab=#net4}
N 760 -430 760 -400 { lab=#net6}
N 760 -370 840 -370 { lab=VP}
N 840 -530 840 -370 { lab=VP}
N 110 -550 110 -460 { lab=#net4}
N 110 -550 720 -550 { lab=#net4}
N 720 -550 720 -470 { lab=#net4}
N 720 -470 720 -460 { lab=#net4}
N 760 -300 780 -300 { lab=TIA_I_Bias1}
N 760 -340 760 -300 { lab=TIA_I_Bias1}
N 150 -340 150 -170 { lab=#net4}
N 110 -370 110 -340 { lab=#net4}
N 760 -200 760 -170 { lab=TIA_I_Bias2}
N 240 -80 240 -0 { lab=VN}
N 280 -70 280 -0 { lab=VN}
N 280 -130 360 -130 { lab=I_in_channel}
N 430 -80 430 0 { lab=VN}
N 470 -70 470 0 { lab=VN}
N 560 -80 560 0 { lab=VN}
N 600 -70 600 0 { lab=VN}
N 600 -550 600 -130 { lab=#net4}
N 300 -430 300 -410 { lab=#net4}
N 270 -420 300 -420 { lab=#net4}
N 270 -550 270 -420 { lab=#net4}
N 240 -240 240 -80 { lab=VN}
N 240 -240 280 -240 { lab=VN}
N 280 -250 280 -240 { lab=VN}
N 280 -310 390 -310 { lab=I_in_channel}
N 390 -310 390 -130 { lab=I_in_channel}
N 360 -130 390 -130 { lab=I_in_channel}
N 390 -130 390 20 { lab=I_in_channel}
N 280 -170 280 -130 { lab=I_in_channel}
N 280 -240 280 -230 { lab=VN}
N 470 -530 470 -130 { lab=VP}
N 300 -350 420 -350 { lab=VP}
N 420 -530 420 -350 { lab=VP}
N 300 -530 300 -490 { lab=VP}
N 970 -490 970 -460 { lab=VP}
N 970 -530 970 -490 { lab=VP}
N 930 -460 930 -370 { lab=#net4}
N 970 -430 970 -400 { lab=#net7}
N 970 -370 1050 -370 { lab=VP}
N 1050 -530 1050 -370 { lab=VP}
N 930 -550 930 -470 { lab=#net4}
N 930 -470 930 -460 { lab=#net4}
N 970 -300 990 -300 { lab=A_Out_I_Bias}
N 970 -340 970 -300 { lab=A_Out_I_Bias}
N 720 -550 930 -550 { lab=#net4}
C {devices/ipin.sym} -60 -200 0 0 {name=p1 lab=I_in_channel}
C {devices/iopin.sym} -100 -530 0 1 {name=p2 lab=VP}
C {devices/opin.sym} 780 -230 0 0 {name=p3 lab=TIA_I_Bias2}
C {sky130_fd_pr/nfet_01v8.sym} -20 -140 0 0 {name=M1
L=0.2
W=2
nf=1 
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 130 -460 0 0 {name=M2
L=1
W=2
nf=1
mult=4*4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -20 -50 0 0 {name=M3
L=1
W=2
nf=1 
mult=2*4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/iopin.sym} -120 0 0 1 {name=p4 lab=VN}
C {sky130_fd_pr/pfet_01v8.sym} 130 -370 0 0 {name=M4
L=0.2
W=2
nf=1
mult=4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/opin.sym} 780 -300 0 0 {name=p5 lab=TIA_I_Bias1}
C {sky130_fd_pr/cap_mim_m3_2.sym} 300 -380 0 0 {name=C8 model=cap_mim_m3_2 W=30 L=30 MF=1 spiceprefix=X}
C {devices/opin.sym} 990 -300 0 0 {name=p6 lab=A_Out_I_Bias}
C {sky130_fd_pr/nfet_01v8.sym} 130 -140 0 0 {name=M5
L=0.2
W=2
nf=1 
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 740 -140 0 0 {name=M6
L=0.2
W=2
nf=1 
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 130 -50 0 0 {name=M7
L=1
W=2
nf=1 
mult=2*4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 740 -50 0 0 {name=M8
L=1
W=2
nf=1 
mult=2*4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 740 -460 0 0 {name=M13
L=1
W=2
nf=1
mult=4*4*10
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 740 -370 0 0 {name=M14
L=0.2
W=2
nf=1
mult=4*10
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 950 -460 0 0 {name=M9
L=1
W=2
nf=1
mult=4*4*12
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 950 -370 0 0 {name=M10
L=0.2
W=2
nf=1
mult=4*12
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/cap_mim_m3_2.sym} 300 -460 2 1 {name=C4 model=cap_mim_m3_2 W=30 L=30 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_2.sym} 280 -200 0 0 {name=C3 model=cap_mim_m3_2 W=30 L=30 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_2.sym} 280 -280 2 1 {name=C6 model=cap_mim_m3_2 W=30 L=30 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_2.sym} 600 -100 2 1 {name=C1 model=cap_mim_m3_2 W=30 L=30 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_2.sym} 470 -100 2 1 {name=C2 model=cap_mim_m3_2 W=30 L=30 MF=1 spiceprefix=X}
