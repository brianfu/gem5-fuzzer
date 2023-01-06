// gcc -o spectre_shell_laptop spectre_shell_laptop.cpp defines.h -g -I.
#include <cstdio>
#include <iostream>
#include <cstring>
#include <cassert>
#include <fstream>
#include <sstream>
#include <vector>

using namespace std;
#include "defines.h"

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

uint64_t input[INPUT_SIZE]; // A single test case input
sandbox_t* sandbox;
void* stack_base;

// Put input csv into input array
bool get_input(string csv_path){
  ifstream csv_file(csv_path);
  int count = 0;

  // Read each line of the CSV file
  string line;
  while (getline(csv_file, line)) {
    // Split the line into fields using a comma as the delimiter
    stringstream line_stream(line);
    string field;
    while (getline(line_stream, field, ',')) {
      // Convert the field to a hexadecimal number and add it to the array
      input[count] = stoul(field, nullptr, 16);
      count++;
    }
  }
  csv_file.close();

  assert(count == INPUT_SIZE);
  return true;
}

int check_sandbox_malloc(sandbox_t* sbox){
  // Assumes sbox contains alloc'd memory
  if (!sbox)
  {
      printf("x86_executor: Could not allocate memory for sandbox\n");
      return -1;
  }
  stack_base = &(sbox->main_region[MAIN_REGION_SIZE - 8]);

  // make sure the sandbox is aligned as we expect
  if ((&sbox->main_region[0] - &sbox->eviction_region[0]) != EVICT_REGION_OFFSET ||
      ((char *)&sbox->stored_rsp - &sbox->main_region[0]) != RSP_OFFSET ||
      ((char *)&sbox->stored_rbp - &sbox->main_region[0]) != RBP_OFFSET ||
      (&sbox->upper_overflow[0] - &sbox->main_region[0]) != REG_INIT_OFFSET)
  {
      printf("x86_executor: Sandbox alignment error\n");
      return -1;
  }

  return 0;
}

void init_sandbox(sandbox_t* sandbox){
  cout << "Entered init_sandbox" << endl;
  // for (int i=0; i<INPUT_SIZE; i++) {
  //   input[i] = 0xdeadbeef + i*0x1ee7c0de; // Very crude random input generator
  // }
  uint64_t* current_input = (uint64_t*) &input;
  cout << "Set inputs" << endl;

  // Initialize memory:
  // NOTE: memset is not used intentionally! somehow, it messes up with P+P measurements
  // - overflows are initialized with zeroes
  memset(&(sandbox->lower_overflow[0]), 0, OVERFLOW_REGION_SIZE * sizeof(char));
  cout << "Sandbox lower overflow memset completed" << endl;
  for (int j = 0; j < OVERFLOW_REGION_SIZE / 8; j += 1)
  {
      // ((uint64_t *) sandbox->lower_overflow)[j] = 0;
      ((uint64_t *)sandbox->upper_overflow)[j] = 0;
  }
  cout << "Init'd sandbox memory" << endl;

  // - sandbox: main and faulty regions   
  uint64_t *main_page_values = &current_input[0];
  uint64_t *main_base = (uint64_t *)&sandbox->main_region[0];
  for (int j = 0; j < MAIN_REGION_SIZE / 8; j += 1)
  {
      ((uint64_t *)main_base)[j] = main_page_values[j];
  }
  cout << "Init'd main region" << endl;

  uint64_t *faulty_page_values = &current_input[MAIN_REGION_SIZE / 8];
  uint64_t *faulty_base = (uint64_t *)&sandbox->faulty_region[0];
  for (int j = 0; j < FAULTY_REGION_SIZE / 8; j += 1)
  {
      ((uint64_t *)faulty_base)[j] = faulty_page_values[j];
  }
  cout << "Init'd faulty region" << endl;

  // Initial register values (the registers will be set to these values in template.c)
  uint64_t *register_values = &current_input[(MAIN_REGION_SIZE + FAULTY_REGION_SIZE) / 8];
  uint64_t *register_initialization_base = (uint64_t *)&sandbox->upper_overflow[0]; // Register initial values contained in upper overflow
  cout << "Grabbed register values" << endl;

  // - RAX ... RDI
  for (int j = 0; j < 6; j += 1)
  {
      ((uint64_t *)register_initialization_base)[j] = register_values[j];
  }
  cout << "Assigned register values" << endl;

  // - flags
  uint64_t masked_flags = (register_values[6] & 2263) | 2;
  ((uint64_t *)register_initialization_base)[6] = masked_flags;
  cout << "Set flags" << endl;

  // - RSP and RBP
  ((uint64_t *)register_initialization_base)[7] = (uint64_t)stack_base;
  cout << "Set rsp and rbp" << endl;

  // Give &sandbox->main_region[0] to rdi for input args
}

int main(int argc, char* argv[])
{
  // Use extended asm (asm volatile) to create shell for spectre asm code 
  // Disasm after and compare to regular spectre asm (and hello world asm) to check diffs
  // If done right, should run successfully (return 0) on both laptop host AND X86O3CPU w/ l2cache in gem5!

  cout << "Grabbing Input" << endl;
  bool success = get_input("/localhome/fubof/code/gem5-fuzzer/revizor_tests/input.csv");
  cout << "get_input returned: " << success << endl;

  cout << "Allocating sandbox" << endl;
  sandbox = (sandbox_t*) malloc(sizeof(sandbox_t));
  int res = check_sandbox_malloc(sandbox);
  cout << "check_sandbox_malloc returned: " << res << endl;

  cout << "Initing Sandbox" << endl;
  init_sandbox(sandbox);
  cout << "Sandbox successfully init'd" << endl;

  uint64_t* sandbox_input = (uint64_t*) &sandbox->main_region[0]; // Address of start of main region of sandbox
  cout << "Sandbox main region addr: " << sandbox_input << endl; // Should be 0x55e4d817b2c0
  cout << "Sandbox main region first value: " << *sandbox_input << endl; // Should be 3735928559
  
  cout << endl;
  cout << "Starting asm block" << endl;
  uint64_t output = 0; // Set breakpoint here!
  asm volatile(
    ".intel_syntax noprefix\n"
    // "mov %[output], 0xdeadbeef\n"
    
    // r14 <- input base address (stored in rdi, the first argument of measurement_code)
    "mov r14, %[main_region_addr]\n"

    // Other prologue regs are saved by asm clobber list!
    "mov qword ptr [r14 + " xstr(RSP_OFFSET) "], rsp\n"
    "mov qword ptr [r14 + " xstr(RBP_OFFSET) "], rbp\n"

    // clear the rest of the registers
    "mov rax, 0\n"
    "mov rbx, 0\n"
    "mov rcx, 0\n"
    "mov rdx, 0\n"
    "mov rsi, 0\n"
    "mov rdi, 0\n"

    // Set registers from input
    // Clobber these!
    "lea rsp, [r14 + " xstr(REG_INIT_OFFSET) "]\n" // Grab reg values from upper overflow, put them into stack, pop out onto regs
    "popq rax \n"
    "popq rbx \n"
    "popq rcx \n"
    "popq rdx \n"
    "popq rsi \n"
    "popq rdi \n"
    "popfq \n"
    "popq rsp \n"
    "mov rbp, rsp \n"

    // TODO Insert magic gem5 start track inst here
    // Execute test case, input is set into rax
    ".test_case_enter:\n"
    "LFENCE\n"

    // reduce the entropy of rax
    "AND rax, 0b111111000000\n"

    // delay the cond. jump
    "LEA rbx, qword ptr [rbx + rax + 1]\n"
    "LEA rbx, qword ptr [rbx + rax + 1]\n"
    "LEA rbx, qword ptr [rbx + rax + 1]\n"
    "LEA rbx, qword ptr [rbx + rax + 1]\n"
    "LEA rbx, qword ptr [rbx + rax + 1]\n"
    "LEA rbx, qword ptr [rbx + rax + 1]\n"
    "LEA rbx, qword ptr [rbx + rax + 1]\n"
    "LEA rbx, qword ptr [rbx + rax + 1]\n"
    "LEA rbx, qword ptr [rbx + rax + 1]\n"
    "LEA rbx, qword ptr [rbx + rax + 1]\n"

    // reduce the entropy in rbx
    "AND rbx, 0b1000000\n"

    "CMP rbx, 0\n"

    "JE .l1\n"  // misprediction
    ".l0:\n"
        // # rbx != 0
        "MOV rax, qword ptr [r14 + rax]\n" // Mispredicted path
    "JMP .l2\n"
    ".l1:\n"
        // # rbx == 0
        "MOV rax, qword ptr [r14 + 64]\n" // Correct path (should be able to do nothing as well)
    ".l2:\n"
    "MFENCE\n"
    
    // Can print out rax if we want some return value
    "mov %[output], rax\n"

    // rsp <- stored_rsp, rbp <- stored_rbp
    "mov rsp, qword ptr [r14 + " xstr(RSP_OFFSET) "]\n"
    "mov rbp, qword ptr [r14 + " xstr(RBP_OFFSET) "]\n"
    
    ".att_syntax\n" // Else rest of compiled code will break
  : [output] "=rm" (output) // Output e.g. "=r" (dst)
  : [main_region_addr] "r" (sandbox_input) // Input e.g. "r" (src)
  :  "rax", "rbx", "rcx", "rdx", "rsi", "rdi", "r14", "cc", "memory" // Clobber list
  );
  // Effective memory dmb in beginning

  // Violation either occured or didn't by this point, exit gracefully
  cout << "Finished running spectre code" << endl;
  cout << "Output of spectre code chunk: " << output << endl; // Give some output from spectre, even if garbage

  return 0;
}
