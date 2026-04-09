global fill_bmp_buffer
section .text

; System-V ABI:
; Arguments:    rdi, rsi, rdx, rcx, r8, r9
; Callee-saved: rbx, rbp, rsp, r12-r15          (Function that uses these when called must save and restore them)
; Caller-saved: rax, rcx, rdx, rsi, rdi, r8-r11 (Function that calls the other function must save these if it needs them after the call)


; void fill_bmp_buffer(uint8_t* buffer (rdi))
fill_bmp_buffer:
    ret
    
