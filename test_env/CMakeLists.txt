cmake_minimum_required(VERSION 3.15)
project(mycpu_test)

set(CMAKE_CXX_STANDARD 17)

set(DUT_DIR ../dut)

if(DEFINED THREAD)
    add_definitions(-DVL_THREADED)
    find_package(Threads)
endif()

if(DEFINED TRACE)
    add_definitions(-DVM_TRACE=1)
endif()


find_package(verilator HINTS $ENV{VERILATOR_ROOT} ${VERILATOR_ROOT})
if (NOT verilator_FOUND)
    message(FATAL_ERROR "Verilator was not found. Either install it, or set the VERILATOR_ROOT environment variable")
endif()

find_library(unicorn unicorn lib)

add_subdirectory(emu)
add_subdirectory(unicorn)

add_executable(mycpu_test main.cpp)
if(DEFINED THREAD)
    target_link_libraries(mycpu_test emu uc_engine ${unicorn} Threads::Threads)
else()
    target_link_libraries(mycpu_test emu uc_engine ${unicorn} )
endif()
