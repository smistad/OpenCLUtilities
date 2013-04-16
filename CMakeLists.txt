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
# Tell Cmake where the FindOpenCL.cmake file is
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
find_package( OpenCL REQUIRED)
#INCLUDE_DIRECTORIES( ${OPENCL_INCLUDE_DIRS} )

SET(OPENCL_HEADERS
	OpenCL/cl.hpp
)

add_library (OpenCL
	${OPENCL_HEADERS}
)

set_target_properties( OpenCL PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries( OpenCL ${OPENCL_LIBRARIES} )

# OpenGL
###########
find_package(OpenGL REQUIRED)

#------------------------------------------------------------------------------
# Where to look for includes and libraries
#------------------------------------------------------------------------------
include_directories(${OPENCL_INCLUDE_DIR})
include_directories(./OpenCL)

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