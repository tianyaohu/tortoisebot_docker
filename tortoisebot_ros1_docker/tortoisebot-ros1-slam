
FROM ros1_gazebo_sim:latest

# Minimal setup
RUN apt-get update \
 && apt-get install -y ros-noetic-gmapping

# Set the working folder at startup
WORKDIR /root/catkin_ws