
FROM ros1_firmware:latest

# Minimal setup
RUN apt-get update \
 && apt-get install -y ros-noetic-gmapping\
 ros-noetic-rviz \
&& rm -rf /var/lib/apt/lists/*

# Set the working folder at startup
WORKDIR /root/catkin_ws