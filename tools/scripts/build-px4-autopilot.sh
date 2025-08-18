#!/bin/bash

echo "[INFO] Setting up and building PX4-Autopilot..."

cd "${PROJECT_DIR}/dependencies/PX4-Autopilot"

# Setup PX4 development environment
bash "./Tools/setup/ubuntu.sh" --no-sim-tools

# First build for PX4
make px4_sitl gazebo-classic

echo "[INFO] PX4-Autopilot is ready to use."
