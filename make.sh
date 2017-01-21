#!/bin/bash

./binary/fasm -D__random_seed__=$[RANDOM+(RANDOM<<16)+(RANDOM<<32)+(RANDOM<<48)]  "newdawn.fasm" "./binary/newdawn" 2>&1 | tee "./output/newdawn.log"
hexdump -e '1/32 "%08_ax"" | "' -e '32/1 "%02X "" | "' -e '32/1 "%c""\n"' "./binary/newdawn"
objdump -D -Mintel,x86-64 -b binary -m i386 "./binary/newdawn" --start-address=0x0 -z

