FROM ros_test_base:latest

RUN apt update --fix-missing
RUN apt install ros-noetic-dynamixel-sdk -y
RUN apt install ros-noetic-turtlebot3-msgs -y
RUN apt install ros-noetic-turtlebot3 -y

RUN echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
RUN source ~/.bashrc

RUN cd ~/catkin_ws/src && git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; cd ~/catkin_ws; catkin_make'
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
RUN source ~/.bashrc