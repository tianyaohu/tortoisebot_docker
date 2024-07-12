# ROS1 TortoiseBot Docker For Real 🐢bot

## Overview 🌟
Welcome, This repository setsup containerized Docker environment for ROS1 Noetic. Simultaneous launching of SLAM, RVIZ2 etc.
## Installation 🛠️

### Connect to your Raspberry Pi
```bash
#Here -X is to pass display, -C is for compression, aka better frame rate
ssh -X -C tortoisebot@master
```

### Install Docker Compose 2🐳

```
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```
### Setupdocker 
```
sudo usermod -aG docker $USER
newgrp docker
```
### Verify Installation
```
docker --version
docker compose version
```

### Clone Repo
```
#change it to your own workspace
cd PATH_TO_WS
git clone --branch real https://github.com/tianyaohu/tortoisebot_ros1_docker.git 
```

## Build and Run Containers
### If you are comming back remember to use -X and -C
```bash
#Here -X is to pass display, -C is for compression, aka better frame rate
ssh -X -C tortoisebot@master
```
```
cd ./tortoisebot_ros1_docker/
#pull remote images from docker hub (4min~)
docker compose pull
```
Expected Result:
![docker-compose pull](media/real_ros1_docker_pull.gif)

The camera window in RVIZ may not work properly for the first time. Please check/uncheck/add/remove the image topic to see the image to render properly
```
docker-compose up
```
Expected Result:

![docker-compose pull](media/real_ros1_docker_compose_up.gif)

