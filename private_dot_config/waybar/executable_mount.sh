#!/usr/bin/bash

if lsblk | grep $1 > /dev/null; then
	echo $2
else
	echo $3
fi
