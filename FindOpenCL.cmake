# - Try to find OpenCL
# Once done this will define
#  
#  OPENCL_FOUND        - system has OpenCL
#  OPENCL_INCLUDE_DIR  - the OpenCL include directory
#  OPENCL_LIBRARIES    - link these to use OpenCL
#
# WIN32 should work, but is untested

IF (WIN32)

    FIND_PATH(OPENCL_INCLUDE_DIR CL/cl.h PATHS "C:/Program Files (x86)/AMD APP/include")
    # Assuming 32 bit here
    FIND_LIBRARY(OPENCL_LIBRARIES OpenCL "C:/Program Files (x86)/AMD APP/lib/x86")

ELSE (WIN32)
IF(APPLE)
        FIND_LIBRARY(OPENCL_LIBRARIES OpenCL DOC "OpenCL lib for OSX")
        FIND_PATH(OPENCL_INCLUDE_DIR OpenCL/cl.h DOC "Include for OpenCL on OSX")
ELSE(APPLE)

    # Unix style platforms

    FIND_PATH(OPENCL_INCLUDE_DIR CL/cl.h PATHS /usr/local/cuda/include )
    FIND_PATH(OPENCL_INCLUDE_DIR CL/cl.h PATHS $ENV{AMDAPPSDKROOT}/include )

    FIND_LIBRARY(OPENCL_LIBRARIES OpenCL /usr/local/cuda/lib)
    # Assuming 64 bit here
    FIND_LIBRARY(OPENCL_LIBRARIES OpenCL $ENV{AMDAPPSDKROOT}/lib/x86_64)
    message("opencl_libraries: ${OPENCL_LIBRARIES}")
ENDIF(APPLE)
ENDIF (WIN32)

SET( OPENCL_FOUND "NO" )
IF(OPENCL_LIBRARIES )
    SET( OPENCL_FOUND "YES" )
ENDIF(OPENCL_LIBRARIES)

MARK_AS_ADVANCED(
  OPENCL_INCLUDE_DIR
)
