#!/bin/bash

echo "[INFO] Building MAVLink Router..."

cd "${PROJECT_DIR}/dependencies/mavlink-router"

# Install dependencies package for mavlink-router build process
sudo apt install -y git ninja-build pkg-config gcc g++ systemd
sudo pip3 install meson

# Build
meson setup build .
ninja -C build
sudo ninja -C build install

echo "[INFO] MAVLink Router is ready to use."
