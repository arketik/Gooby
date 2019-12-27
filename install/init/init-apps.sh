#!/bin/bash

if [ ! -e ${CONFIGS}/Docker/.env ]; then /opt/Gooby/install/server/server-init.sh; fi

source ${CONFIGS}/Docker/.env

RCLONE(){
	TASK=Rclone
	APP=rclone
	APPTYPE=rclone
	source /opt/Gooby/install/apps/install-rclone.sh
}
PLEX(){
	TASK=Plex
	APP=plex
	APPTYPE=app
	APPLOC=20-plex
	OLDLOC=/var/lib/plexmediaserver/
	source /opt/Gooby/install/apps/install-app.sh
}
TAUTULLI(){
	TASK=Tautulli
	APP=tautulli
	APPTYPE=app
	APPLOC=25-tautulli
	OLDLOC=/opt/Tautulli/
	source /opt/Gooby/install/apps/install-app.sh
}
# -----------------------------
SONARR(){
	TASK=Sonarr
	APP=sonarr
	APPTYPE=app
	APPLOC=52-sonarr
	OLDLOC=${USER}/.config/NzbDrone/
	source /opt/Gooby/install/apps/install-app.sh
}
RADARR(){
	TASK=Radarr
	APP=radarr
	APPTYPE=app
	APPLOC=50-radarr
	OLDLOC=${USER}/.config/Radarr/
	source /opt/Gooby/install/apps/install-app.sh
}
JACKETT(){
	TASK=Jackett
	APP=jackett
	APPTYPE=app
	APPLOC=44-jackett
	OLDLOC=/noupgradepathprovided
	source /opt/Gooby/install/apps/install-app.sh
}
# -----------------------------
NETDATA(){
	TASK=Netdata
	APP=netdata
	APPTYPE=app
	APPLOC=02-netdata
	OLDLOC=/noupgradepathprovided
	source /opt/Gooby/install/apps/install-app.sh
}
ORGANIZR(){
	TASK=Organizr
	APP=organizr
	APPTYPE=app
	APPLOC=03-organizr
	OLDLOC=/noupgradepathprovided
	source /opt/Gooby/install/apps/install-app.sh
}
OMBI(){
	TASK=Ombi
	APP=ombi
	APPTYPE=app
	APPLOC=60-ombi
	OLDLOC=/opt/Ombi/
	source /opt/Gooby/install/apps/install-app.sh
}
PORTAINER(){
	TASK=Portainer
	APP=portainer
	APPTYPE=app
	APPLOC=10-portainer
	OLDLOC=/noupgradepathprovided
	source /opt/Gooby/install/apps/install-app.sh
}
# -----------------------------
XTEVE(){
	TASK=Xteve
	APP=xteve
	APPTYPE=app
	APPLOC=21-xteve
	OLDLOC=/noupgradepathprovided
	source /opt/Gooby/install/apps/install-app.sh
}
JDOWNLOADER(){
	TASK=JDownloader
	APP=jdownloader
	APPTYPE=app
	APPLOC=43-jdownloader
	OLDLOC=/noupgradepathprovided
	source /opt/Gooby/install/apps/install-app.sh
}

# Install Rclone
RCLONE
# Install Plex
PLEX
# Install Tautulli
TAUTULLI
# -----------------------------
# Install Sonarr
SONARR
# Install Radarr
RADARR
# Install Jackett
JACKETT
# -----------------------------
# Install Netdata
NETDATA
# Install Organizr
ORGANIZR
# Install Ombi
OMBI
# Install Portainer
PORTAINER
# -----------------------------
# Install Xteve
XTEVE
# Install JDownloader
JDOWNLOADER
