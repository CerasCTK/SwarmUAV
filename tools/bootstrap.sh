#!/bin/bash

################################
##### PROJECT ENVIRONMENTS #####
################################
TOOLS_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)
SCRIPTS_DIR="$TOOLS_DIR/scripts"

export PROJECT_DIR="$(dirname $TOOLS_DIR)"

FLAG_DIR="/var/lib/SwarmUAV"
FLAG_FILE="$FLAG_DIR/prepare_done"


################################
########## PRE-CHECK ###########
################################
if [ -f $FLAG_FILE ]; then
	echo "[INFO] This script only needs to be run once! Please run the `environment.sh` script."
	exit 0
fi

################################
### INSTALL & BUILD SCRIPTS ####
################################
"$SCRIPTS_DIR/install-general-packages.sh"
"$SCRIPTS_DIR/install-miniconda.sh"
"$SCRIPTS_DIR/install-ros-noetic.sh"
"$SCRIPTS_DIR/build-mavlink-router.sh"
"$SCRIPTS_DIR/build-px4-autopilot.sh"

################################
############# FLAG #############
################################
echo "[INFO] Marking prepare environment phase as done."
if [ ! -d $FLAG_DIR ]; then
	sudo mkdir -p $FLAG_DIR
fi

################################
############ REBOOT ############
################################
# Clear stdin buffer
while read -t 0 -n 1; do ;; done

read -n 1 -s -p "[INFO] You MUST to restart your computer before jump to next step. Press any key to reboot..."

echo
echo "Rebooting now..."
sudo reboot
