#ifndef __DEFINES_H__
#define __DEFINES_H__

#include "gem5/m5ops.h"
// inputs.h should be included in spectre_shell itself!
// #include "m5_mmap.h"

// Sandbox
#define WORKING_MEMORY_SIZE 1048576 // 256KB
#define MAIN_REGION_SIZE 4096
#define FAULTY_REGION_SIZE 4096
#define OVERFLOW_REGION_SIZE 4096
#define REG_INITIALIZATION_REGION_SIZE 64

#define L1D_ASSOCIATIVITY 12 // cat /sys/devices/system/cpu/cpu0/cache/index0/ways_of_associativity
#define EVICT_REGION_SIZE (L1D_ASSOCIATIVITY * 4096)
#define EVICT_REGION_OFFSET (EVICT_REGION_SIZE + OVERFLOW_REGION_SIZE)
#define REG_INIT_OFFSET 8192 // (MAIN_REGION_SIZE + FAULTY_REGION_SIZE)
#define RSP_OFFSET 12288 // (MAIN_REGION_SIZE + FAULTY_REGION_SIZE + OVERFLOW_REGION_SIZE)
#define RBP_OFFSET 12296 // RSP_OFFSET + sizeof(stored_rsp)

#define xstr(s) _str(s)
#define _str(s) str(s)
#define str(s) #s

typedef struct Sandbox
{
    char eviction_region[EVICT_REGION_SIZE];   // region used in Prime+Probe for priming
    char lower_overflow[OVERFLOW_REGION_SIZE]; // zero-initialized region for accidental overflows
    char main_region[MAIN_REGION_SIZE];        // first input page. does not cause faults
    char faulty_region[FAULTY_REGION_SIZE];    // second input. causes a (configurable) fault
    char upper_overflow[OVERFLOW_REGION_SIZE]; // zero-initialized region for accidental overflows
    uint64_t stored_rsp;
    uint64_t stored_rbp; // Not supported by asm clobbering
} sandbox_t;

#define INPUT_SIZE ((MAIN_REGION_SIZE + FAULTY_REGION_SIZE + OVERFLOW_REGION_SIZE) / 8)
/*
  Test case input is an array consisting of initial memory and register values to set
  Input size: ((main_region size + faulty_region size + upper_overflow_region size) / sizeof(uint64_t))
  Input is a fixed-size array of 64-bit unsigned integers.
  The array is used to initialize the sandbox memory and the CPU registers.
  The array layout is:

  +----------------------+
  |   Register Values    | upper_overflow_region
  +----------------------+
  |                      |
  |                      | faulty_region
  | Assist Region Values |
  +----------------------+
  |                      |
  |                      | main_region
  |  Main Region Values  |
  +----------------------+

  The ordering of registers:  RAX, RBX, RCX, RDX, RSI, RDI, FLAGS
*/

extern const uint64_t input[INPUT_SIZE]; // A single test case input
sandbox_t* sandbox;
void* stack_base;

int check_sandbox_malloc(sandbox_t* sbox);

void init_sandbox(sandbox_t* sandbox);



#endif