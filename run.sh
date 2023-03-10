#!/bin/bash

# Both balign and align_alloc --Good!
### Production
./micro.sh debug 1333623000 1
./micro.sh swap_inputs
./micro.sh debug 1333623000 2
./micro.sh swap_inputs

###
# build/X86/gem5.opt --help
# build/X86/gem5.opt --debug-help
# build/X86/gem5.opt configs/example/se.py --help
# 
# Test correctness directly on host:
# make clean
# g++ -o spectre_shell_laptop spectre_shell_laptop.cpp -g -I. 
# ./spectre_shell_laptop