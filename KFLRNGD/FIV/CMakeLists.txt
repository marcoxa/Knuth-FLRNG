### -*- Mode: CMake -*-

### KFLRNGD Fortran IV CMakeLists.txt file.

cmake_minimum_required(VERSION 3.15)

project(KFLRNGD-FIV VERSION 0.9 LANGUAGES Fortran)

add_executable(kflrngd-main kflrngd-main.f)
add_executable(kflrngd-nrandom kflrngd-nrandom.f)

add_library(kflrngd-fIV knuth-frngdb-IV.f kflrngd-rngnxt.f rnaprt.f)

target_link_libraries(kflrngd-main PUBLIC kflrngd-fIV)
target_link_libraries(kflrngd-nrandom PUBLIC kflrngd-fIV)


### end of file -- CMakeLists.txt
