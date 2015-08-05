#!/bin/sh
#!/bin/bash

/Applications/Xcode.app/Contents/MacOS/Xcode "celestial.xcodeproj" &
XCODE_PID=$!

# now we wait for xcode to build the workspace:
WAIT_FOR_XCODE=0
while test ${WAIT_FOR_XCODE} -lt 6; do
    WAIT_FOR_XCODE=`find "celestial.xcodeproj" |wc -l`
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
