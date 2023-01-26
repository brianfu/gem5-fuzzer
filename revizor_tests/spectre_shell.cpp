#include <cstdio>
#include <iostream>
#include <cstring>
#include <cassert>
#include <fstream>
#include <sstream>
#include <vector>

using namespace std;
#include "defines.h"
#include "input.h"

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

inline __attribute__((always_inline))
void clflush(int* addr)
{
    asm volatile ("clflush (%0)"::"r"(addr));
}

int main(int argc, char* argv[])
{
  // Use extended asm (asm volatile) to create shell for spectre asm code 
  // Disasm after and compare to regular spectre asm (and hello world asm) to check diffs
  // If done right, should run successfully (return 0) on both laptop host AND X86O3CPU w/ l2cache in gem5!

  // cout << "Grabbing Input" << endl;
  // if (argc < 2) {
  //   cout << "Requires input csv as argument" << endl;
  // }
  // cout << "Input argument found" << endl;
  // bool success = get_input(argv[1]);
  // cout << "get_input returned: " << success << endl;

  cout << "Assuming input array in input.h" << endl;

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
  m5_reset_stats(0,0); //M5
  uint64_t output = 0; // Set breakpoint here!
  asm volatile(""
    ".intel_syntax noprefix\n"
    
    // r14 <- input base address (stored in rdi, the first argument of measurement_code)
    "mov r14, %[main_region_addr]\n"

    // stored_rsp <- rsp
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

    // Prime: flush entire sandbox from cache
    // Sandbox is 1536 bytes large, beginning from main_region_addr
    // Cache lines are 64 bytes each; 1536/64=24 total lines
    "mov r8, 0\n"
    "flush_loop:\n"

    "mov r9, 64\n"
    "imul r9, r8\n" // r9 now contains the byte offset from main_region_addr
    "add r9, %[main_region_addr]\n" // r9 now contains the addr to flush

    ".att_syntax\n"
    "clflush (%%r9)\n" // Absolute hack; No way to do this using intel syntax!
    ".intel_syntax noprefix\n"
    
    "inc r8\n"
    "cmp r8, 24\n"
    "jl flush_loop\n"

    // Insert magic gem5 work begin
    // 0x040F is the magic x86 undefined instruction boilerplate to which the identifier gets added
    // m5_work_begin/m5_work_end will trigger separate ROI stats in stats.txt
    // 0x0021: m5_exit (for debugging)
    "pushq rax\n" // Save rax, rdi, rsi
    "pushq rdi\n" 
    "pushq rsi\n"
    "mov rax, 0\n" // Return
    "mov rdi, 0\n" // Arg 1
    "mov rsi, 0\n" // Arg 2
    ".word 0x040F\n"
    ".word " xstr(START_WORK_M5OP) "\n" // 0x005a: m5_work_begin, from asm/generic/m5ops.h
    "popq rsi\n"
    "popq rdi\n"
    "popq rax\n"

    // Execute test case, input is set into rax
    ".test_case_enter:\n"
    "LFENCE\n"

    // reduce the entropy of rax
    "AND rax, 0b111111000000\n"

    // delay the cond. jump
    // qword ptr should be a dereference (mov dest, src)
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

    // Insert magic gem5 work end
    "pushq rax\n"
    "pushq rdi\n"
    "pushq rsi\n"
    "mov rax, 0\n"
    "mov rdi, 0\n"
    "mov rsi, 0\n"
    ".word 0x040F\n"
    ".word 0x005b\n" // 0x005b: m5_work_end, from asm/generic/m5ops.h
    "popq rsi\n"
    "popq rdi\n"
    "popq rax\n"
    
    // Can print out rax if we want some return value
    "mov %[output], rax\n"

    // rsp <- stored_rsp, rbp <- stored_rbp
    "mov rsp, qword ptr [r14 + " xstr(RSP_OFFSET) "]\n"
    "mov rbp, qword ptr [r14 + " xstr(RBP_OFFSET) "]\n"
    
    ".att_syntax\n" // Else rest of compiled code will break
  : [output] "=rm" (output) // Output e.g. "=r" (dst)
  : [main_region_addr] "r" (sandbox_input) // Input e.g. "r" (src)
  :  "rax", "rbx", "rcx", "rdx", "rsi", "rdi", "r8", "r9", "r10", "r14", "cc", "memory" // Clobber list
  );
  m5_dump_stats(0,0); //M5
  // Effective memory dmb in beginning

  // Violation either occured or didn't by this point, exit gracefully
  cout << "Finished running spectre code" << endl;
  cout << "Output of spectre code chunk: " << output << endl; // Give some output from spectre, even if garbage

  m5_exit(0); //M5
  return 0;
}
