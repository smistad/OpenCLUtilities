###########################################################
##          OCL-Utilities project
###########################################################
project( OCL-Utilities )

cmake_minimum_required(VERSION 2.8)

#------------------------------------------------------------------------------
# External libraries
#------------------------------------------------------------------------------

# OpenCL
###########
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR})
find_package(OpenCL REQUIRED)

find_package(OpenGL REQUIRED)

#------------------------------------------------------------------------------
# Where to look for includes and libraries
#------------------------------------------------------------------------------
include_directories(${OPENCL_INCLUDE_DIR})

#------------------------------------------------------------------------------
# Targets
#------------------------------------------------------------------------------

# OCL-Utilities library
###########
set(OCL-Utilities_LINK_LIBRARIES ${OPENCL_LIBRARIES})
if("${CMAKE_SYSTEM}" MATCHES "Linux")
    set(OCL-Utilities_LINK_LIBRARIES ${OCL-Utilities_LINK_LIBRARIES} GL)
endif()

#if("${CMAKE_SYSTEM}" MATCHES "Apple")
    set(OCL-Utilities_LINK_LIBRARIES ${OCL-Utilities_LINK_LIBRARIES} ${OPENGL_LIBRARIES})
#endif()

add_library (OCL-Utilities openCLUtilities.hpp openCLUtilities.cpp openCLGLUtilities.hpp openCLGLUtilities.cpp )
target_link_libraries(OCL-Utilities ${OCL-Utilities_LINK_LIBRARIES})

#------------------------------------------------------------------------------
# Configure file for find_package module 
#------------------------------------------------------------------------------

set( OCL-Utilities_INCLUDE_DIRS
    ${OCL-Utilities_SOURCE_DIR}
    ) 

set(OCL-Utilities_LIBRARY_DIRS
    ${OCL-Utilities_BINARY_DIR}
    )    

configure_file (
    "${PROJECT_SOURCE_DIR}/CMake/OCL-UtilitiesConfig.cmake.in"
    "${PROJECT_BINARY_DIR}/OCL-UtilitiesConfig.cmake"
    )