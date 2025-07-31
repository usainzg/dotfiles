#!/usr/bin/env python3

#  python3 ~/.local/bin/run_wasm_test_suite.py --suite-dir /Users/jjasmine/Developer/igalia/llvm-test-suite --clang $HOME/Developer/igalia/wasi-sdk/build/install/bin/clang
import argparse
import subprocess
import os
import sys


extra_flags = ["-D_WASI_EMULATED_PROCESS_CLOCKS",
               "-lwasi-emulated-process-clocks"]


test_files = [
            "SingleSource/Benchmarks/CoyoteBench/almabench.c",
            # "SingleSource/Benchmarks/CoyoteBench/fftbench.cpp",
            "SingleSource/Benchmarks/CoyoteBench/huffbench.c",
            "SingleSource/Benchmarks/CoyoteBench/lpbench.c",
            # "SingleSource/Benchmarks/Dhrystone/dry.c",
            # "SingleSource/Benchmarks/Dhrystone/fldry.c",
            "SingleSource/Benchmarks/Linpack/Linpack-pc.c",

            "SingleSource/Benchmarks/Shootout/ackermann.c",
            "SingleSource/Benchmarks/Shootout/ary3.c",
            "SingleSource/Benchmarks/Shootout/fib2.c",
            "SingleSource/Benchmarks/Shootout/hash.c",
            "SingleSource/Benchmarks/Shootout/heapsort.c",
            "SingleSource/Benchmarks/Shootout/hello.c",
            "SingleSource/Benchmarks/Shootout/lists.c",
            "SingleSource/Benchmarks/Shootout/matrix.c",
            "SingleSource/Benchmarks/Shootout/methcall.c",
            "SingleSource/Benchmarks/Shootout/nestedloop.c",
            "SingleSource/Benchmarks/Shootout/objinst.c",
            "SingleSource/Benchmarks/Shootout/random.c",
            "SingleSource/Benchmarks/Shootout/sieve.c",
            "SingleSource/Benchmarks/Shootout/strcat.c",


            "SingleSource/Benchmarks/Shootout-C++/ackermann.cpp",
            # "SingleSource/Benchmarks/Shootout-C++/ary.cpp",
            # "SingleSource/Benchmarks/Shootout-C++/ary2.cpp",
            # "SingleSource/Benchmarks/Shootout-C++/ary3.cpp",
            "SingleSource/Benchmarks/Shootout-C++/fibo.cpp",
            # "SingleSource/Benchmarks/Shootout-C++/hash.cpp",
            # "SingleSource/Benchmarks/Shootout-C++/hash2.cpp",
            "SingleSource/Benchmarks/Shootout-C++/heapsort.cpp",
            "SingleSource/Benchmarks/Shootout-C++/hello.cpp",
            # "SingleSource/Benchmarks/Shootout-C++/lists.cpp",
            # "SingleSource/Benchmarks/Shootout-C++/lists1.cpp",
            "SingleSource/Benchmarks/Shootout-C++/matrix.cpp",
            "SingleSource/Benchmarks/Shootout-C++/methcall.cpp",
            # "SingleSource/Benchmarks/Shootout-C++/moments.cpp",
            "SingleSource/Benchmarks/Shootout-C++/nestedloop.cpp",
            "SingleSource/Benchmarks/Shootout-C++/objinst.cpp",
            "SingleSource/Benchmarks/Shootout-C++/random.cpp",
            # "SingleSource/Benchmarks/Shootout-C++/reversefile.cpp",
            # "SingleSource/Benchmarks/Shootout-C++/sieve.cpp",
            # "SingleSource/Benchmarks/Shootout-C++/spellcheck.cpp",
            "SingleSource/Benchmarks/Shootout-C++/strcat.cpp",
            "SingleSource/Benchmarks/Shootout-C++/sumcol.cpp",
            "SingleSource/Benchmarks/Shootout-C++/wc.cpp",



            # "SingleSource/Benchmarks/McGill/chomp.c", # run time error, memory access wrong
            "SingleSource/Benchmarks/McGill/exptree.c",
            "SingleSource/Benchmarks/McGill/misr.c",
            "SingleSource/Benchmarks/McGill/queens.c",
            ]

def compile_sources(clang_path, test_dir, extra_args):
    # Build the full compile command

    exe_list = []
    error_list = []
    for file in test_files:
        output_name = "_".join(file.split("/")).removesuffix(".c").removesuffix(".cpp")
        if file.endswith(".c"):
            base_cmd = f"{clang_path} {" ".join(extra_args)} {" ".join(extra_flags)} "
        else:
            base_cmd = f"{clang_path}++ {" ".join(extra_args)} {" ".join(extra_flags)} "
        cmd = f"{base_cmd} {test_dir}/{file} -o {output_name}"
        print(cmd)
        try:
            subprocess.run(cmd, check=True, shell=True)
            exe_list.append(output_name)
        except subprocess.CalledProcessError as e:
            print(f"Compilation failed: {e}")
            error_list.append(output_name)

    return exe_list, error_list

def run_sources(test_dir, exe_list):
    for file in exe_list:
        cmd = f"hyperfine \"wasmtime {file}\" -r 2"
        print(cmd)
        try:
            subprocess.run(cmd, check=True, shell=True)
        except subprocess.CalledProcessError as e:
            print(f"Execution failed: {e}")

def clean_sources(test_dir, exe_list):
    for file in exe_list:
        cmd = f"rm {file}"
        print(cmd)
        try:
            subprocess.run(cmd, check=True, shell=True)
        except subprocess.CalledProcessError as e:
            print(f"Execution failed: {e}")


def main():
    parser = argparse.ArgumentParser(description="Compile an LLVM test suite"
                                     "file with custom Clang and arguments.")
    parser.add_argument('--clang', required=True, help='Paths to web assembly clang binary for comparison')
    parser.add_argument('--suite-dir', required=True, help='Path to LLVM test suite')
    parser.add_argument('--extra-args', nargs='*', default=[], help=f'Extra compiler arguments (except {extra_flags})')
    args = parser.parse_args()

    # Ensure the test file exists
    if not os.path.isdir(args.suite_dir):
        print("Error: llvm-test-suite dir not found")
        sys.exit(1)
    print("---- COMPILING FILES")
    exe_list, error_list = compile_sources(args.clang, args.suite_dir, args.extra_args)
    print("---- RUNNING EXE FILES")
    run_sources(args.suite_dir, exe_list)
    print("---- CLEANING UP FILES")
    clean_sources(args.suite_dir, exe_list)

if __name__ == "__main__":
    main()
