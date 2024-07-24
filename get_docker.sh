#!/bin/bash

# Function to ensure no broken or held packages
fix_held_packages() {
    sudo dpkg --configure -a
    sudo apt-get install -f
}

# Step 1: Remove all current Docker packages
sudo apt-get purge -y docker docker-engine docker.io containerd runc

# Step 2: Ensure no package is broken or held
fix_held_packages

# Step 3: Update package list
sudo apt-get update

# Step 4: Install Docker and Docker Compose
sudo apt-get install -y docker.io docker-compose

# Step 5: Start Docker service
sudo service docker start

# Step 6: Add the current user to the 'docker' group
sudo usermod -aG docker $USER

# Step 7: Initiate a new shell session with 'docker' as the primary group
newgrp docker

# Confirmation message
echo "Docker and Docker Compose have been installed and configured."