#!/bin/sh

NETGEN_CFG=/usr/local/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl



cd tia
# PASS after flattening and using magic 8.3.270
# netgen -batch lvs ../../xschem/tia/tia_rgc_core.spice tia_core_flat.spice $NETGEN_CFG
# FAILS (Magic bug)
# netgen -batch lvs ../../xschem/tia/tia_rgc_core.spice tia_core.spice $NETGEN_CFG
cd ..
cd esd
# OK
# netgen -batch lvs ../../xschem/esd/esd_diodes.spice esd-array.spice $NETGEN_CFG
cd ..
cd currm
# OK
#netgen -batch lvs ../../xschem/bias/current_mirror_channel.spice cmirror_channel.spice $NETGEN_CFG
#mv comp.out comp_channel.out
# OK
#netgen -batch lvs ../../xschem/bias/current_mirrorx8.spice eigth_mirror.spice $NETGEN_CFG
#mv comp.out comp_cmirror_eight.out
cd ..
cd isource
# PASS after flattening and using magic 8.3.270
#netgen -batch lvs ../../xschem/bias/low_pvt_source.spice isource_flat.spice $NETGEN_CFG
# FAILS using 8.3.276 (Magic bug). 
#netgen -batch lvs ../../xschem/bias/low_pvt_source.spice isource.spice $NETGEN_CFG
cd ..
cd outd
# netgen -batch lvs ../../xschem/outdriver/outdriver.spice outd.spice $NETGEN_CFG
# PASS after flattening and using magic 8.3.270
#netgen -batch lvs ../../xschem/outdriver/outdriver.spice outd_flat.spice $NETGEN_CFG
cd ..
netgen -batch lvs ../xschem/mpw5_submission.spice mpw5_submission_flat.spice $NETGEN_CFG
mv comp.out comp_mpw5_submission.out
netgen -batch lvs ../xschem/user_analog_project_wrapper.spice user_analog_project_wrapper_flat.spice $NETGEN_CFG
mv comp.out comp_wrapper.out

