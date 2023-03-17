#include "emu.h"

uint64_t cycles;

uint64_t inst_num = 0;

Emu::Emu(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    cycles = 0;
    this->dut_ptr = new Vtop_tb();

    engine = new UcEngine();

    printf("[INFO] use seed: %ld\n", this->seed);
    srand(this->seed);

#if VM_TRACE == 1
    if (this->enable_wave) {
        Verilated::traceEverOn(true); // Verilator must compute traced signals
        tfp = new VerilatedVcdC;
        dut_ptr->trace(tfp, 99); // Trace 99 levels of hierarchy
        time_t now = time(NULL);
        tfp->open(cycle_wavefile(cycles, now));
    }
#endif
}

Emu::~Emu() {
    delete dut_ptr;
#if VM_TRACE == 1
    if (this->enable_wave) {
        this->tfp->close();
    }
#endif
}

void Emu::reset_sys(uint64_t n) {
    reset(n);
    engine->reset();
}

void Emu::execute(uint64_t nr_cycles) {
    // read configure file
    using json = nlohmann::json;
    std::ifstream f(CONFIG_FILE_PATH);
    json data = json::parse(f);
    int test_case_num = data["test_case_num"];
    printf("test_case_num: %d\n",test_case_num);

    // test_case_num = 1;
    // run all test case
    for(int test_case = 1; test_case <= test_case_num; test_case++) {
        // load image into uc_engine
        std::string dir = data[std::to_string(test_case)]["dir"];
        std::string bin_file = data[std::to_string(test_case)]["name"]; // e.g. or.bin
        std::string bin_name = bin_file.substr(0, bin_file.length()-4); // e.g. or
        
        std::string scripts_dir = prj_dir + "scripts/load_image/";
        std::string scripts = scripts_dir + "main.py";
        std::string rom_dir = prj_dir + "src/main/resources/";

        if(test_case == 29) {
            printf("hello");
        }
        // parse disassemble file
        // std::string command = std::string("python3 ") + scripts + " " + dir + "/" + bin_name + ".dump" + " " + scripts_dir + bin_name + ".out";
        // system(command.c_str());
        std::string command = std::string("python3 ") + scripts + " " + dir + "/" + bin_name; //+ ".dump" + " " + scripts_dir + bin_name + ".out";
        system(command.c_str());

        // backup rom
        command.clear();
        command = std::string("mv ") + rom_dir + "Imem.hex " + rom_dir + "Imem.hex.bak";
        system(command.c_str());

        // load rom
        command.clear();
        // command = std::string("cp ") + scripts_dir + bin_name + ".out " + rom_dir + "Imem.hex";
        command = std::string("cp ")   + "Imem.hex " + rom_dir + "Imem.hex";
        system(command.c_str()); 

        // load ram
        command.clear();
        command = std::string("cp ")  + "Dmem.hex " + rom_dir + "Dmem.hex";
        system(command.c_str()); 

        // rest sys
        reset_sys(10);
        engine->load_image(dir + '/' + bin_file);
        
        // start processor
        dut_ptr->io_in_start = 0;
        this->step();
        this->update_cycles(1);
        dut_ptr->io_in_start = 1;
        // rename signals
        auto &commit = dut_ptr->io_out_state_instState_commit;
        auto &pc = dut_ptr->io_out_state_instState_pc;
        auto &inst = dut_ptr->io_out_state_instState_inst;
        uint32_t int_regs[32] = {0};
        uint32_t cmp_err[3] = {0};

        if(cycles >= nr_cycles) {
            m_assert(false, "run out of cycles!");
        }

        while(cycles < nr_cycles) {
            if(commit == 1) {
                inst_num++;

                engine->step();
                cmp_err[0] = engine->compare_pc(pc);
                cmp_err[1] = engine->compare_inst(inst);

                int_regs[0] = dut_ptr->io_out_state_intRegState_regState_0;
                int_regs[1] = dut_ptr->io_out_state_intRegState_regState_1;
                int_regs[2] = dut_ptr->io_out_state_intRegState_regState_2;
                int_regs[3] = dut_ptr->io_out_state_intRegState_regState_3;
                int_regs[4] = dut_ptr->io_out_state_intRegState_regState_4;
                int_regs[5] = dut_ptr->io_out_state_intRegState_regState_5;
                int_regs[6] = dut_ptr->io_out_state_intRegState_regState_6;
                int_regs[7] = dut_ptr->io_out_state_intRegState_regState_7;
                int_regs[8] = dut_ptr->io_out_state_intRegState_regState_8;
                int_regs[9] = dut_ptr->io_out_state_intRegState_regState_9;
                int_regs[10] = dut_ptr->io_out_state_intRegState_regState_10;
                int_regs[11] = dut_ptr->io_out_state_intRegState_regState_11;
                int_regs[12] = dut_ptr->io_out_state_intRegState_regState_12;
                int_regs[13] = dut_ptr->io_out_state_intRegState_regState_13;
                int_regs[14] = dut_ptr->io_out_state_intRegState_regState_14;
                int_regs[15] = dut_ptr->io_out_state_intRegState_regState_15;
                int_regs[16] = dut_ptr->io_out_state_intRegState_regState_16;
                int_regs[17] = dut_ptr->io_out_state_intRegState_regState_17;
                int_regs[18] = dut_ptr->io_out_state_intRegState_regState_18;
                int_regs[19] = dut_ptr->io_out_state_intRegState_regState_19;
                int_regs[20] = dut_ptr->io_out_state_intRegState_regState_20;
                int_regs[21] = dut_ptr->io_out_state_intRegState_regState_21;
                int_regs[22] = dut_ptr->io_out_state_intRegState_regState_22;
                int_regs[23] = dut_ptr->io_out_state_intRegState_regState_23;
                int_regs[24] = dut_ptr->io_out_state_intRegState_regState_24;
                int_regs[25] = dut_ptr->io_out_state_intRegState_regState_25;
                int_regs[26] = dut_ptr->io_out_state_intRegState_regState_26;
                int_regs[27] = dut_ptr->io_out_state_intRegState_regState_27;
                int_regs[28] = dut_ptr->io_out_state_intRegState_regState_28;
                int_regs[29] = dut_ptr->io_out_state_intRegState_regState_29;
                int_regs[30] = dut_ptr->io_out_state_intRegState_regState_30;
                int_regs[31] = dut_ptr->io_out_state_intRegState_regState_31;
                cmp_err[2] = engine->compare_int_reg(int_regs);

                engine->update_next_pc();

                if(engine->is_terminate() && test_case == test_case_num) {
                    printf(PRINT_GREEN "test end, all case PASS!\n" PRINT_RESET);
                    m_assert(false, "terminate...");
                }
            }

            this->step();
            this->update_cycles(1);

            // engine stop
            if(engine->is_terminate()) {
                // m_assert(false, PRINT_RED "simulation terminate..." PRINT_RESET );
                printf(PRINT_RED "case terminate...\n\n" PRINT_RESET);
                printf(PRINT_GREEN "PASS ! test_case_name: %s\n" PRINT_RESET, bin_file.c_str());
                dut_ptr->io_in_start = 0;
                break;
            }

            // compare error handle
            bool has_cmp_err = false;
            for(int i = 0; i < 3; i++) {
                has_cmp_err = has_cmp_err | cmp_err[i] != 0;
            }
            if(has_cmp_err) {
                for(int i = 0; i < 3; i++) {
                    auto err = cmp_err[i];
                    switch (err) {
                        case CMP_ERR_PC:
                            printf(PRINT_RED "%s\n" PRINT_RESET, ("engine cycles: " + std::to_string(engine->engine_cycles) + " error while doing pc compare!").c_str());
                            break;
                        case CMP_ERR_INST:
                            printf(PRINT_RED "%s\n" PRINT_RESET, ("engine cycles: " + std::to_string(engine->engine_cycles) + " error while doing inst compare!").c_str());
                            break;
                        case CMP_ERR_INT_REG:
                            printf(PRINT_RED "%s\n" PRINT_RESET, ("engine cycles: " + std::to_string(engine->engine_cycles) + " error while doing int reg compare!").c_str());
                            break;
                        default:
                            break;
                    }
                }

                // !! if you want assert the whole program, make sure you properly close the dump trace file.
#if VM_TRACE == 1
                if (this->enable_wave) {
                    this->tfp->close();
                }
#endif
                m_assert(false, (std::string("compare error! ") + "test_case_name: " + bin_file + "\n").c_str());
            }
        }
    }
}


void before_assert(void) {
    float ipc = (float)((float)inst_num/(float)cycles);
    float cpi = 1 / ipc;
    printf("inst_num = %ld, cycles = %ld, IPC = %.2f, CPI = %.2f\n", inst_num, cycles, ipc, cpi);
}