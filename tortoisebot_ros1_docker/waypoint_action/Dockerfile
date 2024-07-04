FROM nvidia_ros1:latest

# Minimal setup
RUN sudo ln -s /usr/bin/python3 /usr/bin/python

# Install Git 
RUN apt-get update && \
    apt-get install -y python python3 git python3-yaml && \
    rm -rf /var/lib/apt/lists/*

# Git clone the tortoisebot into catkin_ws
WORKDIR /root/catkin_ws/src
RUN git clone https://github.com/tianyaohu/course_web_dev_ros.git

#Catkin_make and source workspace
WORKDIR /root/catkin_ws
RUN source /opt/ros/noetic/setup.bash && \
    catkin_make && \
    echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc
