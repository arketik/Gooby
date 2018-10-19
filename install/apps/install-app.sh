#!/bin/bash

docker ps -q -f name=$APP > $CONFIGS/.config/checkapp.txt
clear

if [ -s /tmp/checkapp.txt ]; then

	ALREADYINSTALLED

else

	EXPLAINAPP

	CONFIRMATION

	if [[ ${REPLY} =~ ^[Yy]$ ]]; then

		GOAHEAD

		echo ""
		echo "Please choose what version you want to install:"
		echo ""
		$ [ echo "$TASK Stable (S) - default"
		$ [ -f "/opt/GooPlex/scripts/components/$APPLOC-beta.yaml" ] && echo "$TASK Beta (B)"
		$ [ -f "/opt/GooPlex/scripts/components/$APPLOC-cf.yaml" ] && echo "$TASK Stable with CloudFlare (C)"
		$ [ -f "/opt/GooPlex/scripts/components/$APPLOC-beta-cf.yaml" ] && echo "$ Beta with CloudFlare (Q)"
		echo ""
		echo "(When in doubt, choose Stable or just hit Enter)"
		read -n 1 -s -r -p " ---> "
		
		case "$REPLY" in
			s|S ) APPLOC=$APPLOC ;;
			b|B ) $ [ -f "/opt/GooPlex/scripts/components/$APPLOC-beta.yaml" ] && APPLOC=$APPLOC-beta ;;
			c|C ) $ [ -f "/opt/GooPlex/scripts/components/$APPLOC-cf.yaml" ] && APPLOC=$APPLOC-cf ;;
			q|Q ) $ [ -f "/opt/GooPlex/scripts/components/$APPLOC-beta-cf.yaml" ] && APPLOC=$APPLOC-beta-cf ;;
			* ) APPLOC=$APPLOC ;;
		esac

		cd $CONFIGS/Docker
		sudo rsync -a /opt/GooPlex/scripts/components/$APPLOC.yaml $CONFIGS/Docker/components
		/usr/local/bin/docker-compose down
		echo "Just a moment while $APP is being installed..."
		source /opt/GooPlex/install/misc/environment-build.sh rebuild
		/usr/local/bin/docker-compose up -d --remove-orphans ${@:2}
		sudo chown -R $USER:$USER $CONFIGS/$TASK
		cd "${CURDIR}"

		APPINSTALLED

		TASKCOMPLETE

	else

		CANCELTHIS

	fi

fi

rm $CONFIGS/.config/checkapp.txt
PAUSE