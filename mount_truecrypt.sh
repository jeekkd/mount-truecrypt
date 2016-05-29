#!/usr/bin/env bash

# Written by: https://gitlab.com/u/huuteml
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

control_c() {
	echo "Control-c pressed - Unmounting and closing volume. Good-bye!"
	umount -fv $media_path/
	cryptsetup close $crypt_name
	exit $?
}

trap control_c SIGINT

echo "Opening truecrypt container"
cryptsetup open --type tcrypt "$path_to_container" "$crypt_name"
if [ $? -gt 0 ]; then
	echo "ERROR: Failed to open truecrypt container, exiting."
	exit					
fi

echo "Mounting truecrypt container to $media_path"
mount -w /dev/mapper/"$crypt_name" "$media_path"

if [ $? -gt 0 ]; then
	echo "$media_path must not have previously existed, creating now and retrying."
	mkdir "$media_path"
	mount -w /dev/mapper/"$crypt_name" "$media_path"				
fi

echo
for (( ; ; )); do
	echo
	echo "Are you ready to close the volume? Press Y when you're done."
	read -r option
	case "$option" in
		[Yy])
			echo "Unmounting and closing volume. Good-bye!"
			umount -fv "$media_path/"
			cryptsetup close "$crypt_name"
			exit
		;;
		[Nn])
			echo "No was selected, not exiting yet."
			break
		;;
		*)
			echo "Make a valid selection from the menu, use Y/N to select Yes or No"
		;;
	esac
done
