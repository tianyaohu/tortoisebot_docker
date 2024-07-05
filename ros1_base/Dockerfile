FROM nvidia/cudagl:11.1.1-base-ubuntu20.04

# Minimal setup
RUN apt-get update \
 && apt-get install -y locales lsb-release build-essential
ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg-reconfigure locales

# Install ROS Noetic
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt-get update \
 && apt-get install -y --no-install-recommends ros-noetic-desktop-full
RUN apt-get install -y --no-install-recommends python3-rosdep
RUN rosdep init \
 && sudo rosdep fix-permissions \
 && rosdep update\
 && rm -rf /var/lib/apt/lists/*
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# Set the default shell to bash to ensure sourcing works correctly
SHELL ["/bin/bash", "-c"]

# Create a Catkin workspace and clone TurtleBot3 repos
RUN source /opt/ros/noetic/setup.bash \
 && mkdir -p /root/catkin_ws/src \
 && cd /root/catkin_ws/src \
 && catkin_init_workspace 

# Build the Catkin workspace and ensure it's sourced
RUN source /opt/ros/noetic/setup.bash \
 && cd /root/catkin_ws \
 && catkin_make
RUN echo "source /root/catkin_ws/devel/setup.bash" >> ~/.bashrc

# Set the working folder at startup
WORKDIR /root/catkin_ws