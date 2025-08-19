#!/bin/bash

# Install required apt packages
sudo apt install -y python \
	npm \


# Install node packages
echo "[INFO] Installing node_modules..."
cd $PROJECT_DIR
npm i
