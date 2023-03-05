add_library(emu emu.h emu.cpp)

if(DEFINED TRACE)
    set(ARG_TRACE TRACE)
endif()
if(DEFINED THREAD)
    set(ARG_THREAD ${THREAD})
else()
    set(ARG_THREAD 1)
endif()

# verilate(emu SOURCES "${DUT_DIR}/Core.v" 
#     INCLUDE_DIRS "${DUT_DIR}/"
#     ${ARG_TRACE} THREADS ${ARG_THREAD}
#     VERILATOR_ARGS --no-timing -Wno-TIMESCALEMOD)

verilate(emu SOURCES "${DUT_DIR}/top_tb.v" 
    INCLUDE_DIRS "${DUT_DIR}/" "${DUT_DIR}/rtl"
    ${ARG_TRACE} THREADS ${ARG_THREAD}
    VERILATOR_ARGS --no-timing -Wno-TIMESCALEMOD)