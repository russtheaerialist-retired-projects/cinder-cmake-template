set(code_SRC
    app.cpp
)

set(code_HEADERS
    app.h
)

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
    ${code_SRC}
    ${code_HEADERS}
)
target_link_libraries(${PROJECT_NAME}
    ${OpenCV_LIBS}
    ${Cinder_LIBRARIES}
    ${EXTRA_LIBS}
    Boost::Boost
)

install(TARGETS ${PROJECT_NAME}
    DESTINATION ${CMAKE_SOURCE_DIR}/dist/${RELEASE_PATH}
)
