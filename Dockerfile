FROM ros:noetic-ros-base

HEALTHCHECK CMD /ros_entrypoint.sh rostopic list || exit 1

RUN apt-get update -y && \
    apt-get install -y ros-$ROS_DISTRO-move-base

WORKDIR /
COPY ./ros.launch /
COPY ./*.yaml /
CMD ["roslaunch", "--wait", "ros.launch"]
