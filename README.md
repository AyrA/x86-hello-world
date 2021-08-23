# Hello world for x86

"Hello World" for x86.
Doesn't needs an operating system.
Uses BIOS routines to print the string, then just freezes.
Prints the full string (with comma and exclamation mark),
as well as a line break.

# Binary

A precompiled binary is provided in the releases section.

# Building

Open in [flat assembler](http://flatassembler.net/), press CTRL+F9

# Running

Copy to a floppy disk or hard disk boot sector.
Or use qemu like a sane person.
Command for Windows:

    C:\Path\To\qemu-system-x86_64.exe -drive format=raw,file=C:\Path\To\boot.bin

