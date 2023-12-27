### -*- Mode: CMake -*-

### KFLRNGD Fortran 77 CMakeLists.txt file.

cmake_minimum_required(VERSION 3.15)

project(KFLRNGD-F77 VERSION 0.9 LANGUAGES Fortran)

add_executable(kflrngd-main kflrngd-main.f)
add_executable(kflrngd-nrandom kflrngd-nrandom.f)

add_library(kflrngd-f77 knuth-frngdb.f kflrngd-rngnxt.f rnaprt.f)

target_link_libraries(kflrngd-main PUBLIC kflrngd-f77)
target_link_libraries(kflrngd-nrandom PUBLIC kflrngd-f77)

### end of file -- CMakeLists.txt
