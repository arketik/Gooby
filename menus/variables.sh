#!/bin/bash

CONFIGS=/data/Gooby
CONFIGVARS=${CONFIGS}/Docker/.config
CONFIGENV=${CONFIGS}/Docker/.env

# Define colors

BLUE=$(echo -en '\033[00;34m')
CYAN=$(echo -en '\033[00;36m')
GREEN=$(echo -en '\033[00;32m')
LBLUE=$(echo -en '\033[01;34m')
LCYAN=$(echo -en '\033[01;36m')
LGRAY=$(echo -en '\033[00;37m')
LGREEN=$(echo -en '\033[01;32m')
LMAGENTA=$(echo -en '\033[01;35m')
LPURPLE=$(echo -en '\033[01;35m')
LRED=$(echo -en '\033[01;31m')
LYELLOW=$(echo -en '\033[01;33m')
MAGENTA=$(echo -en '\033[00;35m')
PURPLE=$(echo -en '\033[00;35m')
RED=$(echo -en '\033[00;31m')
WHITE=$(echo -en '\033[01;37m')
YELLOW=$(echo -en '\033[00;33m')
STD=$(echo -en '\033[0m')

GOOBY=${LYELLOW}G${LGREEN}O${CYAN}O${BLUE}B${MAGENTA}Y${STD}

# Define choices

MENUSTART(){
	clear
	echo " ${COLOUR}"
	echo "--------------------------------------------------"
	echo " ${GOOBY}${COLOUR} instructions at techperplexed.blogspot.com"
	echo "--------------------------------------------------"
	echo " ${MENU}"
	echo " ${STD}"
}

MENUEND(){
	echo "--------------------------------------------------"
	echo " ${STD}"
}

MENUFINALIZE(){
	trap '' SIGINT SIGQUIT SIGTSTP
	while true
	do
	show_menus
	read_options
	done
}

MENUVISIT(){
	clear
	echo
	echo "--------------------------------------------------"
	echo " Visit the menu any time by typing '${WHITE}gooby${STD}'"
	echo "--------------------------------------------------"
	echo
}

ALREADYINSTALLED(){
	echo "${YELLOW}"
	echo "--------------------------------------------------"
	echo " ${TASK} appears to be installed"
	echo "--------------------------------------------------"
	echo "${STD}"
}

NOTINSTALLED(){
	echo "${YELLOW}"
	echo "--------------------------------------------------"
	echo " ${TASK} is not installed yet"
	echo "--------------------------------------------------"
	echo "${STD}"
}

APPINSTALLED(){
	clear
	echo "${YELLOW}"
	echo "--------------------------------------------------"
	echo " ${TASK} is now installed"
	echo " You can reach it through this URL:"
	echo " ${WHITE}${APP}.${MYDOMAIN}${YELLOW}"
	echo " Don't forget to create an A record with your"
	echo " provider for ${WHITE}${APP}${YELLOW} and point it to"
	echo " your server IP address ${WHITE}${IP}${YELLOW}"
	echo "--------------------------------------------------"
	echo "${STD}"
}

NOAPPUPDATE(){
	echo "${LRED}"
	echo "--------------------------------------------------"
	echo " ${TASK} cannot be updated through this menu"
	echo " You can update it from the web interface itself"
	echo "--------------------------------------------------"
	echo "${STD}"
}

EXPLAINTASK(){
	clear
	echo "${CYAN}"
	echo "--------------------------------------------------"
	echo " This will ${PERFORM} ${TASK}"
	echo "--------------------------------------------------"
	echo "${STD}"
}

EXPLAINAPP(){
	clear
	which rclone > ${CONFIGVARS}/checkapp
	if [ ! -s ${CONFIGVARS}/checkapp ]; then
		echo "${LRED}"
		echo "--------------------------------------------------"
		echo " WARNING! Rclone is not installed yet."
		echo " Please configure that first, otherwise your"
		echo " system will not work as intended."
		echo "--------------------------------------------------"
		echo "${STD}"
	fi
	echo "${CYAN}"
	echo "--------------------------------------------------"
	echo " This will ${PERFORM} ${TASK}"
	echo "--------------------------------------------------"
	echo "${STD}"
}

CONFIRMATION(){
	echo "${YELLOW}"
	echo "--------------------------------------------------"
	echo " Are you sure you want to ${PERFORM} ${TASK} (y/N)? "
	echo "--------------------------------------------------"
	echo "${STD}"
	read -n 1 -s -r -p " ---> "
	echo
}

CONFIRMDELETE(){
	echo "${LRED}"
	echo "--------------------------------------------------"
	echo " DANGER ZONE - EXTREME CAUTION!!!"
	echo " Do you want to delete all user settings as well?"
	echo " This cannot be undone"
	echo " Make sure you have a backup!"
	echo " Delete user settings for ${TASK}? (y/N)?"
	echo "--------------------------------------------------"
	echo "${STD}"
	read -n 1 -s -r -p " ---> "
	echo
}

GOAHEAD(){
	clear
	echo "${LMAGENTA}"
	echo "--------------------------------------------------"
	echo " Starting ${PERFORM} ${TASK}"
	echo "--------------------------------------------------"
	echo "${STD}"
}

TASKCOMPLETE(){
	echo "${LMAGENTA}"
	echo "--------------------------------------------------"
	echo " ${PERFORM} ${TASK} completed"
	echo "--------------------------------------------------"
	echo "${STD}"
}

CANCELTHIS(){
	echo "${YELLOW}"
	echo "--------------------------------------------------"
	echo " Cancelling ${PERFORM} ${TASK}"
	echo "--------------------------------------------------"
	echo "${STD}"
}

PAUSE(){
	echo "${GREEN}"
	echo "--------------------------------------------------"
	echo " All done! Press Enter to return to the menu"
	echo "--------------------------------------------------"
	echo "${STD}"
	read -n 1 -s -r -p " ---> "
	echo
}
