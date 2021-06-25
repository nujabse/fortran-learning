##############################################################################################
# CMAKE Configurations for UppASD
# (C) Anders Bergman 2019
#
# Acknowledgements:
# https://github.com/SethMMorton/cmake_fortran_template  (for starting template)
# https://github.com/openmeeg/findmkl_cmake/blob/master/cmake/FindMKL.cmake (for FindMKL)
# https://github.com/libigl/eigen/blob/master/cmake/FindFFTW.cmake (for FindFFTW)
#
##############################################################################################

##############################################################################################
# Define the project and the depencies that it has
##############################################################################################
CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12)
PROJECT(Learning Fortran)
# Set the project version
SET(VERSION 0.1)
##############################################################################################



##############################################################################################
# Add our local modlues to the module path
##############################################################################################
SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/")
##############################################################################################


##############################################################################################
# Uncomment if it is required that Fortran 90 is supported
##############################################################################################
IF(NOT CMAKE_Fortran_COMPILER_SUPPORTS_F90)
    MESSAGE(FATAL_ERROR "Fortran compiler does not support F90")
ENDIF(NOT CMAKE_Fortran_COMPILER_SUPPORTS_F90)
##############################################################################################


##############################################################################################
# Macro used to add sources one-by-one
##############################################################################################
macro (add_sources)
    file (RELATIVE_PATH _relPath "${PROJECT_SOURCE_DIR}/source" "${CMAKE_CURRENT_SOURCE_DIR}")
    foreach (_src ${ARGN})
        if (_relPath)
            list (APPEND SRCS "${_relPath}/${_src}")
        else()
            list (APPEND SRCS "${_src}")
        endif()
    endforeach()
    if (_relPath)
        # propagate SRCS to parent directory
        set (SRCS ${SRCS} PARENT_SCOPE)
    endif()
    #message(STATUS "${SRCS}")
endmacro()
#############################################################################################




##############################################################################################
# Defines that the sources and following CMakeLists.txt are indeed in the source dir
##############################################################################################
#add_subdirectory(${SRC} ${BIN})
SET(SRC ${CMAKE_SOURCE_DIR}/source)
add_subdirectory(${SRC})
##############################################################################################


##############################################################################################
# Add a distclean target to the Makefile
##############################################################################################
ADD_CUSTOM_TARGET(distclean
        COMMAND ${CMAKE_COMMAND} -P ${CMAKE_SOURCE_DIR}/distclean.cmake
        )
##############################################################################################


##############################################################################################
# Print ALL variables (only for testing)
##############################################################################################
#get_cmake_property(_variableNames VARIABLES)
#list (SORT _variableNames)
#foreach (_variableName ${_variableNames})
#    message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()
##############################################################################################

