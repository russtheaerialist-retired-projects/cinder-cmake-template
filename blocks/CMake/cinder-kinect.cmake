
function(use_block_cinder_freenect packageName)

  # Source Files
  list(APPEND SRC_FILES
      ${CMAKE_SOURCE_DIR}/blocks/Cinder-Kinect/src/CinderFreenect.cpp
      ${CMAKE_SOURCE_DIR}/blocks/Cinder-Kinect/src/freenect/cameras.c
      ${CMAKE_SOURCE_DIR}/blocks/Cinder-Kinect/src/freenect/core.c
      ${CMAKE_SOURCE_DIR}/blocks/Cinder-Kinect/src/freenect/registration.c
      ${CMAKE_SOURCE_DIR}/blocks/Cinder-Kinect/src/freenect/tilt.c
      ${CMAKE_SOURCE_DIR}/blocks/Cinder-Kinect/src/freenect/usb_libusb10.c
  )

  # Header Files
  list(APPEND HDR_FILES
      ${CMAKE_SOURCE_DIR}/blocks/Cinder-Kinect/src/CinderFreenect.h
  )

  # Include Files
  
	  include_directories(SYSTEM
	      ${CMAKE_SOURCE_DIR}/blocks/Cinder-Kinect/src/freenect
	  )  
      include_directories(
          ${CMAKE_SOURCE_DIR}/blocks/Cinder-Kinect/src
      )

  
if(APPLE)

# frameworks

FIND_LIBRARY(IOKit_LIBRARY IOKit)
list(APPEND EXTRA_LIBS ${IOKit_LIBRARY})

# static libraries

	
	find_library(libusb_LIBRARY libusb-1.0.a HINTS "blocks/Cinder-Kinect/lib/macosx/libusb-1.0.a")
	LIST(APPEND STATIC_LIBS ${libusb_LIBRARY})

endif()


  set(HDR_FILES ${HDR_FILES} PARENT_SCOPE)
  set(SRC_FILES ${SRC_FILES} PARENT_SCOPE)
  set(EXTRA_LIBS ${EXTRA_LIBS} PARENT_SCOPE)
  set(STATIC_LIBS ${STATIC_LIBS} PARENT_SCOPE)
endfunction(use_block_cinder_freenect)
