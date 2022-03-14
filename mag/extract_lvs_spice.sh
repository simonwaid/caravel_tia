#!/bin/sh

EXTRACT_SPICE="extract all; ext2spice hierarchy off; ext2spice scale off; ext2spice cthresh infinite; ext2spice"
#; quit -noprompt"

cd tia
echo $EXTRACT_SPICE | magic -dnull -noconsole tia_core.mag
cd ..
cd esd
echo $EXTRACT_SPICE | magic -dnull -noconsole esd-array.mag
cd ..
cd currm
echo $EXTRACT_SPICE | magic -dnull -noconsole cmirror_channel.mag
echo $EXTRACT_SPICE | magic -dnull -noconsole eigth_mirror.mag
cd ..
cd isource
echo $EXTRACT_SPICE | magic -dnull -noconsole isource.mag
cd ..
cd outd
echo $EXTRACT_SPICE | magic -dnull -noconsole outd.mag 
cd ..

