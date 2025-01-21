#!/bin/bash

set -e

source /opt/ros/humble/setup.bash

echo "Provided arguments: $@"

# source /ros2_ws/install/setup.bash

exec ros2 run v4l2_camera v4l2_camera_node __device:=/dev/video0

exec $@