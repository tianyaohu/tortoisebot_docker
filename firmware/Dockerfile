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

# Copy the ros1 workspace into the container
WORKDIR /root/catkin_ws/src
# workspace was temporarily moved into docker dir to facilitate copying
COPY ./ros1_ws/src/tortoisebot/ ./tortoisebot
COPY ./ros1_ws/src/raspicam_node/ ./raspicam_node

# Set the working folder at startup
WORKDIR /root/catkin_ws

# Source the ROS setup file and run catkin_make
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin_make && source /root/catkin_ws/devel/setup.bash"

# Set the entrypoint to source the workspace setup file
ENTRYPOINT ["/bin/bash", "-c", "source /root/catkin_ws/devel/setup.bash && exec \"$@\"", "--"]

# Default command
CMD ["bash"]
