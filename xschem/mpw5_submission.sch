v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 80 -130 2110 -130 { lab=VN}
N 2120 -270 2120 -130 { lab=VN}
N 2110 -130 2120 -130 { lab=VN}
N 1710 -280 1710 -130 { lab=VN}
N 2120 -750 2120 -330 { lab=VP}
N 120 -750 2120 -750 { lab=VP}
N 270 -750 270 -650 { lab=VP}
N 750 -750 750 -630 { lab=VP}
N 1210 -750 1210 -500 { lab=VP}
N 1710 -750 1710 -360 { lab=VP}
N 1210 -420 1210 -130 { lab=VN}
N 1330 -340 1410 -340 { lab=In_TIA}
N 1350 -320 1410 -320 { lab=#net1}
N 1350 -470 1350 -320 { lab=#net1}
N 1350 -480 1350 -470 { lab=#net1}
N 1210 -480 1350 -480 { lab=#net1}
N 1210 -460 1790 -460 { lab=#net2}
N 1790 -460 1790 -330 { lab=#net2}
N 1790 -330 1820 -330 { lab=#net2}
N 1740 -310 1820 -310 { lab=#net3}
N 1740 -310 1740 -300 { lab=#net3}
N 1710 -300 1740 -300 { lab=#net3}
N 1710 -320 1760 -320 { lab=#net4}
N 1760 -290 1820 -290 { lab=#net4}
N 1760 -320 1760 -290 { lab=#net4}
N 2120 -310 2160 -310 { lab=Out_N}
N 2120 -290 2160 -290 { lab=Out_P}
N 1210 -440 1260 -440 { lab=#net5}
N 1710 -340 1750 -340 { lab=#net6}
N 1330 -360 1410 -360 { lab=Dis_TIA}
N 860 -500 910 -500 { lab=#net7}
N 860 -570 860 -500 { lab=#net7}
N 750 -570 860 -570 { lab=#net7}
N 750 -450 750 -130 { lab=VN}
N 750 -590 890 -590 { lab=I_out}
N 270 -610 270 -130 { lab=VN}
N 270 -630 450 -630 { lab=#net8}
N 750 -610 790 -610 { lab=#net9}
N 750 -550 790 -550 { lab=#net10}
N 750 -530 790 -530 { lab=#net11}
N 750 -510 790 -510 { lab=#net12}
N 750 -490 790 -490 { lab=#net13}
N 750 -470 790 -470 { lab=#net14}
C {outdriver/outdriver.sym} 1970 -300 0 0 {name=x4}
C {bias/current_mirrorx8.sym} 600 -540 0 0 {name=x5}
C {bias/low_pvt_source.sym} 120 -630 0 0 {name=x6}
C {bias/current_mirror_channel.sym} 1060 -460 0 0 {name=x7}
C {tia/tia_rgc_core.sym} 1560 -320 0 0 {name=x8}
C {devices/iopin.sym} 120 -750 0 1 {name=p1 lab=VP}
C {devices/ipin.sym} 1330 -340 0 0 {name=p2 lab=In_TIA}
C {devices/opin.sym} 2160 -310 0 0 {name=p3 lab=Out_N}
C {devices/iopin.sym} 80 -130 0 1 {name=p4 lab=VN}
C {devices/opin.sym} 2160 -290 0 0 {name=p5 lab=Out_P}
C {devices/noconn.sym} 1260 -440 2 0 {name=l1}
C {devices/noconn.sym} 1750 -340 2 0 {name=l2}
C {devices/ipin.sym} 1330 -360 0 0 {name=p6 lab=Dis_TIA}
C {devices/opin.sym} 890 -590 0 0 {name=p7 lab=I_out}
C {devices/noconn.sym} 790 -610 2 0 {name=l3}
C {devices/noconn.sym} 790 -550 2 0 {name=l4}
C {devices/noconn.sym} 790 -530 2 0 {name=l5}
C {devices/noconn.sym} 790 -510 2 0 {name=l6}
C {devices/noconn.sym} 790 -490 2 0 {name=l7}
C {devices/noconn.sym} 790 -470 2 0 {name=l8}
