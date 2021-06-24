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
add_executable(fortran_learning main.f90)
add_executable(sqrt_root square_roots.f90)
add_executable(sqrt_root_2 square_2.f90)
add_executable(bounds bounds.f90)
add_executable(add_arrays add_arrays.f90)
add_executable(array_io array_io.f90)
