#!/bin/bash

MENU="Init Server"
source /opt/Gooby/menus/variables.sh

# Menu Options

APPS(){
	PERFORM="apps"
	TASK="init"
	source /opt/Gooby/install/init/${TASK}-${PERFORM}.sh
}

QUIT(){
	exit
}

# Display menu

COLOUR=${YELLOW}

show_menus() {
	MENUSTART
	echo " ${COLOUR}A${STD} - Install All Applications"
	echo " ${WHITE}Z${STD} - EXIT to Main Menu"
	echo " ${COLOUR}"
	MENUEND
}

# Read Choices

read_options(){
	local CHOICE
	read -n 1 -s -r -p "Choose option: " CHOICE
	case ${CHOICE} in
		[Aa]) APPS ;;
		[Zz]) QUIT ;;
		*) echo "${LRED}Please select a valid option${STD}" && sleep 1
	esac
}

MENUFINALIZE
