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
# Notes in ~/code/notes/221219_spectre_shell_debug.txt