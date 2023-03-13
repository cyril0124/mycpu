#include "uc_engine.h"

static void hook_code(uc_engine *uc, uint64_t address, uint32_t size,
                      void *user_data)
{
    printf(">>> Tracing instruction at 0x%" PRIx64
            ", instruction size = 0x%x\n",
            address, size);
}

std::string get_int_reg_name(int idx) {
    std::string str;
    switch (idx)
    {
        case 0: str = "zero"; break;
        case 1: str = "ra"; break;
        case 2: str = "sp"; break;
        case 3: str = "gp"; break;
        case 4: str = "tp"; break;
        case 5: str = "t0"; break;
        case 6: str = "t1"; break;
        case 7: str = "t2"; break;
        case 8: str = "s0"; break;
        case 9: str = "s1"; break;
        case 10: str = "a0"; break;
        case 11: str = "a1"; break;
        case 12: str = "a2"; break;
        case 13: str = "a3"; break;
        case 14: str = "a4"; break;
        case 15: str = "a5"; break;
        case 16: str = "a6"; break;
        case 17: str = "a7"; break;
        case 18: str = "s2"; break;
        case 19: str = "s3"; break;
        case 20: str = "s4"; break;
        case 21: str = "s5"; break;
        case 22: str = "s6"; break;
        case 23: str = "s7"; break;
        case 24: str = "s8"; break;
        case 25: str = "s9"; break;
        case 26: str = "s10"; break;
        case 27: str = "s11"; break;
        case 28: str = "t3"; break;
        case 29: str = "t4"; break;
        case 30: str = "t5"; break;
        case 31: str = "t6"; break;
        default: str = "err"; break;
    }
    return str;
}

UcEngine::UcEngine() {
    uc_err err;
    
    err = uc_open(UC_ARCH_RISCV, UC_MODE_RISCV32, &uc);
    if (err) {
        printf("Failed on uc_open() with error returned: %u (%s)\n", err,
                uc_strerror(err));
        return;
    }

    // auto image_src = std::string(IMAGE_PATH) + "/" + std::string(IMAGE);
    // load_image(image_src);

    if(verbose) {
        // hook_user_data = new hook_user_data_t;
        // hook_user_data->engine_pc = &engine_pc;
        // hook_user_data->int_reg_vals = int_reg_vals;

        // uc_hook_add(uc, &trace_inst, UC_HOOK_CODE, (void *)hook_code, this->hook_user_data, 1, 0);
        uc_hook_add(uc, &trace_inst, UC_HOOK_CODE, (void *)hook_code, NULL, 1, 0);
    }

    // initialize pc
    uc_reg_write(uc, UC_RISCV_REG_PC, &engine_pc);
}


UcEngine::~UcEngine() {
    uc_close(uc);
    delete[] image_buffer;
    delete hook_user_data;
}

void UcEngine::step() {
    uc_err err = UC_ERR_OK;

    // uint8_t bytes[10];
    // uc_mem_read(uc, 0x2000, bytes, 3);

    engine_inst = image_buffer[engine_pc+3] << 24 | image_buffer[engine_pc+2] << 16 | \
                image_buffer[engine_pc+1] << 8 | image_buffer[engine_pc];

    bool is_mret = false;
    if(engine_inst == MRET) {
        is_mret = true;
        uc_reg_read(uc, UC_RISCV_REG_MEPC, &engine_next_pc); // mret will load mepc into pc
        printf("Tracing Instruction at %x => MRET\n", engine_pc);
    } else {
        err = uc_emu_start(uc, engine_pc, image_size, 0, 1); // emulate 1 instruction
    }

    get_int_regs();

    if(verbose)
        printf("inst: 0x%08x at pc: 0x%08x\n\n", engine_inst, engine_pc);

    // xlen_t mepc = 0;
    // uc_reg_read(uc, UC_RISCV_REG_MEPC,&mepc);
    // printf("mepc = 0x%0x\n", mepc);
    
    if (err) {
        if(err == UC_ERR_EXCEPTION) {
            xlen_t mcause = 0;
            xlen_t mepc = 0;
            err = uc_reg_read(uc, UC_RISCV_REG_MCAUSE, &mcause);
            uc_reg_read(uc, UC_RISCV_REG_MEPC,&mepc);
            printf("unhandle cpu exception ==> " PRINT_RED "mcause: 0x%0x  mepc: 0x%0x\n" PRINT_RESET, mcause, mepc);
        } else {
            printf("Failed on uc_emu_start() with error returned: %u\n", err);
            printf("with return value: " PRINT_YELLOW "%d" PRINT_RESET " (int reg \"a0\")\n", int_reg_vals[UC_RISCV_REG_A0-1]);
            return_val = int_reg_vals[UC_RISCV_REG_A0-1];
        }

        
        stop = true;
        // m_assert(false, PRINT_RED "uc_emu_start() error simulation terminate..." PRINT_RESET );
    }

    if(engine_next_pc == image_size) {
        stop = true;
        printf("run out of program...\n");
    }

    // get next pc
    if(!is_mret) 
        uc_reg_read(uc, UC_RISCV_REG_PC, &engine_next_pc);
    
    
    // update cycles
    engine_cycles += 1;
}

void UcEngine::reset(void) {
    // reset uc_engine
    uc_close(uc);
    uc_err err;
    err = uc_open(UC_ARCH_RISCV, UC_MODE_RISCV32, &uc);
    if (err) {
        printf("Failed on uc_open() with error returned: %u (%s)\n", err,
                uc_strerror(err));
        return;
    }
    uc_hook_add(uc, &trace_inst, UC_HOOK_CODE, (void *)hook_code, NULL, 1, 0);
    engine_cycles = 0;

    return_val = 0;
    stop = false;
    engine_pc = ADDRESS;
    engine_next_pc = ADDRESS+4;
    engine_inst = 0;

    // reg initialize
    uc_reg_write(uc, UC_RISCV_REG_PC, &engine_pc);
    xlen_t reg_reset_val = 0;
    for(int i = 0; i < 32; i++) {
        this->int_reg_vals[i] = 0;
        uc_reg_write(uc, UC_RISCV_REG_X0+i, &reg_reset_val);
        // xlen_t reg_rd;
        // uc_reg_read(uc, UC_RISCV_REG_X0 + i, &reg_rd);
        // printf("%d\n",reg_rd);
    }
    
    printf(PRINT_RED "\nuc engine reset!\n\n" PRINT_RESET);
}

// void UcEngine::update_next_pc(void) {
//     engine_pc = engine_next_pc;
// }

void UcEngine::load_image(std::string image) {
    using namespace std;
    image_name = image;
    ifstream file(image, ios::in|ios::binary|ios::ate);
    if(!file) {
        m_assert(false, "Cannot open file.");
    }

    image_size = file.tellg();
    file.seekg (0, ios::beg);

    if(image_buffer != nullptr)
        delete[] image_buffer;
    image_buffer = new uint8_t[image_size];
    file.read((char *)image_buffer, image_size);

    file.close();

    printf("image read success! image size: " PRINT_YELLOW "%ld\n" PRINT_RESET, image_size);
    std::cout << "image read path: " << image << std::endl;

    // map 2MB memory for this emulation
    uc_mem_map(uc, ADDRESS, 2 * 1024 * 1024, UC_PROT_ALL);

    // write machine code to be emulated to memory
    uc_mem_write(uc, ADDRESS, (const void *)image_buffer, image_size);

    return;
}

void UcEngine::get_int_regs(void) {

    uc_err err;
    for(int i = 0; i < 32; i++) {
        err = uc_reg_read(uc, i + 1, &int_reg_vals[i]);
        if (err) {
            printf("Failed on uc_reg_read() with error returned: %u\n", err);
        }
    }

    if(verbose) {
        for(int i = 0; i < 32; i++) {
            if(int_reg_vals[i] != 0)
                printf(PRINT_RED "x%2d /%4s = 0x%08x  ", i, get_int_reg_name(i).c_str(), int_reg_vals[i]);
            else
                printf(PRINT_RESET "x%2d /%4s = 0x%08x  ", i, get_int_reg_name(i).c_str(), int_reg_vals[i]);
            if((i+1) % 4 == 0 )
                printf("\n");
        }
    }
    // printf("\n");
}


cmp_err_t UcEngine::compare_int_reg(xlen_t *regs) {
    bool same[32];
    bool all_same = true;

    for(int i = 0; i < 32; i++) {
        if(int_reg_vals[i] != regs[i])
            same[i] = false;
        else
            same[i] = true;
        all_same = all_same && same[i];
    }

    if(all_same) {
        if(verbose)
            printf(PRINT_YELLOW "reg all same! \n" PRINT_RESET);
        return CMP_OK;
    }
    else {
        for(int i = 0; i < 32; i++) {
            if(same[i] == false) {
                printf(PRINT_RED "x%2d /%4s = m 0x%08x << 0x%08x " PRINT_RESET, i, get_int_reg_name(i).c_str(), regs[i], int_reg_vals[i]);
            } else {
                printf("x%2d /%4s = m 0x%08x << 0x%08x ", i, get_int_reg_name(i).c_str(), regs[i], int_reg_vals[i]);
            }
            if((i+1) % 4 == 0 )
                printf("\n");
        }
        return CMP_ERR_INT_REG;
        m_assert(false, ("engine cycles: " + std::to_string(engine_cycles) + " error while doing int reg compare!\n").c_str());
    }

}


cmp_err_t UcEngine::compare_pc(xlen_t pc_in) {
    if(pc_in == engine_pc) {
        if(verbose)
            printf(PRINT_YELLOW "pc correct! \n" PRINT_RESET);
        return CMP_OK;
    }
    else {
        printf(PRINT_RED "m pc = 0x%08x << 0x%08x\n" PRINT_RESET, pc_in, engine_pc);
        printf(PRINT_RED "image_name: %s\n" PRINT_RESET, image_name.c_str());
        return CMP_ERR_PC;
        m_assert(false, ("engine cycles: " + std::to_string(engine_cycles) + " error while doing pc compare!\n").c_str());
    }
}


cmp_err_t UcEngine::compare_inst(ilen_t inst) {
    if(inst == engine_inst) {
        if(verbose)
            printf(PRINT_YELLOW "inst correct! \n" PRINT_RESET);
        return CMP_OK;
    }
    else {
        printf(PRINT_RED "m inst = 0x%08x << 0x%08x\n" PRINT_RESET, inst, engine_inst);
        printf(PRINT_RED "image_name: %s\n" PRINT_RESET, image_name.c_str());
        return CMP_ERR_INST;
        m_assert(false, ("engine cycles: " + std::to_string(engine_cycles) + " error while doing inst compare!\n").c_str());
    }
}


