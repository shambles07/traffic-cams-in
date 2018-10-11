#!/bin/bash

# This script pulls from IN traffic cameras
# and places them into directories based on
# their assigned IP addresses.
#
# As some of the cameras do not work
# correctly, the list of working cameras
# are listed in file "good-cams.txt"

# First, download the images.

for i in $(cat good-cams.txt); do
	wget ${i}
done

# Create directories based on IP

for y in $(awk -F/ '{ print $5 }' good-cams.txt | awk -F \_ '{ print $2 }' | sort -un); do
	mkdir $(awk -F \_ '{ print $2 }' | sort -un) <<< ${y}
done

# Move the files into the directories

for x in $(find . -type f -iname "*\.jpg"); do
	mv ${x} -t $(echo ${x} | awk -F\_ '{ print $2 }')
done
