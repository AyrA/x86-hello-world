;This is where BIOS loads our code in memory
org 7c00h

;We need to clear some registers for real hardware
;QEMU has this already done, but some real PCs don't.
;You can only move data from a register to ds and es.
init:
        xor ax, ax
        mov ds, ax
        mov es, ax

;Initialize required registers for string printing
setstring:
        ;First character of message
        mov si,text
        ;BIOS call to putchar()
        mov ah,0eh

;String print loop
print:
        ;mov al,[si]
        ;inc si
        ;Of course there's a command in x86 for this.
        lodsb
        ;Check for null and exit loop
        cmp al,0
        je done
        ;Not null, so print character and repeat
        int 10h
        jmp print

;End execution. We could also jump to "setstring" again for a loop
done:
        hlt

;String to print. Must end in null. Linebreak is optional
text:
        db "Hello, World!",13,10,0

;Add magic number to mark this as bootable
bootsect:
        ;Write zeros until binary is 510 bytes
        ;The formula subtracts space already in use by the code.
        ;It also takes the "org" at the beginning into account.
        db (init+510-bootsect) dup 0
        ;Write 55,AA to mark as bootable and be exactly 512 bytes.
        db 55h,0AAh