FROM ros:humble-ros-core

# RUN apt-get update \
#     && apt-get install -y \
#     nano \
#     vim \
#     && rm -rf /var/lib/apt/lists/*

RUN apt update && apt upgrade -y
RUN apt install ros-dev-tools -y

RUN if [ -d "ros2_ws" ]; then rm -rf ros2_ws; fi
ENV ROS2_WS=ros2_ws
RUN mkdir -p ${ROS2_WS}/src

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt update
RUN apt-get install ros-$ROS_DISTRO-foxglove-bridge -y

RUN cd ${ROS2_WS}/src && \
    git clone https://github.com/Chirag-Sharma-04/foxglove.git && \
    sudo apt-get update && \
    . /opt/ros/${ROS_DISTRO}/setup.bash && \
    cd .. && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/* && \
    colcon build --symlink-install

RUN sudo echo ". /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc && \
    sudo echo ". ${ROS2_WS}/install/setup.bash" >> ~/.bashrc

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
CMD ["ros2","launch","foxglove","bridge.launch"]
