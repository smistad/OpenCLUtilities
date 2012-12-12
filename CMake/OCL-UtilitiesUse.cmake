#------------------------------------------------------------------------------
# External libraries
#------------------------------------------------------------------------------

# OpenCL
set(CMAKE_MODULE_PATH ${OCL-Utilities_SOURCE_DIR})
find_package(OpenCL REQUIRED)

#------------------------------------------------------------------------------
# Where to look for includes and libraries
#------------------------------------------------------------------------------
include_directories( ${OCL-Utilities_INCLUDE_DIRS} ${OpenCL_INCLUDE_DIRS})
link_directories (${OCL-Utilities_LIBRARY_DIRS})

