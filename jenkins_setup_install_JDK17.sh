#!/bin/bash

set -e

echo "=== Updating packages ==="
sudo apt update -y
sudo apt upgrade -y

echo "=== Installing Java (OpenJDK 17) ==="
sudo apt install -y openjdk-17-jdk

echo "=== Adding Jenkins repository key and repo ==="
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
  sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "=== Installing Jenkins ==="
sudo apt update -y
sudo apt install -y jenkins

echo "=== Starting and enabling Jenkins service ==="
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "=== Jenkins is now running on port 8080 ==="
echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
