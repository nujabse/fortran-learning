cmake_minimum_required(VERSION 3.19)
project(fortran_learning Fortran)
enable_language (Fortran)
# FFLAGS depend on the compiler
get_filename_component (Fortran_COMPILER_NAME ${CMAKE_Fortran_COMPILER} NAME)

if (Fortran_COMPILER_NAME MATCHES "gfortran.*")
    # gfortran
    set (CMAKE_Fortran_FLAGS_RELEASE "-funroll-all-loops -fno-f2c -O3")
    # Important: check bounds in debug mode (maybe slow in releases)
    set (CMAKE_Fortran_FLAGS_DEBUG   "-fcheck=bounds")
elseif (Fortran_COMPILER_NAME MATCHES "ifort.*")
    # ifort (untested)
    set (CMAKE_Fortran_FLAGS_RELEASE "-f77rtl -O3")
    set (CMAKE_Fortran_FLAGS_DEBUG   "-f77rtl -O0 -g -v")
endif (Fortran_COMPILER_NAME MATCHES "gfortran.*")


enable_language(Fortran)
add_executable(test_calc_hypotenuse test_calc_hypotenuse.f90)
