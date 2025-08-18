#!/bin/bash

if command -v conda > /dev/null 2>&1; then
	echo "[OK] conda is available."
	exit 0
fi

echo "[INFO] conda not found. Installing..."

# Install conda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

# Setup conda
source ~/miniconda3/bin/activate
conda init --all
conda config --set auto_activate false

# Accept terms
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

echo "[INFO] conda installation successful."
