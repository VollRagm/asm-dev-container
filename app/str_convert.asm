global str_to_int
section .text

; System-V ABI:
; Arguments:    rdi, rsi, rdx, rcx, r8, r9
; Callee-saved: rbx, rbp, rsp, r12-r15          (Function that uses these when called must save and restore them)
; Caller-saved: rax, rcx, rdx, rsi, rdi, r8-r11 (Function that calls the other function must save these if it needs them after the call)

str_to_int:
    mov r11, rdi
    xor rdx, rdx

.strlen_count_start:
    mov byte al, [r11]
    cmp al, 0
    jz .continue_convert
    inc r11
    inc rdx
    jmp .strlen_count_start

.continue_convert:
    dec r11                  ; Point to the last character
    mov r8, 1                ; Multiplier variable
    xor r9, r9               ; Result

    test rdx, rdx            ; Check if string length is 0
    jz .done

.convert_loop_start:
    xor rax, rax
    mov byte al, [r11]
    sub eax, 48              ; Convert ASCII to integer value
    
    imul rax, r8             ; rax = digit * multiplier
    add r9, rax              ; Add to accumulator
    
    imul r8, 10
    dec r11         
    dec rdx
    jnz .convert_loop_start  

.done:
    mov rax, r9
    ret
    

