#!/bin/bash

# Install required apt packages
sudo apt install python

# Install node packages
echo "[INFO] Installing node_modules..."
cd $PROJECT_DIR
npm i
