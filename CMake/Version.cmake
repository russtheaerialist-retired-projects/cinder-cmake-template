if(EXISTS ${CMAKE_SOURCE_DIR}/.git)
    FIND_PACKAGE(Git)
    if(GIT_FOUND)
        EXECUTE_PROCESS(
            COMMAND ${GIT_EXECUTABLE} rev-parse --short HEAD
            WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
            OUTPUT_VARIABLE "project_BUILD_VERSION"
            ERROR_QUIET
            OUTPUT_STRIP_TRAILING_WHITESPACE
        )
        MESSAGE(STATUS "Git Version: ${project_BUILD_VERSION}")
    endif()
endif()

function(SetProjectVersion VERSION_MAJOR VERSION_MINOR VERSION_PATCH)
    set(project_MAJOR_VERSION ${VERSION_MAJOR})
    set(project_MINOR_VERSION ${VERSION_MINOR})
    set(project_PATCH_VERSION ${VERSION_PATCH})
    if(DEFINED project_BUILD_VERSION)
        set(project_VERSION
            ${project_MAJOR_VERSION}.${project_MINOR_VERSION}.${project_PATCH_VERSION}-${project_BUILD_VERSION})
    else()
        set(project_VERSION
            ${project_MAJOR_VERSION}.${project_MINOR_VERSION}.${project_PATCH_VERSION})
    endif()

    CONFIGURE_FILE(${CMAKE_SOURCE_DIR}/version.h.in ${CMAKE_CURRENT_BINARY_DIR}/bin/version.h @ONLY)
    message(STATUS "${PROJECT_NAME} v${project_VERSION}")
endfunction()
