#!/bin/bash

set -e

source /opt/ros/humble/setup.bash

echo "Provided arguments: $@"

source /ros2_ws/install/setup.bash

exec ros2 launch rplidar_ros rplidar_a1_launch.py

exec $@