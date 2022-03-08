v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -730 -530 -730 -520 { lab=VDD}
N -730 -520 -730 -500 { lab=VDD}
N -790 -460 -790 -430 { lab=GND}
N -690 -320 -690 -310 { lab=VDD}
N -690 -250 -690 -240 { lab=GND}
N -690 -480 -550 -480 { lab=V_iout}
N -550 -480 -550 -420 { lab=V_iout}
N -550 -360 -550 -340 { lab=V_iout}
N -790 -500 -730 -500 { lab=VDD}
N -790 -480 -690 -480 { lab=V_iout}
N -550 -570 -550 -540 { lab=VDD}
N -550 -420 -550 -360 { lab=V_iout}
N -670 -450 -600 -450 { lab=V_iout}
N -600 -450 -600 -390 { lab=V_iout}
N -670 -390 -600 -390 { lab=V_iout}
N -600 -390 -550 -390 { lab=V_iout}
C {devices/code.sym} -220 -460 0 0 {name=SPICE
only_toplevel=true
value="
*.options savecurrents
.option warn=1
.control
set wr_vecnames
set wr_singlescale
set hcopydevtype=svg
set ITL1=10000

let min_temp=0
let var_temp = min_temp
let max_temp=100
let temp_step=100

option temp=20
op
write test_low_pvt_source.raw
print var_temp i(v1)
*  i(v.xisource.v1)
run
reset



dowhile var_temp <= max_temp
	option temp=$&var_temp
	op
	* wrdata 'result_\{$&var_temp\}deg.csv' v(V_vout) 
	let var_temp = var_temp + temp_step
	run
	echo 'Result will follow ...'
	print var_temp  i(v1)
	* i(v.xisource.v1)
	if i(v.xisource.v1) > 1e-6
		echo 'Large current'
		write 'result_op_\{$&var_temp\}deg.raw'
	end
	*tran 100n 100u
	*MEAS tran isource AVG i(v.xisource.v1) from=50u to=100u
	reset
end

* reset
* option temp=0
* op 
* run
* print v(v_vout) i(v1)
* let var_vout_0deg=v(v_vout)
* reset
* option temp=100
* op 
* run
* print v(v_vout) i(v1)
* let var_vout_100deg=v(v_vout)

* print var_vout_100deg-var_vout_0deg

* tran 100n 100u
* plot i(v.xisource.v1)
* MEAS tran isource AVG i(v.xisource.v1) from=50u to=100u
* noise i(v1) I0 dec 1000 10 100G
* print all
* wrdata result_noise.csv inoise_total onoise_total
* setplot noise1
* plot onoise_spectrum
* noise i(v1) I0 dec 1000 2MEG 2G
* print all
* wrdata result_noise.csv inoise_total onoise_total
* setplot noise3
* plot onoise_spectrum


.endc 
"}
C {devices/vdd.sym} -730 -530 0 0 {name=l11 lab=VDD}
C {devices/code.sym} -220 -290 0 0 {name=INCLUDE
only_toplevel=true
format="tcleval( @value )"
value="

* .include ../../tia.spice
* .include ../../filter_diff.spice
* .include ../../cmm_sense3.spice

.include low_pvt_source.spice

"}
C {devices/code.sym} -220 -120 0 0 {name=MODELS
only_toplevel=true
format="tcleval( @value )"
value="
* .lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice hl
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice.tt.red tt
* .lib /home/simon/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice.tt.red tt
"}
C {devices/vdd.sym} -690 -320 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} -690 -280 0 0 {name=V2 value=1.8

}
C {devices/gnd.sym} -690 -240 0 0 {name=l8 lab=GND}
C {devices/lab_wire.sym} -550 -430 0 1 {name=l12 sig_type=std_logic lab=V_iout}
C {devices/ngspice_get_value.sym} -550 -390 0 0 {name=r4 node="v(V_iout)"
descr="v(V_iout)"}
C {devices/vsource.sym} -550 -510 0 0 {name=V1 value=0
*#UB#}
C {devices/gnd.sym} -790 -430 0 0 {name=l1 lab=GND}
C {/home/simon/code/asic/analog/bias/low_pvt_source.sym} -940 -480 0 0 {name=xisource}
C {devices/vdd.sym} -550 -570 0 0 {name=l2 lab=VDD}
C {devices/isource.sym} -670 -420 0 0 {name=I0 value=10u}
