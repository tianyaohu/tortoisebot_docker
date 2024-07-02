#!/bin/bash

# Source ROS setup
source /opt/ros/noetic/setup.bash
source /root/catkin_ws/devel/setup.bash

# Ensure SLOT_ROSBRIDGE_PORT is set
if [ -z "$SLOT_ROSBRIDGE_PORT" ]; then
  echo "SLOT_ROSBRIDGE_PORT is not set. Using default port 20001."
  SLOT_ROSBRIDGE_PORT=20001
fi

#start ros web components
roslaunch web_components_launching docker_web_components.launch &

# Give ros web components some time to start
sleep 5

# Change to the ros directory
cd /webpage_ws

# Start the Python HTTP server in the foreground
# cd /path/to/your/webapp  # Make sure to change this to the directory containing your webapp
python -m SimpleHTTPServer 7000