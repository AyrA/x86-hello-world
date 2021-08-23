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

This works on any media that has a 512 byte boot sector.
Including but not necessarily limited to:

- Floppy disks (this one I actually tested, yes you can still write floppies in Windows 10)
- Hard drive
- Flash drives

To get this to work, use a disk editor to overwrite the first 512 bytes of the disk with the boot image.
You can also use disk imaging software.
[Rufus](https://rufus.ie/) worked fine for me.
On linux, you can probably use `sudo dd if=/path/to/boot.bin of=/dev/something`.

Or just use qemu like a sane person.
Command for Windows:

    C:\Path\To\qemu-system-x86_64.exe -drive format=raw,file=C:\Path\To\boot.bin

## &#9888;&#65039; CAUTION &#9888;&#65039;

If you write this to your device you will essentially destroy the partition table and/or file system.
Do not write to an important device.
