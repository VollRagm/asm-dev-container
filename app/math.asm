global asm_add
section .text

; int asm_add(int a (edi), int b (esi))
asm_add:
    mov eax, edi    ; "int result = a;"
    add eax, esi    ; "result += b;"
    ret             ; "return result;"