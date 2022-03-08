v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -730 -530 -730 -520 { lab=VDD}
N -730 -520 -730 -500 { lab=VDD}
N -790 -460 -790 -430 { lab=GND}
N -1030 -200 -1030 -190 { lab=VDD}
N -1030 -130 -1030 -120 { lab=GND}
N -690 -480 -190 -480 { lab=V_iout_0}
N -190 -480 -190 -280 { lab=V_iout_0}
N -790 -500 -730 -500 { lab=VDD}
N -790 -480 -690 -480 { lab=V_iout_0}
N -440 -400 -190 -400 { lab=V_iout_0}
N -440 -460 -370 -460 { lab=V_iout_0}
N -370 -460 -370 -400 { lab=V_iout_0}
C {devices/code.sym} 70 -460 0 0 {name=SPICE
only_toplevel=true
value="
*.options savecurrents
.option warn=1
.control
set wr_vecnames
set wr_singlescale
set hcopydevtype=svg

set model=\\"#model#\\"
let mc_runs=100
let mc_runNo = 1

dowhile mc_runNo <= mc_runs
   destroy all
	let min_temp=0
	let var_temp = min_temp
	let max_temp=100
	let temp_step=3
	dowhile var_temp <= max_temp
		option temp=$&var_temp
		wrdata 'result_op_op_\{$&var_temp\}deg_\{$&mc_runNo\}.csv' i(V0)
		op
		run
		if i(V0) > 1.3E-5
			echo 'Large current'
*			print i(v.xisource.v1) i(V0)
*			write 'result_op_high_\{$&var_temp\}deg_\{$&mc_runNo\}_\{$&i(v.xisource.v1)\}.raw'
		end
		if i(V0) < 0.7E-5
			echo 'Large current'
*			print i(v.xisource.v1) i(V0)
*			write 'result_op_low_\{$&var_temp\}deg_\{$&mc_runNo\}_\{$&i(v.xisource.v1)\}.raw'
		end
*
*		tran 100n 100u
*		MEAS tran isource AVG i(v.xisource.v1) from=50u to=100u
*		wrdata 'result_tran_\{$&var_temp\}deg_\{$&mc_runNo\}.csv' isource
		run
		let var_temp = var_temp + temp_step
	end
	let  mc_runNo = mc_runNo +1 
	reset
end

.endc 
"}
C {devices/vdd.sym} -730 -530 0 0 {name=l11 lab=VDD}
C {devices/code.sym} 70 -290 0 0 {name=INCLUDE
only_toplevel=true
format="tcleval( @value )"
value="

* .include ../../tia.spice
* .include ../../filter_diff.spice
* .include ../../cmm_sense3.spice

* .include bandgap.spice
.include ../../../low_pvt_source.spice

"}
C {devices/code.sym} 70 -120 0 0 {name=MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice #model#
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice.#model#.red #model#
* .lib /home/simon/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice.tt.red tt
"}
C {devices/vdd.sym} -1030 -200 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} -1030 -160 0 0 {name=VB value=#UB#

}
C {devices/gnd.sym} -1030 -120 0 0 {name=l8 lab=GND}
C {devices/lab_wire.sym} -690 -480 0 1 {name=l12 sig_type=std_logic lab=V_iout_0}
C {devices/vsource.sym} -190 -510 0 0 {name=V0 value=0
*#UB#}
C {devices/gnd.sym} -790 -430 0 0 {name=l1 lab=GND}
C {/home/simon/code/asic/analog/bias/low_pvt_source.sym} -940 -480 0 0 {name=xisource}
C {devices/vdd.sym} -190 -540 0 0 {name=l2 lab=VDD}
C {devices/ngspice_get_value.sym} -400 -510 0 1 {name=r25 node="v(xisource.vm47d)"
descr="v(xisource.vm47d)"}
C {devices/isource.sym} -440 -430 0 0 {name=I0 value=10u}
C {devices/gnd.sym} -680 -320 2 0 {name=l9 lab=GND}
