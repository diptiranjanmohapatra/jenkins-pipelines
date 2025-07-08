#!/bin/bash

set -e

echo "=== Stopping Jenkins service ==="
sudo systemctl stop jenkins || true
sudo systemctl disable jenkins || true

echo "=== Removing Jenkins packages ==="
sudo apt remove --purge -y jenkins openjdk-17-jdk
sudo apt autoremove -y
sudo apt clean

echo "=== Removing Jenkins directories and configs ==="
sudo rm -rf /var/lib/jenkins
sudo rm -rf /etc/jenkins
sudo rm -rf /var/log/jenkins
sudo rm -rf /usr/share/jenkins

echo "=== Removing Jenkins key and source list ==="
sudo rm -f /etc/apt/sources.list.d/jenkins.list
sudo rm -f /usr/share/keyrings/jenkins-keyring.asc

echo "=== Updating package index ==="
sudo apt update -y

echo "✅ Jenkins and related components have been completely removed."
