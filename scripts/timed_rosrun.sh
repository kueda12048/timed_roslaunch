#!/bin/bash          

# BSD 3-Clause License
# https://opensource.org/licenses/BSD-3-Clause
#
# Copyright (c) 2016, Masaru Morita
# All rights reserved.

# --------------------------------------------------------------------
# Script to delay the launch of a roslaunch file
#
# Usage: sh timed_rosrun.sh [number of seconds to delay] [rospkg] [roslaunch file]
# --------------------------------------------------------------------

showHelp() {
    echo 
    echo "This script can delay the launch of a roslaunch file"
    echo "Make sure that the file is executable (chmod +x timed_rosrun.sh)"
    echo 
    echo "Run it from command line:"
    echo 
    echo "Usage: ./script/timed_rosrun.sh [number of seconds to delay] [rospkg] [node_name] [arguments (optional)]"
    echo "Or: rosrun timed_roslaunch timed_rosrun.sh [number of seconds to delay] [rospkg] [node_name] [arguments (optional)]"
    echo "Example: rosrun timed_roslaunch timed_rosrun.sh 2 rviz rviz"
    echo 
    echo "Or run it from another roslaunch file:"
    echo 
    echo '<launch>'
    echo '  <include file="$(find timed_roslaunch)/launch/timed_rosrun.launch">'
    echo '    <arg name="time" value="5" />'
    echo '    <arg name="pkg" value="rviz" />'
    echo '    <arg name="file" value="rviz" />'
    echo '    <arg name="value" value="-d `rospack find rviz`/default.rviz" />'
    echo '  </include>'
    echo '</launch>'
}   

if [ $# -lt 3 -o "$1" = "-h" ]; then
    showHelp
else 
    echo "start wait for $1 seconds"
    sleep $1
    echo "end wait for $1 seconds"

    shift # The sleep time is droped
        echo "now running 'rosrun $@'"
    eval "rosrun $@"
fi
