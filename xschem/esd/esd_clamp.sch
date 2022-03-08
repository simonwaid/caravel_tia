v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 60 -240 60 100 { lab=VN}
N 60 100 980 100 { lab=VN}
N 980 -60 980 100 { lab=VN}
N 500 -90 940 -90 { lab=VGM1}
N 500 -120 500 -90 { lab=VGM1}
N 980 -270 980 -120 { lab=VP}
N 100 -300 980 -300 { lab=VP}
N 980 -300 980 -270 { lab=VP}
N 500 -300 500 -260 { lab=VP}
N 290 -220 290 -50 { lab=VGM1}
N 250 90 250 100 { lab=VN}
N 290 -270 290 -240 { lab=VP}
N 290 -300 290 -270 { lab=VP}
N 100 -270 100 -240 { lab=VP}
N 100 -300 100 -270 { lab=VP}
N 100 -210 100 -170 { lab=VGM5}
N 100 -170 250 -170 { lab=VGM5}
N 250 -240 250 -170 { lab=VGM5}
N 250 -170 250 -80 { lab=VGM5}
N 250 -50 250 90 { lab=VN}
N 290 -90 500 -90 { lab=VGM1}
N 500 30 500 60 { lab=VN}
N 500 60 500 100 { lab=VN}
N 500 -90 500 -0 { lab=VGM1}
N 100 30 460 30 { lab=VGM5}
N 100 -170 100 30 { lab=VGM5}
N 40 100 60 100 { lab=VN}
N 50 -300 100 -300 { lab=VP}
N 980 -90 980 -60 { lab=VN}
N 500 -200 500 -180 { lab=#net1}
N 640 -300 640 20 { lab=VP}
N 680 20 680 50 { lab=VN}
N 680 50 680 100 { lab=VN}
N 680 -190 680 -10 { lab=#net1}
N 500 -190 680 -190 { lab=#net1}
C {sky130_fd_pr/diode.sym} 500 -150 2 0 {name=D1
model=diode_pw2nd_05v5
area=10e12
}
C {sky130_fd_pr/pfet_01v8.sym} 80 -240 0 0 {name=M3
L=1
W=2
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
C {sky130_fd_pr/pfet_01v8.sym} 270 -240 0 0 {name=M4
L=0.3
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
C {sky130_fd_pr/nfet_01v8_lvt.sym} 480 30 0 0 {name=M5
L=1
W=2
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {devices/iopin.sym} 50 -300 0 1 {name=p1 lab=VP}
C {devices/iopin.sym} 40 100 0 1 {name=p2 lab=VN}
C {devices/lab_wire.sym} 530 -90 0 1 {name=l1 sig_type=std_logic lab=VGM1}
C {devices/lab_wire.sym} 300 30 0 1 {name=l2 sig_type=std_logic lab=VGM5}
C {sky130_fd_pr/diode.sym} 500 -230 2 0 {name=D2
model=diode_pw2nd_05v5
area=10e12
}
C {sky130_fd_pr/nfet_01v8.sym} 960 -90 0 0 {name=M1
L=0.3
W=2
nf=1 
mult=1000
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 660 20 0 0 {name=M6
L=1
W=1
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
C {sky130_fd_pr/nfet_01v8.sym} 270 -50 0 1 {name=M2
L=0.3
W=2
nf=1 
mult=10
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
