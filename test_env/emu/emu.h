
#ifndef EMU_H
#define EMU_H


// #include "VCore.h"
#include "Vtop_tb.h"
#include "verilated.h"
#if VM_TRACE == 1
#include "verilated_vcd_c.h"
#include "verilated_fst_c.h"
#endif
#include "../utils/common.h"
#include "../unicorn/uc_engine.h"
#include "../utils/json.hpp"

#define CONFIG_FILE_PATH "/home/cyril/workspace/riscv/mycpu/test_env/tests/test_case_cfg.json"

class Emu {
    public:
        Emu(int argc, char **argv);;
        ~Emu();
        inline void pos_edge();
        inline void neg_edge();
        inline void step();
        inline void step(uint64_t n);
        inline void reset(uint64_t n);   
        inline void update_cycles(uint64_t inc);
        void reset_sys(uint64_t n);
        void execute(uint64_t nr_cycles);
    
    private:
        // VCore *dut_ptr;
        Vtop_tb *dut_ptr;
        // VerilatedVcdC *tfp;
        VerilatedFstC *tfp;
        UcEngine *engine;

        uint64_t seed = 0, wave_begin = 0, wave_end = -1;
        bool enable_wave = false;
        bool step_check_pc = true;
        bool step_check_inst = true;
        bool step_check_int_reg = true;
        bool run_dut = true;

        inline char* cycle_wavefile(uint64_t cycles, time_t t);
};

inline void Emu::reset(uint64_t n) {
    for (uint64_t i = 0; i < n; i++) {
        dut_ptr->reset = 1;
        dut_ptr->clock = 0;
        dut_ptr->eval();
        dut_ptr->clock = 1;
        dut_ptr->eval();
    }
    printf("reset is done!\n");
    fflush(stdout);
    dut_ptr->reset = 0;
}

inline void Emu::neg_edge() {
    // dut_ptr->eval();
    // dut_ptr->clock = 0;
    // dut_ptr->eval();

    // posedge
    dut_ptr->eval();
    dut_ptr->clock = 1;
    dut_ptr->eval();
#if VM_TRACE == 1
    if (this->enable_wave && cycles >= this->wave_begin && cycles <= this->wave_end) {
        this->tfp->dump((vluint64_t)cycles * 2);
        // this->tfp->dump((vluint64_t)cycles);
    }
#endif
}

inline void Emu::pos_edge() {
    // dut_ptr->clock = 1;
    // dut_ptr->eval();

    // negedeg
    dut_ptr->clock = 0;
    dut_ptr->eval();
#if VM_TRACE == 1
    if (this->enable_wave && cycles >= this->wave_begin && cycles <= this->wave_end) {
        this->tfp->dump((vluint64_t)cycles * 2 + 1);
        // this->tfp->dump((vluint64_t)cycles + 1);
    }
#endif
}

inline void Emu::step() {
    neg_edge();
    pos_edge();
}

inline void Emu::step(uint64_t n){
    uint64_t times = n;
    while(n--) {
        this->step();
    }
}

inline char *Emu::cycle_wavefile(uint64_t cycles, time_t t) {
    static char buf[1024];
    char buf_time[64];
    strftime(buf_time, sizeof(buf_time), "%F@%T", localtime(&t));
    char *pwd = getcwd(NULL, 0);
    m_assert(pwd != NULL, "Wavefile cannot be opened!");
    int len = snprintf(buf, 1024, "%s/%s_%lu", pwd, buf_time, cycles);
    // strcpy(buf + len, ".vcd");
    strcpy(buf + len, ".fst");
    printf("dump wave to %s...\n", buf);
    return buf;
}

inline void Emu::update_cycles(uint64_t inc) {
    cycles += inc;
    if (cycles % 100000 == 0) {
        printf("%lu cycles have passed!\n", cycles);
    }
}

#endif
