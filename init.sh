#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2020 Chua Hou
#
# Installs everything for the first time.

set -e

# check invoked from kiwami directory
[ $(dirname $0) = "." ]

# log files
readonly LOG_FILE="./init.log"
readonly ERR_FILE="./init.err"
touch $LOG_FILE
touch $ERR_FILE
exec 1> >(tee -a "$LOG_FILE")
exec 2> >(tee -a "$ERR_FILE")

# use Windows clock system
timedatectl set-local-rtc 1 --adjust-system-clock

# add self to hardware groups
sudo usermod -a -G video $USER   # backlight control
sudo usermod -a -G lpadmin $USER # printer administration

# update and upgrade apt packages
if [ ! -f init.stage.apt ]; then
	sudo apt-get update
	sudo apt-get upgrade -y
	touch init.stage.apt
fi

# install prerequisite packages
if [ ! -f init.stage.prereq ]; then
	sudo apt-get install ./prereq/*.deb -y
	touch init.stage.prereq
fi

# install kiwami debian packages
make -C debian

# rcup rcfiles
if [ ! -f init.stage.rcm ]; then
	cp rcfiles/rcrc $HOME/.rcrc
	rcup -i
	touch init.stage.rcm
fi

# rename userdirs
del_userdir () {
	if [ -d $1 ]; then
		read -p "Remove directory $1? [yn] " yn
		case $yn in
			[Yy]) rm -rf $1 ;;
			*) echo "Skipping $1" ;;
		esac
	fi
}
if [ ! -f init.stage.userdirs ]; then
	for i in Desktop Downloads Templates Public Documents Music Pictures Videos
	do
		del_userdir $HOME/$i
	done
	mkdir -p $(sed -n 's/^.*="$HOME\/\(.*\)"$/\1/p' ~/.config/user-dirs.dirs \
		| uniq | xargs printf "$HOME/%s ")
	touch init.stage.userdirs
fi

# run scripts in init.d/
if [ ! -f init.stage.init.d ]; then
	for script in init.d/*.sh; do
		$script
	done
	touch init.stage.init.d
fi

# enable ly and ufw
sudo systemctl enable ly
sudo ufw enable

# delete stage files
rm init.stage.*
