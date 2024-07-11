FROM ros:noetic-ros-core

# Minimal setup
RUN apt-get update \
 && apt-get install -y locales lsb-release
ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg-reconfigure locales

# Install ROS build tools
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    lsb-release \
    gnupg2 \
    git \
    python3-catkin-tools \
    python3-rosdep \
    python3-pip\
    python3-rpi.gpio\
    ros-noetic-xacro\
    ros-noetic-compressed-image-transport\
    ros-noetic-camera-info-manager\
    ros-noetic-diagnostic-updater\
    ros-noetic-robot-state-publisher\
    ros-noetic-joint-state-publisher\
    ros-noetic-laser-scan-matcher\
    libraspberrypi-bin\
    libraspberrypi-dev

# Initialize rosdep
RUN rosdep init \
 && sudo rosdep fix-permissions \
 && rosdep update\
 && rm -rf /var/lib/apt/lists/*
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# Set the default shell to bash to ensure sourcing works correctly
SHELL ["/bin/bash", "-c"]

# Create a Catkin workspace
RUN source /opt/ros/noetic/setup.bash \
 && mkdir -p /root/catkin_ws/src \
 && cd /root/catkin_ws/src \
 && catkin_init_workspace 

# Set the entrypoint
COPY ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]

# Set the working folder at startup
WORKDIR /root/catkin_ws
