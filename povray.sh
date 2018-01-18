#!/bin/sh

while read line; do
if [ ${#line} -gt 2 ]
then
    echo "!!! begin: FILE:"${line:0:${#line}-4}.bc
    clang -I. -DSPEC_CPU -DSPEC_CPU_LP64 -DSPEC_CPU_MACOSX -c -emit-llvm ${line:0:${#line}-4}.cpp -o ${line:0:${#line}-4}.bc
    ../bin/opt -load ../lib/LLVMMyPass.dylib -MyPassMou -MyPass < ${line:0:${#line}-4}.bc > ./new/n${line:0:${#line}-4}.bc
echo "XXX end: FILE:"${line:0:${#line}-4}.bc
fi
done< file.txt

