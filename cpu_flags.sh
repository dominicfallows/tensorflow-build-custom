#!/bin/bash
# Based on example from Sasha Nikiforov (https://knowm.org/compiling-tensorflow-from-source-on-macos/) and https://stackoverflow.com/questions/41293077/how-to-compile-tensorflow-with-sse4-2-and-avx-instructions
 
raw_cpu_flags=`sysctl -a | grep machdep.cpu.features | cut -d ":" -f 2 | tr '[:upper:]' '[:lower:]'`
COPT="--copt=-march=native"
 
for cpu_feature in $raw_cpu_flags
do
    case "$cpu_feature" in
        "sse4.1" | "sse4.2" | "ssse3" | "fma" | "cx16" | "popcnt" | "maes")
            COPT+=" --copt=-m$cpu_feature"
        ;;
        "avx1.0")
            COPT+=" --copt=-mavx"
        ;;
        *)
            # noop
        ;;
    esac
done

echo $COPT