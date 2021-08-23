;This is where BIOS loads our code in memory
org 7c00h
init:
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

;End execution. We could also jump to "init" again for a loop
done:
        hlt

;String to print. Must end in null. Linebreak is optional
text:
        db "Hello, World!",13,10,0

;Add magic number to mark this as bootable
boot:
        ;Write zeros until binary is 510 bytes
        ;The formula subtracts space already in use by the code.
        db (init+510-boot) dup 0
        ;Write 55,AA to mark as bootable and be exactly 512 bytes.
        db 55h,0AAh