FROM nvidia_ros1:latest

# Install Webapp Dependencies
RUN apt-get update && \
    apt-get install -y python python3 git ros-noetic-rosbridge-server ros-noetic-tf2-web-republisher ros-noetic-web-video-server && \
    rm -rf /var/lib/apt/lists/*

# Create catkin_ws workspace
WORKDIR /
RUN mkdir -p catkin_ws/src 

# Git clone the WEBAPP components into catkin_ws
WORKDIR /catkin_ws/src
RUN git clone --recurse-submodules https://github.com/tianyaohu/tortoisebot_ros_web_comonents.git

# Build the Catkin workspace and ensure it's sourced
RUN source /opt/ros/noetic/setup.bash && \
    cd /catkin_ws && \
    catkin_make && \
    echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc

# Create webpage_ws workspace and git clone WEBAPP package
WORKDIR /
RUN mkdir -p webpage_ws/src 
WORKDIR /webpage_ws/src
RUN git clone https://github.com/tianyaohu/tortoisebot_webapp.git

#Set workspace for running http server
WORKDIR /webpage_ws/src/tortoisebot_webapp

# Copy the entrypoint script into the container
COPY start_services.sh /start_services.sh
RUN chmod +x /start_services.sh

# Set the entrypoint to the script
ENTRYPOINT ["/start_services.sh"]
