#!/bin/bash

# Source ROS setup
source /opt/ros/noetic/setup.bash
source /catkin_ws/devel/setup.bash

# Ensure SLOT_ROSBRIDGE_PORT is set
if [ -z "$SLOT_ROSBRIDGE_PORT" ]; then
  echo "SLOT_ROSBRIDGE_PORT is not set. Using default port 20001."
  SLOT_ROSBRIDGE_PORT=20001
fi

#start ros web components
roslaunch web_components_launching docker_web_components.launch &

# Give ros web components some time to start
sleep 5

# Start the Python HTTP server in the foreground
cd /webpage_ws/src/tortoisebot_webapp
python -m SimpleHTTPServer 7000