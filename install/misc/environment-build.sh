#!/bin/bash

source /opt/Gooby/menus/variables.sh

ENV=${CONFIGS}/Docker/.env
touch ${ENV}

# Since Docker processes " as part of the paths, we don't actually store it in the variables.  However, BASH does require
#	the " if the string is going to have odd characters.  As a result, we have to load the existing environment line
#	by line and insert the " around the values.

# Load existing variables and use them as defaults, if available

while IFS='' read -r line || [[ -n "${line}" ]]; do
	newline=$(echo ${line} | sed 's/=/&\"/g; s/:$//')\"
	eval ${newline} > /dev/null 2>&1
done < ${ENV}

if [[ ${1,,} != "rebuild" ]]; then
	echo "Creating configuration file..."
fi

cat > ${ENV} << EOF

###########################
#  Environment variables  #
#     for Gooby v${VERSION}    #
###########################

APILOG=${LOGS}/api.log
CF_EMAIL=$(cat ${CONFIGVARS}/cf_email)
CF_KEY=$(cat ${CONFIGVARS}/cf_key)
CONFIGS=/data/Gooby
CONFIGVARS=${CONFIGS}/Docker/.config
CURDIR=$(pwd)
DOWNLOADS=/mnt/google/Downloads
GOOBYBRANCH=$(cat ${CONFIGVARS}/goobybranch)
GOOGLE=/mnt/google
GROUPID=$(id -g)
GROUPNAME=${USER}
HOMEDIR=${HOME}
IP=$(curl ifconfig.me)
LOGS=${HOME}/logs
MEDIA=/mnt/google
ORGMENU=menu
MOUNTTO=/mnt/google
MYDOMAIN=$(cat ${CONFIGVARS}/mydomain)
MYEMAIL=$(cat ${CONFIGVARS}/myemail)
PLEXCLAIM=$(cat ${CONFIGVARS}/plexclaim)
PROXYVERSION=$(cat ${CONFIGVARS}/proxyversion)
RCLONEFOLDER=$(cat ${CONFIGVARS}/rclonefolder)
RCLONEHOME=${HOME}/.config/rclone
RCLONEMOUNT=/mnt/rclone
RCLONEPASSWORD=Go0by
RCLONESERVICE=$(cat ${CONFIGVARS}/rcloneservice)
RCLONEUSERNAME=gooby
SERVER=$(hostname)
SERVERCONFIGS=/mnt/google/Config
TIMEZONE=$(cat /etc/timezone)
UNSYNCED=/mnt/local
UPLOADS=/mnt/uploads
USERID=$(id -u)
USERNAME=${USER}
VERSION=$(cat ${CONFIGVARS}/version)
EOF

cat ${CONFIGS}/Docker/components/??-* > ${CONFIGS}/Docker/docker-compose.yaml
echo done
