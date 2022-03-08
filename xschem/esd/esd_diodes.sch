v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 10 -50 40 -50 { lab=io}
N 40 -80 40 -50 { lab=io}
N 40 -50 40 -20 { lab=io}
N 10 60 40 60 { lab=VN}
N 40 40 40 60 { lab=VN}
N 10 -170 40 -170 { lab=VP}
N 40 -170 40 -140 { lab=VP}
N 180 -80 180 -50 { lab=io}
N 180 -50 180 -20 { lab=io}
N 180 40 180 60 { lab=VN}
N 180 -170 180 -140 { lab=VP}
N 40 60 800 60 { lab=VN}
N 320 -80 320 -50 { lab=io}
N 320 -50 320 -20 { lab=io}
N 320 40 320 60 { lab=VN}
N 320 -170 320 -140 { lab=VP}
N 460 -80 460 -50 { lab=io}
N 460 -50 460 -20 { lab=io}
N 460 40 460 60 { lab=VN}
N 460 -170 460 -140 { lab=VP}
N 600 -80 600 -50 { lab=io}
N 600 -50 600 -20 { lab=io}
N 600 40 600 60 { lab=VN}
N 600 -170 600 -140 { lab=VP}
N 740 -80 740 -50 { lab=io}
N 740 -50 740 -20 { lab=io}
N 740 40 740 60 { lab=VN}
N 740 -170 740 -140 { lab=VP}
N 880 -80 880 -50 { lab=io}
N 880 -50 880 -20 { lab=io}
N 880 40 880 60 { lab=VN}
N 880 -170 880 -140 { lab=VP}
N 1020 -80 1020 -50 { lab=io}
N 1020 -50 1020 -20 { lab=io}
N 1020 40 1020 60 { lab=VN}
N 1020 -170 1020 -140 { lab=VP}
N 1160 -80 1160 -50 { lab=io}
N 1160 -50 1160 -20 { lab=io}
N 1160 40 1160 60 { lab=VN}
N 1160 -170 1160 -140 { lab=VP}
N 1300 -80 1300 -50 { lab=io}
N 1300 -50 1300 -20 { lab=io}
N 1300 40 1300 60 { lab=VN}
N 1300 -170 1300 -140 { lab=VP}
N 800 60 1300 60 { lab=VN}
N 40 -170 1300 -170 { lab=VP}
N 40 -50 1300 -50 { lab=io}
N 40 180 40 210 { lab=io}
N 40 210 40 240 { lab=io}
N 40 300 40 320 { lab=VN}
N 40 90 40 120 { lab=VP}
N 180 180 180 210 { lab=io}
N 180 210 180 240 { lab=io}
N 180 300 180 320 { lab=VN}
N 180 90 180 120 { lab=VP}
N 40 320 800 320 { lab=VN}
N 320 180 320 210 { lab=io}
N 320 210 320 240 { lab=io}
N 320 300 320 320 { lab=VN}
N 320 90 320 120 { lab=VP}
N 460 180 460 210 { lab=io}
N 460 210 460 240 { lab=io}
N 460 300 460 320 { lab=VN}
N 460 90 460 120 { lab=VP}
N 600 180 600 210 { lab=io}
N 600 210 600 240 { lab=io}
N 600 300 600 320 { lab=VN}
N 600 90 600 120 { lab=VP}
N 740 180 740 210 { lab=io}
N 740 210 740 240 { lab=io}
N 740 300 740 320 { lab=VN}
N 740 90 740 120 { lab=VP}
N 880 180 880 210 { lab=io}
N 880 210 880 240 { lab=io}
N 880 300 880 320 { lab=VN}
N 880 90 880 120 { lab=VP}
N 1020 180 1020 210 { lab=io}
N 1020 210 1020 240 { lab=io}
N 1020 300 1020 320 { lab=VN}
N 1020 90 1020 120 { lab=VP}
N 1160 180 1160 210 { lab=io}
N 1160 210 1160 240 { lab=io}
N 1160 300 1160 320 { lab=VN}
N 1160 90 1160 120 { lab=VP}
N 1300 180 1300 210 { lab=io}
N 1300 210 1300 240 { lab=io}
N 1300 300 1300 320 { lab=VN}
N 1300 90 1300 120 { lab=VP}
N 800 320 1300 320 { lab=VN}
N 40 90 1300 90 { lab=VP}
N 40 210 1300 210 { lab=io}
N 1300 320 1460 320 {}
N 1460 60 1460 320 {}
N 1300 60 1460 60 {}
N 1300 210 1500 210 {}
N 1300 -50 1500 -50 {}
N 1500 -50 1500 210 {}
N 1300 90 1530 90 {}
N 1530 -170 1530 90 {}
N 1300 -170 1530 -170 {}
C {sky130_fd_pr/diode.sym} 40 -110 0 0 {name=D1
model=diode_pw2nd_05v5
area=1e12
}
C {devices/iopin.sym} 10 -170 0 1 {name=p1 lab=VP}
C {devices/iopin.sym} 10 -50 0 1 {name=p2 lab=io}
C {sky130_fd_pr/diode.sym} 40 10 0 0 {name=D2
model=diode_pw2nd_05v5
area=1e12
}
C {devices/iopin.sym} 10 60 0 1 {name=p3 lab=VN}
C {sky130_fd_pr/diode.sym} 180 -110 0 0 {name=D3
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 180 10 0 0 {name=D4
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 320 -110 0 0 {name=D5
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 320 10 0 0 {name=D6
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 460 -110 0 0 {name=D7
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 460 10 0 0 {name=D8
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 600 -110 0 0 {name=D9
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 600 10 0 0 {name=D10
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 740 -110 0 0 {name=D11
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 740 10 0 0 {name=D12
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 880 -110 0 0 {name=D13
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 880 10 0 0 {name=D14
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 1020 -110 0 0 {name=D15
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 1020 10 0 0 {name=D16
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 1160 -110 0 0 {name=D17
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 1160 10 0 0 {name=D18
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 1300 -110 0 0 {name=D19
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 1300 10 0 0 {name=D20
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 40 150 0 0 {name=D21
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 40 270 0 0 {name=D22
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 180 150 0 0 {name=D23
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 180 270 0 0 {name=D24
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 320 150 0 0 {name=D25
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 320 270 0 0 {name=D26
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 460 150 0 0 {name=D27
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 460 270 0 0 {name=D28
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 600 150 0 0 {name=D29
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 600 270 0 0 {name=D30
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 740 150 0 0 {name=D31
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 740 270 0 0 {name=D32
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 880 150 0 0 {name=D33
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 880 270 0 0 {name=D34
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 1020 150 0 0 {name=D35
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 1020 270 0 0 {name=D36
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 1160 150 0 0 {name=D37
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 1160 270 0 0 {name=D38
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 1300 150 0 0 {name=D39
model=diode_pw2nd_05v5
area=1e12
}
C {sky130_fd_pr/diode.sym} 1300 270 0 0 {name=D40
model=diode_pw2nd_05v5
area=1e12
}
