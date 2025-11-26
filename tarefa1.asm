%include "asm_io.inc"
%include "macros.inc"   

segment .data
    msg_i db "Loop Externo i = ", 0
    msg_j db "   Loop Interno j = ", 0
    newline db 10, 0

segment .text
    global _asm_main

_asm_main:
    enter 0,0
    pusha

    ; --- FOR EXTERNO (i) ---
    ; Lógica: para i=0; enquanto i < 3; i++
    ; Em Assembly: cmp ecx, 3 -> se for maior ou igual (jge), SAIA.
    ;
    ; Param 1 (Init): { mov ecx, 0 }
    ; Param 2 (Comp): { cmp ecx, 3 }
    ; Param 3 (Exit): jge           <-- Note que passamos apenas a instrução de pulo
    ; Param 4 (Inc) : { inc ecx }
    
    for { mov ecx, 0 }, { cmp ecx, 3 }, jge, { inc ecx }
        
        mov eax, msg_i
        call print_string
        mov eax, ecx
        call print_int
        call print_nl

        ; --- FOR INTERNO (j) ---
        ; Lógica: para j=0; enquanto j < 2; j++
        ;
        for { mov ebx, 0 }, { cmp ebx, 2 }, jge, { inc ebx }
            
            mov eax, msg_j
            call print_string
            mov eax, ebx
            call print_int
            call print_nl
            
        endfor

    endfor

    popa
    mov eax, 0
    leave
    ret