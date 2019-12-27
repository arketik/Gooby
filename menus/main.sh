#!/bin/bash

MENU="Main Menu"
source /opt/Gooby/menus/variables.sh

# Menu Options

init(){
	/opt/Gooby/menus/init.sh
}

server(){
	/opt/Gooby/menus/server.sh
}

media(){
	/opt/Gooby/menus/appsmedia.sh
}

download(){
	/opt/Gooby/menus/appsdownload.sh
}

other(){
	/opt/Gooby/menus/appsother.sh
}

misc(){
	/opt/Gooby/menus/misc.sh
}

stats(){
	/opt/Gooby/menus/stats.sh
}

quit(){
	MENUVISIT
	exit
}

# Display menu

COLOUR=${GREEN}

show_menus() {
	MENUSTART
	echo " ${COLOUR}A${STD} - Init Server"
	echo " ${COLOUR}B${STD} - Maintain Server"
	echo " ${COLOUR}C${STD} - Media Applications"
	echo " ${COLOUR}D${STD} - Download Applications"
	echo " ${COLOUR}E${STD} - Other Applications"
	echo " ${COLOUR}F${STD} - Additional Tasks"
	echo " ${COLOUR}G${STD} - Various Statistics"
	echo " ${LRED}Q${STD} - QUIT ${FUNCTION}"
	echo " ${COLOUR}"
	MENUEND
}

# Read Choices

read_options(){
	local CHOICE
	read -n 1 -s -r -p "Choose option: " CHOICE
	case ${CHOICE} in
	  [Aa]) init ;;
		[Bb]) server ;;
		[Cc]) media ;;
		[Dd]) download ;;
		[Ee]) other ;;
		[Ff]) misc ;;
		[Gg]) stats ;;
		[Qq]) quit ;;
		*) echo "${LRED}Please select a valid option${STD}" && sleep 1
	esac
}

MENUFINALIZE
