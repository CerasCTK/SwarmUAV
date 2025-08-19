#!/bin/bash

# TODO: checking needed install?

echo "[INFO] ROS not found. Installing..."

sudo add-apt-repository -y restricted
sudo add-apt-repository -y universe
sudo add-apt-repository -y multiverse

if [ -e /etc/apt/sources.list.d/ros-latest.list ]; then
	:
else
	# Accept software from packages.ros.org
	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
fi

sudo apt install -y curl

# Setup keys
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update

sudo apt install -y ros-noetic-desktop-full

# Auto setup environment
if ! grep -Eq '^\s*source\s+/opt/ros/noetic/setup\.bash' ~/.bashrc; then
	echo "Adding setup ROS environment..."
	printf "\n# Setup ROS Noetic environment\n source /opt/ros/noetic/setup.bash" >> ~/.bashrc
fi

echo "[INFO] ROS noetic isntallation succesful."
