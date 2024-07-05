# ROS1 TortoiseBot Docker 🐢

## Overview 🌟
Welcome, This repository setsup containerized Docker environment for ROS1 Noetic. Simultaneous launching of Simulation, SLAM, Action Server, and my personal web application.

## Installation 🛠️

### Install Docker 🐳
```
sudo apt-get update
sudo apt-get install docker.io docker-compose -y
sudo service docker start
```
To use Docker without sudo:
```
sudo usermod -aG docker $USER
newgrp docker
```

### Clone Repo
In Terminal #1
```
#change it to your own workspace
cd ~/simulation_ws/src
git clone https://github.com/tianyaohu/tortoisebot_docker.git 
```

## Build and Run Containers
In Terminal #1
```
cd ./tortoisebot_ros1_docker/
#pull remote images from docker hub (4min~)
docker-compose pull
```
Expected Result:
![docker-compose pull](media/docker-compose-pull.gif)

In Terminal #1
```
docker-compose up
```
Expected Result:

## Open Web Application
retrieve webpage address and bridge address
In Terminal #2
```
webpage_address
```
```
rosbridge_address
```
Expected Result:
![docker-compose pull](media/docker-compose-up_webapp.gif)

