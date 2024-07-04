FROM nvidia_ros1:latest

ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg-reconfigure locales

# Install Git 
RUN apt-get update && \
    apt-get install -y python python3 git && \
    rm -rf /var/lib/apt/lists/*

# Git clone the tortoisebot into catkin_ws
WORKDIR /root/catkin_ws/src
RUN git clone --branch main https://github.com/tianyaohu/tortoisebot.git

# Build the Catkin workspace and ensure it's sourced
# WORKDIR /catkin_ws
# RUN source /opt/ros/noetic/setup.bash && \
#     cd /catkin_ws && \
#     catkin_make && \
#     echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc