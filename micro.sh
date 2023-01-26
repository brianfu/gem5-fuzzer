#!/bin/bash

# export REPO=/home/plasma/code/gem5-fuzzer;
export REPO=/localhome/fubof/code/gem5-fuzzer;
export GEM5_PATH=$REPO;
export TESTS_DIR=$REPO/revizor_tests;
export OUT_DIR=$REPO/m5out;
export GEM5_DEBUG_FLAGS=""; # Default as blank

cd $REPO;

## Must remake gem5 upon modifying simulator! (but not when merely modifying config)
# echo "Making gem5";
# scons build/X86/gem5.opt -j 97 USE_X86_ISA=True

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

# Avaliable debug flags: O3CPUAll, O3PipeView, CacheAccess, CacheBlockAccess, PrefetchMissProbeNotify
# No space between debug flags

echo "Running gem5"

# export GEM5_DEBUG_FLAGS="";
# export GEM5_DEBUG_FLAGS="--debug-flags=Exec";
# export GEM5_DEBUG_FLAGS="--debug-flags=O3PipeView";
export GEM5_DEBUG_FLAGS="--debug-flags=CacheBlockAccess"; # Output may be massive!

export BINARY_ARGS="input.csv" # Path to csv containing 1536 uint64_t's in hex form

build/X86/gem5.opt --outdir=$OUT_DIR $GEM5_DEBUG_FLAGS --debug-file=trace.out \
--debug-start=0 \
configs/example/se.py --cmd=$TESTS_DIR/spectre_shell \
--options=$TESTS_DIR/$BINARY_ARGS \
--cpu-type=X86O3CPU --l1d_size=64kB --l1i_size=16kB --caches --l2cache \
--cacheline_size 64 --l2-hwp-type StridePrefetcher \
--bp-type LocalBP \
--output=bin_output.out &> m5out/gem5_output.out
echo "Done running gem5"


###
# Test correctness directly on host:
# make clean
# g++ -o spectre_shell_laptop spectre_shell_laptop.cpp -g -I. 
# ./spectre_shell_laptop