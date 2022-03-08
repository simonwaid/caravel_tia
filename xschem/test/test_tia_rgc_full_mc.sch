v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -320 -240 -320 -230 { lab=VDD}
N -320 -230 -320 -210 { lab=VDD}
N -240 -160 20 -160 { lab=Vtia_outP_2}
N -1880 -150 -1880 -130 { lab=GND}
N -1880 -400 -1880 -210 { lab=#net1}
N -820 -260 -820 -250 { lab=VDD}
N -820 -250 -820 -230 { lab=VDD}
N -1760 -400 -1760 -340 { lab=#net1}
N -1880 -400 -1760 -400 { lab=#net1}
N -1760 -400 -1730 -400 { lab=#net1}
N -1640 -280 -1640 -260 { lab=GND}
N -1760 -280 -1760 -260 { lab=GND}
N -1670 -400 -1610 -400 { lab=Vinb}
N -1640 -400 -1640 -340 { lab=Vinb}
N -1570 -310 -1570 -280 { lab=GND}
N -1570 -280 -1530 -280 { lab=GND}
N -1530 -280 -1530 -260 { lab=GND}
N -1530 -310 -1530 -280 { lab=GND}
N -1610 -400 -1530 -400 { lab=Vinb}
N -1530 -400 -1530 -340 { lab=Vinb}
N -340 -200 -320 -200 { lab=VDD}
N -320 -210 -320 -200 { lab=VDD}
N -340 -120 -320 -120 { lab=GND}
N -320 -120 -320 -80 { lab=GND}
N -1420 -400 -1070 -400 { lab=Vinb}
N -1530 -400 -1420 -400 { lab=Vinb}
N -240 -140 20 -140 { lab=Vtia_outP_1}
N 20 -80 20 10 { lab=GND}
N 20 10 80 10 { lab=GND}
N 80 -80 80 10 { lab=GND}
N 50 -80 50 10 { lab=GND}
N 20 -140 50 -140 { lab=Vtia_outP_1}
N 50 -140 50 -120 { lab=Vtia_outP_1}
N -1530 -450 -1530 -400 { lab=Vinb}
N -340 -140 -240 -140 { lab=Vtia_outP_1}
N -340 -180 -270 -180 { lab=Vtia_outP_2}
N -270 -180 -270 -160 { lab=Vtia_outP_2}
N -270 -160 -240 -160 { lab=Vtia_outP_2}
N -340 -160 -310 -160 { lab=#net2}
N -690 -350 -310 -350 { lab=#net2}
N -690 -480 -690 -350 { lab=#net2}
N -690 -490 -690 -480 { lab=#net2}
N -690 -490 -640 -490 { lab=#net2}
N -670 -370 -280 -370 { lab=Vtia_outP_1}
N -670 -470 -670 -370 { lab=Vtia_outP_1}
N -670 -470 -640 -470 { lab=Vtia_outP_1}
N -810 -450 -640 -450 { lab=#net3}
N -910 -510 -640 -510 { lab=#net4}
N -910 -510 -910 -450 { lab=#net4}
N -1000 -530 -640 -530 { lab=Vbias2}
N -1000 -530 -1000 -450 { lab=Vbias2}
N -730 -200 -640 -200 { lab=GND}
N -820 -160 -640 -160 { lab=Vbias1}
N -820 -170 -820 -160 { lab=Vbias1}
N -690 -180 -640 -180 { lab=Vinb}
N -690 -320 -690 -180 { lab=Vinb}
N -1050 -320 -690 -320 { lab=Vinb}
N -1050 -400 -1050 -320 { lab=Vinb}
N -1070 -400 -1050 -400 { lab=Vinb}
N -310 -160 -290 -160 { lab=#net2}
N -290 -350 -290 -160 { lab=#net2}
N -310 -350 -290 -350 { lab=#net2}
N -260 -370 -260 -140 { lab=Vtia_outP_1}
N -280 -370 -260 -370 { lab=Vtia_outP_1}
N -320 -570 -320 -560 { lab=VDD}
N -320 -560 -320 -540 { lab=VDD}
N -340 -530 -320 -530 { lab=VDD}
N -320 -540 -320 -530 { lab=VDD}
N -340 -490 -320 -490 { lab=GND}
N -320 -490 -320 -450 { lab=GND}
N -690 -320 -240 -320 { lab=Vinb}
N -240 -510 -240 -320 { lab=Vinb}
N -340 -510 -240 -510 { lab=Vinb}
C {devices/code.sym} 370 -490 0 0 {name=SPICE
only_toplevel=true
value="
*.options savecurrents
.option warn=1
.control
set wr_vecnames
set wr_singlescale
set hcopydevtype=svg
** TIA

set model=\\"#model#\\"
let mc_runs=100
let mc_runNo = 1

dowhile mc_runNo <= mc_runs
   destroy all
	let min_temp=0
	let var_temp = min_temp
	let max_temp=100
	let temp_step=10
	let noise_no=1
	dowhile var_temp <= max_temp

		* AC analysis
		ac dec 10 1 1T
		option temp=$&var_temp
		* Write frequency spectra
		wrdata 'result_ac_ac_\{$&var_temp\}deg_\{$&mc_runNo\}.csv' v(Vinb) vdb(Vtia_outP_1) vdb(Vtia_outP_2)
		* Measure and write key parameters
		meas ac gain FIND vdb(vtia_outp_1) AT=50MEG
		meas ac max_gain max vdb(vtia_outp_1) from=1MEG to=100G
		meas ac min_gain min vdb(vtia_outp_1) from=1MEG to=100MEG
		let bw_gain=gain-3
		meas ac bandwidth_upper when vdb(vtia_outp_1)=bw_gain fall = LAST
		let bandwidth_lower=bandwidth_upper
		meas ac bandwidth_lower when vdb(vtia_outp_1)=bw_gain rise = LAST
		wrdata 'result_meas_meas_\{$&var_temp\}deg_\{$&mc_runNo\}.csv' gain max_gain min_gain bandwidth_upper bandwidth_lower
		* Noise analysis		
		noise v(vtia_outp_1) i1 dec 10 10 2G
		setplot noise\{$&noise_no\}
		let noise_no=noise_no+2
		wrdata 'result_noise_full_\{$&var_temp\}deg_\{$&mc_runNo\}.csv' inoise_spectrum onoise_spectrum
		noise v(vtia_outp_1) i1 dec 10 2MEG 2G
		setplot noise\{$&noise_no\}
		let noise_no=noise_no+2
		wrdata 'result_noise_zoom_\{$&var_temp\}deg_\{$&mc_runNo\}.csv' inoise_spectrum onoise_spectrum		
		run
		let var_temp = var_temp + temp_step
	end
	let  mc_runNo = mc_runNo +1 
	reset
end

.endc 
"}
C {devices/vdd.sym} -320 -240 0 0 {name=l11 lab=VDD}
C {devices/lab_wire.sym} -1400 -400 0 1 {name=l5 sig_type=std_logic lab=Vinb}
C {devices/code.sym} 370 -320 0 0 {name=INCLUDE
only_toplevel=true
format="tcleval( @value )"
value="

* .include ../../tia.spice
* .include ../../filter_diff.spice
* .include ../../cmm_sense3.spice

.include ../../../tia_rgc_core.spice
.include ../../../tia_rgc_feedback.spice

"}
C {devices/code.sym} 370 -150 0 0 {name=MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice #model#
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice sf
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice.tt.red tt
* .lib /home/simon/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice.tt.red tt
"}
C {devices/vdd.sym} -1090 -600 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} -1090 -570 0 0 {name=V2 value=#UB#}
C {devices/gnd.sym} -1090 -540 0 0 {name=l8 lab=GND}
C {devices/lab_wire.sym} -210 -140 0 1 {name=l10 sig_type=std_logic lab=Vtia_outP_1}
C {devices/ngspice_get_value.sym} -100 -110 0 0 {name=r4 node="v(Vtia_outP_1)"
descr="v(Vtia_outP_1)"}
C {devices/isource.sym} -1880 -180 0 0 {name=I1 value="DC 0 AC 1"
* "pulse 0 50E-9 10n 0.1n 0.1n 5n 10n"
* 
*
*}
C {devices/gnd.sym} -1880 -130 0 0 {name=l16 lab=GND}
C {devices/isource.sym} -820 -200 0 0 {name=I2 value=80u}
C {devices/ngspice_get_value.sym} -1470 -400 0 0 {name=r2 node="v(Vinb)"
descr="v(Vinb)"}
C {devices/vdd.sym} -820 -260 0 0 {name=l4 lab=VDD}
C {devices/capa.sym} -1640 -310 0 0 {name=C1
m=1
value=200f
footprint=1206
device="ceramic capacitor"}
C {devices/ind.sym} -1700 -400 1 0 {name=L1
m=1
value=1n
footprint=1206
device=inductor}
C {devices/capa.sym} -1760 -310 0 0 {name=C2
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} -1640 -260 0 0 {name=l9 lab=GND}
C {devices/gnd.sym} -1760 -260 0 0 {name=l13 lab=GND}
C {devices/ngspice_get_value.sym} -1040 -260 0 0 {name=r3 node="v(Vbias1)"
descr="v(Vbias1)"}
C {sky130_fd_pr/nfet_01v8_esd.sym} -1550 -310 0 0 {name=M1
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
C {devices/gnd.sym} -1530 -260 0 0 {name=l15 lab=GND}
C {devices/lab_wire.sym} -800 -160 0 1 {name=l3 sig_type=std_logic lab=Vbias1}
C {devices/ngspice_get_value.sym} -1040 -230 0 0 {name=r5 node="v(Vbias2)"
descr="v(Vbias2)"}
C {devices/gnd.sym} -320 -80 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} -210 -160 0 1 {name=l14 sig_type=std_logic lab=Vtia_outP_2}
C {devices/ngspice_get_value.sym} -110 -160 0 0 {name=r6 node="v(Vtia_outP_2)"
descr="v(Vtia_outP_2)"}
C {devices/isource.sym} -1000 -420 0 0 {name=I3 value=8u}
C {devices/lab_wire.sym} -910 -530 0 1 {name=l18 sig_type=std_logic lab=Vbias2}
C {sky130_fd_pr/nfet_01v8.sym} 50 -100 1 0 {name=M2
L=0.3
W=2
nf=1 
mult=3
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/gnd.sym} 50 10 0 0 {name=l12 lab=GND}
C {devices/noconn.sym} 20 -160 2 0 {name=l19}
C {devices/vdd.sym} -1530 -510 0 0 {name=l21 lab=VDD}
C {devices/isource.sym} -1530 -480 0 0 {name=I4 value=#ID#}
C {devices/vsource.sym} -810 -420 0 0 {name=V1 value=#FB_PP_EN#}
C {devices/gnd.sym} -810 -390 0 0 {name=l25 lab=GND}
C {devices/vsource.sym} -910 -420 0 0 {name=V3 value=#FB_DIS#}
C {devices/gnd.sym} -910 -390 0 0 {name=l17 lab=GND}
C {devices/gnd.sym} -1000 -390 0 0 {name=l22 lab=GND}
C {/home/simon/code/asic/analog/tia/tia_rgc_feedback.sym} -490 -490 0 0 {name=x2}
C {/home/simon/code/asic/analog/tia/tia_rgc_core.sym} -490 -160 0 0 {name=x1}
C {devices/gnd.sym} -730 -200 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} -320 -570 0 0 {name=l6 lab=VDD}
C {devices/gnd.sym} -320 -450 0 0 {name=l20 lab=GND}
