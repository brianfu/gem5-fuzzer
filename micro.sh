#!/bin/bash

# export REPO=/home/plasma/code/gem5-fuzzer;
export REPO=/localhome/fubof/code/gem5-fuzzer;
export GEM5_PATH=$REPO;
export TESTS_DIR=$REPO/revizor_tests;
export OUT_DIR=$REPO/m5out;
export GEM5_DEBUG_FLAGS=""; # Default as blank

cd $REPO;

# echo "Making gem5";
# scons build/X86/gem5.opt -j 97

echo "Making Spectre Shell";
cd $TESTS_DIR;
make clean;
make;
cd $REPO;

echo "Cleaning outdir"
cd $OUT_DIR;
echo "" > gem5_output.out;
echo "" > bin_output.out;
cd $REPO;

echo "Running gem5"
# export GEM5_DEBUG_FLAGS="--debug-flags=CacheBlockAccess"; # Output is massive!
export BINARY_ARGS="input.csv" # Path to csv containing 1536 uint64_t's in hex form

build/X86/gem5.opt --outdir=$OUT_DIR $GEM5_DEBUG_FLAGS \
configs/example/se.py --cmd=$TESTS_DIR/spectre_shell \
--options=$TESTS_DIR/$BINARY_ARGS \
--cpu-type=X86O3CPU --l1d_size=64kB --l1i_size=16kB --caches --l2cache \
--output=bin_output.out &> m5out/gem5_output.out
echo "Done running gem5"


###

# --debug-flags=CacheAccess,CacheBlockAccess \
# --output=bin_output.out |& tee m5out/gem5_output.out

## Prep
# cd $REPO/util/m5
# scons build/x86/out/m5 -j 97 # Small 'x'!


#build/X86/gem5.opt configs/example/se.py --cmd=tests/test-progs/hello/bin/x86/linux/hello
# git commit --no-verify


# build/X86/gem5.opt configs/learning_gem5/part1/simple.py
# build/X86/gem5.opt configs/example/se.py --cmd=tests/test-progs/hello/bin/x86/linux/hello
# build/X86/gem5.opt configs/example/se.py --help

#CFLAGS=-I. -static -I$(GEM5_PATH)/include

# %.o: %.c $(DEPS)
# 	$(CC) -c -o $@ $< $(CFLAGS) $(WFLAGS) $(DFLAGS) $(LIBS) 

# $(BINS): $(OBJ)
# 	$(CC) -o $@ $^ $(CFLAGS) $(WFLAGS) $(DFLAGS) $(LIBS)

# cd $TESTS_DIR;
# rm spectre_v1
# as spectre_v1.asm -o spectre_v1
# chmod 775 spectre_v1
# export BIN=spectre_v1
# cd $REPO;

# gdb -tui spectre_shell
# b 171
# p output
# i r rax
# x/1fu sandbox_input
# disp sandbox_input
# layout src/asm/reg 
# ni, si, n, s