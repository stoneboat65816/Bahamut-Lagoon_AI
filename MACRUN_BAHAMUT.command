#!/bin/bash
cd "$(dirname "$0")"

cp BAHAMUT_ROM/00.sfc BAHAMUT_ROM/01.sfc
wine "TOOL/xkas.exe" -o "BAHAMUT_ROM/01.sfc" "BAHAMUT_ASM/Bahamut_main.asm"