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
N 220 -290 220 -270 { lab=GND}
N 220 -370 220 -350 { lab=VDD}
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
N 570 -350 570 -330 { lab=GND}
N 570 -480 570 -410 { lab=#net4}
N 690 -480 690 -420 { lab=#net4}
N 570 -480 690 -480 { lab=#net4}
N 690 -480 720 -480 { lab=#net4}
N 810 -360 810 -340 { lab=GND}
N 690 -360 690 -340 { lab=GND}
N 780 -480 840 -480 { lab=Vinb}
N 810 -480 810 -420 { lab=Vinb}
N 880 -390 880 -360 { lab=GND}
N 880 -360 920 -360 { lab=GND}
N 920 -360 920 -340 { lab=GND}
N 920 -390 920 -360 { lab=GND}
N 840 -480 920 -480 { lab=Vinb}
N 920 -480 920 -420 { lab=Vinb}
N 920 -480 1030 -480 { lab=Vinb}
N 920 -530 920 -480 { lab=Vinb}
N 1050 -480 1050 -430 { lab=Vinb}
N 1050 -370 1050 -350 { lab=GND}
N 1160 -100 1250 -100 { lab=Vinb}
N 1160 -480 1160 -100 { lab=Vinb}
N 1030 -480 1160 -480 { lab=Vinb}
N 1550 -80 1710 -80 { lab=#net5}
N 1550 -100 1710 -100 { lab=Vtia_outP_2}
N 1710 -80 1740 -80 { lab=#net5}
N 560 40 560 60 { lab=GND}
N 940 -60 1030 -60 { lab=GND}
N 940 -80 1010 -80 { lab=#net6}
N 1010 -80 1010 20 { lab=#net6}
N 1040 -80 1250 -80 { lab=#net3}
N 1040 -100 1040 -80 { lab=#net3}
N 1030 -60 1070 -60 { lab=GND}
N 1070 -60 1070 -50 { lab=GND}
N 1010 20 1720 20 { lab=#net6}
N 1720 0 1800 0 { lab=#net6}
N 1720 0 1720 20 { lab=#net6}
N 1770 20 1800 20 { lab=Vtia_outP_1}
N 1770 -50 1770 20 { lab=Vtia_outP_1}
N 1770 -60 1770 -50 { lab=Vtia_outP_1}
N 1550 -60 1770 -60 { lab=Vtia_outP_1}
N 1750 40 1800 40 { lab=#net5}
N 1750 -80 1750 40 { lab=#net5}
N 1740 -80 1750 -80 { lab=#net5}
N 2100 0 2140 0 { lab=VDD}
N 2100 60 2140 60 { lab=GND}
N 2140 60 2140 70 { lab=GND}
N 2230 100 2230 120 { lab=GND}
N 2100 40 2230 40 { lab=V_outP}
N 2310 100 2310 120 { lab=GND}
N 2310 20 2310 40 { lab=V_outN}
N 2100 20 2310 20 { lab=V_outN}
C {/home/simon/code/asic/analog/bias/current_mirrorx8.sym} 410 -50 0 0 {name=xcurm}
C {/home/simon/code/asic/analog/bias/low_pvt_source.sym} -40 -140 0 0 {name=xisource}
C {/home/simon/code/asic/analog/bias/current_mirror_channel.sym} 790 -80 0 0 {name=x1}
C {devices/vsource.sym} 220 -320 0 0 {name=V1 value=#UB#}
C {devices/gnd.sym} 130 -90 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 220 -370 0 0 {name=l2 lab=VDD}
C {devices/gnd.sym} 220 -270 0 0 {name=l3 lab=GND}
C {devices/vdd.sym} 150 -180 0 0 {name=l4 lab=VDD}
C {devices/vdd.sym} 610 -140 0 0 {name=l5 lab=VDD}
C {devices/gnd.sym} 590 20 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} 970 -140 0 0 {name=l7 lab=VDD}
C {devices/gnd.sym} 970 -30 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 1210 -130 2 0 {name=l9 lab=GND}
C {devices/vdd.sym} 1590 -120 0 0 {name=l12 lab=VDD}
C {devices/gnd.sym} 1590 -30 0 0 {name=l13 lab=GND}
C {devices/lab_wire.sym} 1050 -480 0 1 {name=l14 sig_type=std_logic lab=Vinb}
C {devices/isource.sym} 570 -380 0 0 {name=I1 value="DC 0 AC 1"
* "pulse 0 50E-9 10n 0.1n 0.1n 5n 10n"
* 
*
*}
C {devices/gnd.sym} 570 -330 0 0 {name=l16 lab=GND}
C {devices/ngspice_get_value.sym} 980 -480 0 0 {name=r2 node="v(Vinb)"
descr="v(Vinb)"}
C {devices/capa.sym} 810 -390 0 0 {name=C1
m=1
value=200f
footprint=1206
device="ceramic capacitor"}
C {devices/ind.sym} 750 -480 1 0 {name=L1
m=1
value=1n
footprint=1206
device=inductor}
C {devices/capa.sym} 690 -390 0 0 {name=C2
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 810 -340 0 0 {name=l15 lab=GND}
C {devices/gnd.sym} 690 -340 0 0 {name=l17 lab=GND}
C {sky130_fd_pr/nfet_01v8_esd.sym} 900 -390 0 0 {name=M1
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
C {devices/gnd.sym} 920 -340 0 0 {name=l18 lab=GND}
C {devices/vdd.sym} 920 -590 0 0 {name=l21 lab=VDD}
C {devices/gnd.sym} 1050 -350 0 0 {name=l20 lab=GND}
C {devices/code.sym} 2700 -360 0 0 {name=SPICE
only_toplevel=true
value="
*.options savecurrents
.option warn=1
* .option temp=100
.control
set wr_vecnames
set wr_singlescale
set hcopydevtype=svg

set model=\\"#model#\\"
let mc_runs=3
let mc_runNo = 1

dowhile mc_runNo <= mc_runs
   destroy all
	let min_temp=0
	let var_temp = min_temp
	let max_temp=100
	let temp_step=30
	let noise_no=1
	dowhile var_temp <= max_temp
		op
		wrdata 'result_op_op_\{$&var_temp\}deg_\{$&mc_runNo\}.csv' v(v_outp) v(v_outn)

		* AC analysis
		ac dec 10 10 1T
		option temp=$&var_temp
		wrdata 'result_ac_ac_\{$&var_temp\}deg_\{$&mc_runNo\}.csv' v(vinb) vdb(vtia_outp_1) db(v(v_outp)-v(v_outn))

		* Measure AC at output driver
		meas ac gain_tia FIND vdb(vtia_outp_1) AT=10MEG
		meas ac max_gain_tia max vdb(vtia_outp_1) from=1MEG to=100G
		meas ac min_gain_tia min vdb(vtia_outp_1) from=1MEG to=100MEG
		let bw_gain_tia=gain_tia-3
		meas ac bandwidth_tia when vdb(vtia_outp_1)=bw_gain_tia fall = LAST
		wrdata result_meas_tia_\{$&var_temp\}deg_\{$&mc_runNo\}.csv gain_tia max_gain_tia min_gain_tia bandwidth_tia 
	
		* Measure AC at output driver
		meas ac gain_out_p FIND vdb(v_outp) AT=10MEG
		meas ac gain_out_n FIND vdb(v_outn) AT=10MEG
		meas ac max_gain_out_p max vdb(v_outp) from=1MEG to=100G
		meas ac max_gain_out_n max vdb(v_outn) from=1MEG to=100G
		meas ac min_gain_out_n min vdb(v_outn) from=1MEG to=100MEG
		meas ac min_gain_out_p min vdb(v_outp) from=1MEG to=100MEG
		let bw_gain_out_p=gain_out_p-3
		let bw_gain_out_n=gain_out_n-3
		meas ac bandwidth_out_p when vdb(v_outp)=bw_gain_out_p fall = LAST
		meas ac bandwidth_out_n when vdb(v_outn)=bw_gain_out_n fall = LAST
		wrdata result_meas_out_\{$&var_temp\}deg_\{$&mc_runNo\}.csv gain_out_p gain_out_n max_gain_out_p max_gain_out_n min_gain_out_n min_gain_out_p bandwidth_out_p bandwidth_out_n	
		
		* noise at TIA
		noise v(vtia_outp_1) i1 dec 10 10 2G
		setplot noise1
		wrdata result_noise_tiaov_\{$&var_temp\}deg_\{$&mc_runNo\}.csv inoise_spectrum onoise_spectrum
		
		noise v(vtia_outp_1) i1 dec 10 2MEG 2G
		setplot noise3
		wrdata result_noise_tiazoom_\{$&var_temp\}deg_\{$&mc_runNo\}.csv inoise_spectrum onoise_spectrum

		noise v(v_outp) i1 dec 10 10 2G
		setplot noise5
		wrdata result_noise_outov_\{$&var_temp\}deg_\{$&mc_runNo\}.csv inoise_spectrum onoise_spectrum
		
		noise v(v_outp) i1 dec 10 2MEG 2G
		setplot noise7
		wrdata result_noise_outzoom_\{$&var_temp\}deg_\{$&mc_runNo\}.csv inoise_spectrum onoise_spectrum
		run
		let var_temp = var_temp + temp_step
	end
	let  mc_runNo = mc_runNo +1 
	reset
end



.endc 
"}
C {devices/code.sym} 2700 -190 0 0 {name=INCLUDE
only_toplevel=true
format="tcleval( @value )"
value="

* .include ../../tia.spice
* .include ../../filter_diff.spice
* .include ../../cmm_sense3.spice

.include ../../../tia_rgc_core.spice
.include ../../../current_mirror_channel.spice
.include ../../../current_mirrorx8.spice
.include ../../../low_pvt_source.spice
.include ../../../outdriver.spice

"}
C {devices/code.sym} 2700 -20 0 0 {name=MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice #model#
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice sf
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice.tt.red tt
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
C {devices/capa.sym} 2230 70 0 0 {name=C3
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 2230 120 0 0 {name=l28 lab=GND}
C {devices/capa.sym} 2310 70 0 0 {name=C4
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 2310 120 0 0 {name=l29 lab=GND}
C {devices/lab_wire.sym} 2170 20 0 1 {name=l30 sig_type=std_logic lab=V_outN}
C {devices/lab_wire.sym} 2170 40 0 1 {name=l31 sig_type=std_logic lab=V_outP}
