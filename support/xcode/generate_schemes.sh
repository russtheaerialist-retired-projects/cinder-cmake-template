#!/bin/sh
#
# This script is used to generate the schemas necessary to run a cinder build on the travis-ci servers
# In order to use this, you will need to check cinder into the support directory so that it's available on the travis-ci servers
#

XCODEPROJ=cinder-cmake-template.xcodeproj
/Applications/Xcode.app/Contents/MacOS/Xcode "$XCODEPROJ" &
XCODE_PID=$!

# now we wait for xcode to build the workspace:
WAIT_FOR_XCODE=0
while test ${WAIT_FOR_XCODE} -lt 6; do
    WAIT_FOR_XCODE=`find "$XCODEPROJ" |wc -l`
    sleep 2
    COUNT=`ps -p ${XCODE_PID} |wc -l`
    if test ${COUNT} -lt 2; then 
        echo "XCode went away unexpectedly!"
        exit -1
    fi
done

#ok, we believe its done. kill it, and wait until its realy dead.
kill ${XCODE_PID}
COUNT=2;
while test ${COUNT} -gt 1; do 
    sleep 1
    COUNT=`ps -p ${XCODE_PID} |wc -l`
done
