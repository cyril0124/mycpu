#ifndef COMMON_H
#define COMMON_H


#include <cmath>
#include <memory>
#include <string>
#include <sstream>
#include <fstream>

extern uint64_t cycles;
extern std::string prj_dir;

#define PRINT_BLACK "\033[0;30m"
#define PRINT_RED   "\033[0;31m"
#define PRINT_YELLOW "\033[1;33m"
#define PRINT_RESET "\x1B[0m"
#define PRINT_GREEN "\033[32;1m"

extern void before_assert(void);

#define m_assert(cond, info)                                                \
    do {                                                                    \
        if (!(cond)) {                                                      \
        before_assert();                                                    \
        printf("\33[1;34m%s\n", info);                                      \
        printf("cycles: %ld\33[0m\n", cycles);                              \
        fflush(stdout);                                                     \
        fflush(stderr);                                                     \
        throw(1);                                                           \
        }                                                                   \
    } while (0)


#endif // COMMON_H