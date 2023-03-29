#ifndef UC_ENGINE_H
#define UC_ENGINE_H

#include <unicorn/unicorn.h>
#include <fstream>
#include <iostream>
#include "../utils/common.h"
#include "../decode/decode.h"

// memory address where emulation starts
#define ADDRESS 0x00000
// TODO: section address
#define TEXT_ADDRESS 0x0
#define DATA_ADDRESS 0x1000

#define IMAGE_PATH "/home/cyril/workspace/riscv/mycpu/test_env/tests/rv32i/build"
#define IMAGE "or.bin"

// some specifiy instructions
#define MRET 0x30200073

typedef uint32_t xlen_t;
typedef uint32_t ilen_t;

typedef struct {
    xlen_t *int_reg_vals;
    xlen_t *engine_pc;
} hook_user_data_t;

typedef enum {
    CMP_OK = 0,
    CMP_ERR_PC = 1 << 0,
    CMP_ERR_INT_REG = 1 << 1,
    CMP_ERR_INST = 1 << 2
}cmp_err_t;

class UcEngine {
    public:
        uint64_t engine_cycles = 0; 

        UcEngine();
        ~UcEngine();
        void reset();
        void step();
        bool is_terminate() { return stop; };
        void update_next_pc() { engine_pc = engine_next_pc; };
        uint32_t update_dut_csr();
        void load_image(std::string image);
        cmp_err_t compare_int_reg(xlen_t *regs);
        cmp_err_t compare_pc(xlen_t pc_in);
        cmp_err_t compare_inst(ilen_t inst);

    private:
        uc_engine *uc;
        uc_hook trace_inst;

        bool stop = false;
        bool verbose = false;
        // bool verbose = true;

        std::string image_name;
        uint8_t *image_buffer;
        uint64_t image_size;

        // cpu state
        xlen_t return_val = 0;
        xlen_t engine_pc = ADDRESS;
        xlen_t engine_next_pc = ADDRESS + 4;
        ilen_t engine_inst;
        xlen_t int_reg_vals[32];
        
        hook_user_data_t *hook_user_data;   
        
        void get_int_regs(void);
};


#endif // UC_ENGINE_H