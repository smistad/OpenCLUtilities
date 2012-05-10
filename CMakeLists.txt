cmake_minimum_required(VERSION 2.8)
project( OCL-Utilities )

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR})
find_package(OpenCL REQUIRED)
message("using ${OPENCL_INCLUDE_DIR}")
include_directories(${OPENCL_INCLUDE_DIR})
set(OPENCL_INCLUDE_DIRS ${OPENCL_INCLUDE_DIR} PARENT_SCOPE)

add_library (OCL-Utilities openCLUtilities.cpp openCLGLUtilities.cpp )
target_link_libraries(OCL-Utilities ${OPENCL_LIBRARIES})
