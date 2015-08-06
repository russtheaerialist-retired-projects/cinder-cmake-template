set(SRC_FILES
    app.cpp
)

set(HDR_FILES
    app.h
)

use_block_cinder_freenect(${PROJECT_NAME})

message(STATUS "${Cinder_INCLUDE_DIR}")
INCLUDE_DIRECTORIES(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${Cinder_INCLUDE_DIR}
)
LINK_DIRECTORIES(
    ${CMAKE_BINARY_DIR}/bin
)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)

add_executable(${PROJECT_NAME}
    MACOSX_BUNDLE
    ${SRC_FILES}
    ${HDR_FILES}
)

set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 11)
target_link_libraries(${PROJECT_NAME}
    ${OpenCV_LIBS}
    ${Cinder_LIBRARIES}
    ${EXTRA_LIBS}
    ${STATIC_LIBS}
    Boost::Boost
)

install(TARGETS ${PROJECT_NAME}
    DESTINATION ${CMAKE_SOURCE_DIR}/dist/${RELEASE_PATH}
)
