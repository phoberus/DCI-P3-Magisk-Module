#!/system/bin/sh

MODDIR=${0%/*}
dci="/sys/devices/virtual/graphics/fb0/DCI_P3"
adobe="/sys/devices/virtual/graphics/fb0/Adobe_RGB"
srgb="/sys/devices/virtual/graphics/fb0/SRGB"
night="/sys/devices/virtual/graphics/fb0/night_mode"
oneplus="/sys/devices/virtual/graphics/fb0/oneplus_mode"

if [ -f "$dci" ]
then
	echo "DCI-P3 is supported"
	#activate DCI-P3
	echo 1 > /sys/devices/virtual/graphics/fb0/DCI_P3
	
	#deactivate all other modes if they exist
	if [ -f "$adobe" ]
	then
		echo "Adobe_RGB file found"
		echo 0 > /sys/devices/virtual/graphics/fb0/Adobe_RGB
		echo "deactivated"
	else
		echo "No need to deactivated Adobe_RGB"
	fi
	
	if [ -f "$srgb" ]
	then
		echo "SRGB file found"
		echo 0 > /sys/devices/virtual/graphics/fb0/SRGB
		echo "deactivated"
	else
		echo "No need to deactivated SRGB"
	fi

	if [ -f "$night" ]
	then
		echo "night_mode file found"
		echo 0 > /sys/devices/virtual/graphics/fb0/night_mode
		echo "deactivated"
	else
		echo "No need to deactivated night_mode"
	fi


	if [ -f "$oneplus" ]
	then
		echo "oneplus_mode file found"
		echo 0 > /sys/devices/virtual/graphics/fb0/oneplus_mode
		echo "deactivated"
	else
		echo "No need to deactivated oneplus_mode"
	fi	
	
	echo "DCI-P3 is activated"
else
	echo "DCI-P3 is not supported. You can delete this module, it changed nothing."
fi
#his script will be executed in late_start service mode
# More info in the main Magisk thread

