[bits 16]           ; 16 bit mode, because x86 real mode starts in 16 bit mode
[org 0x7c00]

start:
    mov ah, 0x0e    ; BIOS teletype output
    mov al, 'X'     ; Character to print
    int 0x10        ; BIOS video interrupt

    jmp $           ; Infinite loop to hang the CPU

times 510-($-$$) db 0   ; Padding
dw 0xaa55               ; Boot signature