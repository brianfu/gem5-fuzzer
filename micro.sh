#!/bin/bash

# export REPO=/home/plasma/code/gem5-fuzzer;
export REPO=/localhome/fubof/code/gem5-fuzzer;
export GEM5_PATH=$REPO;
export TESTS_DIR=$REPO/revizor_tests;
export OUT_DIR=$REPO/m5out;
export GEM5_DEBUG_FLAGS=""; # Default as blank
export BINARY_ARGS="input.csv" # Path to csv containing 1536 uint64_t's in hex form

cd $REPO;

# Avaliable debug flags: O3CPUAll, O3PipeView, CacheAccess, CacheBlockMiss, CacheMSHRMiss, PrefetchMissProbeNotify
# No space between debug flags

debug_run () {
  local CURR_DEBUG_FLAGS=$1;
  local BEGIN_TICK=$2;
  local TRACE_NAME=$3;

  echo "Running ${CURR_DEBUG_FLAGS} debug:";
  GEM5_DEBUG_FLAGS="--debug-flags=${CURR_DEBUG_FLAGS}"; # Output may be massive!
  gem5_run $GEM5_DEBUG_FLAGS $BEGIN_TICK;
  echo "Moving ${CURR_DEBUG_FLAGS} trace to $OUT_DIR/"${TRACE_NAME}.out"";
  mv $OUT_DIR/trace.out $OUT_DIR/"${TRACE_NAME}.out"
}

gem5_run () {
  cd $REPO;
  local GEM5_DEBUG_FLAGS=$1;
  # echo "gem5: ${GEM5_DEBUG_FLAGS}";

  build/X86/gem5.opt --outdir=$OUT_DIR $GEM5_DEBUG_FLAGS --debug-file=trace.out \
  --debug-start=$2 \
  configs/example/se.py --cmd=$TESTS_DIR/spectre_shell \
  --options=$TESTS_DIR/$BINARY_ARGS \
  --cpu-type=X86O3CPU --l1d_size=64kB --l1i_size=16kB --caches --l2cache \
  --cacheline_size 64 \
  --bp-type TournamentBP \
  --output=bin_output.out &> m5out/gem5_output.out;
  echo "Done running gem5";
}

find_tick () {
  echo "Running find start work tick run";
  echo "Remaking Spectre Shell for START_WORK_M5OP=0x0021";
  cd $TESTS_DIR;
  make clean;
  make DFLAGS=-DSTART_WORK_M5OP=0x0021;
  cd $REPO;

  GEM5_DEBUG_FLAGS="";
  START_TICK=0;
  gem5_run "$GEM5_DEBUG_FLAGS" $START_TICK; # Need quotes to pass empty str variable

  echo "m5_exit tick should be on last line of gem5_output.out: "
  tail -1 $OUT_DIR/gem5_output.out;
}

disassemble () {
  name_prefix=$1;
  echo "Disassembling Spectre Shell";
  cd $TESTS_DIR;
  objdump -d spectre_shell > "${name_prefix}-disasm.asm";
  mv ./"${name_prefix}-disasm.asm" $OUT_DIR/"${name_prefix}-disasm.asm";
  echo "Spectre shell disassembled at $OUT_DIR/${name_prefix}-disasm.asm";
}

main() {
  ARG=$1

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

  case $ARG in
    "build_gem5")
      ## Must remake gem5 upon modifying simulator! (but not when merely modifying config)
      echo "Making gem5";
      scons build/X86/gem5.opt -j 97 USE_X86_ISA=True
    ;;

    "debug")
      echo "Running debug run; Change input.h for comparison!"
      work_begin_tick=$2;
      name_prefix=$3; # E.g. "1" for "1-misses.out"

      let "pipe_debug_tick = $work_begin_tick - 10000000"; # Go back 10000 cycles beforehand for debug(assuming 1 GHz)
      echo "Given m5_work_begin tick is: $work_begin_tick";
      echo "Pipeline debug tick set at: $pipe_debug_tick";

      disassemble ${name_prefix}

      CURR_DEBUG_FLAGS=CacheBlockMiss;
      CURR_TRACE_NAME="${name_prefix}-${CURR_DEBUG_FLAGS}";
      debug_run $CURR_DEBUG_FLAGS $work_begin_tick $CURR_TRACE_NAME;

      CURR_DEBUG_FLAGS=CacheBlockHit;
      CURR_TRACE_NAME="${name_prefix}-${CURR_DEBUG_FLAGS}";
      debug_run $CURR_DEBUG_FLAGS $pipe_debug_tick $CURR_TRACE_NAME;

      CURR_DEBUG_FLAGS=CacheBlockMiss,CacheBlockHit;
      CURR_TRACE_NAME="${name_prefix}-${CURR_DEBUG_FLAGS}";
      debug_run $CURR_DEBUG_FLAGS $pipe_debug_tick $CURR_TRACE_NAME;

      CURR_DEBUG_FLAGS=O3PipeView;
      CURR_TRACE_NAME="${name_prefix}-${CURR_DEBUG_FLAGS}";
      debug_run $CURR_DEBUG_FLAGS $pipe_debug_tick $CURR_TRACE_NAME;

      CURR_DEBUG_FLAGS=Exec;
      CURR_TRACE_NAME="${name_prefix}-${CURR_DEBUG_FLAGS}";
      debug_run $CURR_DEBUG_FLAGS $pipe_debug_tick $CURR_TRACE_NAME;

      CURR_DEBUG_FLAGS=TLB;
      CURR_TRACE_NAME="${name_prefix}-${CURR_DEBUG_FLAGS}";
      debug_run $CURR_DEBUG_FLAGS $pipe_debug_tick $CURR_TRACE_NAME;

      CURR_DEBUG_FLAGS=LSQUnit;
      CURR_TRACE_NAME="${name_prefix}-${CURR_DEBUG_FLAGS}";
      debug_run $CURR_DEBUG_FLAGS $pipe_debug_tick $CURR_TRACE_NAME;
    ;;

    "find_tick")
      find_tick;
    ;;

    "production")
      echo "Running production run";
      GEM5_DEBUG_FLAGS="--debug-flags=CacheBlockMiss,CacheBlockHit";
      # START_TICK=0;
      START_TICK=1333623000; # 10k cycles before test_case_enter of slowest tested run
      gem5_run $GEM5_DEBUG_FLAGS $START_TICK;
    ;;

    "swap_inputs")
      second_input_filename="${2:-"input_old.h"}";
      cd $TESTS_DIR;
      echo "Swapping current input.h with $second_input_filename";
      mv input.h temporary_input_123_0xdeadbeef; # Hopefully nothing is ever actually named this
      mv $second_input_filename input.h;
      mv temporary_input_123_0xdeadbeef $second_input_filename;
      echo "Successfully swapped inputs";
      # find_tick;
    ;;

    "disasm")
      disassemble $2
    ;;

    *)
      echo "Error: No arguments given!";
      echo """
        Usage:
        ./micro.sh build_gem5
        ./micro.sh debug <work_begin_tick> <name_prefix>
        ./micro.sh find_tick
        ./micro.sh production
        
        ./micro.sh swap_inputs <second_input_filename> (Default: input_old.h)
        ./micro.sh disasm <name-prefix>
      """
    ;;
    esac
}

main "$@"