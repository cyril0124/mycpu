#include "emu/emu.h"
#include <iostream>

std::string prj_dir = "/home/cyril/workspace/riscv/mycpu/";

using namespace std;
int main(int argc, char **argv) {
    Emu emu(argc, argv);

    emu.execute(-1);

    return 0;
}