#!/bin/bash

# Written by: https://github.com/turkgrb
# Website: https://daulton.ca
# Purpose: Mount truecrypt volumes
# Notes: Run as root as privleged commands such as mount are used

######### VARIABLES #########
#Path to the truecrypt container with the containers name, change accordingly
path_to_container=

#Name for the mounted container used as a label, change accordingly
crypt_name=

#Name and path for the /media mount, don't edit
media_path=/media/$crypt_name/
#############################

echo "Opening truecrypt container"
cryptsetup open --type tcrypt $path_to_container $crypt_name
if [ $? -gt 0 ]; then
	echo "ERROR: Failed to open truecrypt container, exiting."
	exit					
fi

echo "Mounting truecrypt container to $media_path"
mount -w /dev/mapper/$crypt_name $media_path

if [ $? -gt 0 ]; then
	echo "$media_path must not have previously existed, creating now and retrying."
	mkdir $media_path
	mount -w /dev/mapper/$crypt_name $media_path					
fi

echo
echo -n "Are you ready to close the volume? Press Y, when you're done."
read option
case "$option" in
	[Yy])
		umount $media_path
		cryptsetup close $crypt_name
	;;
	*)
		echo "Make a valid selection from the menu, press Y when you're done."
	;;
esac

