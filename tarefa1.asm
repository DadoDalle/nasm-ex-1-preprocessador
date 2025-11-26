%include "asm_io.inc"
%include "macros.inc"

segment .data
    ; Mensagens para identificar cada teste
    msg_less    db "1. Teste for (i=0; i < 3; i++)  MENOR QUE (< 3) [Saida: jge]", 10, 0
    msg_le      db "2. Teste for (i=0; i <= 3; i++) MENOR OU IGUAL (<= 3) [Saida: jg]", 10, 0
    msg_greater db "3. Teste for (i=3; i > 0; i--)  MAIOR QUE (> 0) [Saida: jle]", 10, 0
    msg_ge      db "4. Teste for (i=3; i >= 0; i--) MAIOR OU IGUAL (>= 0) [Saida: jl]", 10, 0
    msg_ne      db "5. Teste for (i=0; i != 3; i++) DIFERENTE (!= 3) [Saida: je]", 10, 0
    msg_eq      db "6. Teste for (i=5; i == 5; i++) IGUAL (== 5) [Saida: jne]", 10, 0
    
    arrow       db "  -> i = ", 0
    separator   db "--------------------------------", 10, 0

segment .text
    global _asm_main

_asm_main:
    enter 0,0
    pusha

    ; ==================================================================
    ; 1. Lógica: i < 3 (Menor)
    ; Condição de Saída: Se i >= 3 (jge), saia.
    ; ==================================================================
    mov eax, msg_less
    call print_string

    for { mov ecx, 0 }, { cmp ecx, 3 }, jge, { inc ecx }
        mov eax, arrow
        call print_string
        mov eax, ecx
        call print_int
        call print_nl
    endfor
    
    mov eax, separator
    call print_string

    ; ==================================================================
    ; 2. Lógica: i <= 3 (Menor ou Igual)
    ; Condição de Saída: Se i > 3 (jg), saia.
    ; ==================================================================
    mov eax, msg_le
    call print_string

    for { mov ecx, 0 }, { cmp ecx, 3 }, jg, { inc ecx }
        mov eax, arrow
        call print_string
        mov eax, ecx
        call print_int
        call print_nl
    endfor

    mov eax, separator
    call print_string

    ; ==================================================================
    ; 3. Lógica: i > 0 (Maior) - Loop Decrescente
    ; Condição de Saída: Se i <= 0 (jle), saia.
    ; ==================================================================
    mov eax, msg_greater
    call print_string

    for { mov ecx, 3 }, { cmp ecx, 0 }, jle, { dec ecx }
        mov eax, arrow
        call print_string
        mov eax, ecx
        call print_int
        call print_nl
    endfor

    mov eax, separator
    call print_string

    ; ==================================================================
    ; 4. Lógica: i >= 0 (Maior ou Igual) - Loop Decrescente
    ; Condição de Saída: Se i < 0 (jl), saia.
    ; ==================================================================
    mov eax, msg_ge
    call print_string

    for { mov ecx, 3 }, { cmp ecx, 0 }, jl, { dec ecx }
        mov eax, arrow
        call print_string
        mov eax, ecx
        call print_int
        call print_nl
    endfor

    mov eax, separator
    call print_string

    ; ==================================================================
    ; 5. Lógica: i != 3 (Diferente)
    ; Condição de Saída: Se i == 3 (je), saia.
    ; ==================================================================
    mov eax, msg_ne
    call print_string

    for { mov ecx, 0 }, { cmp ecx, 3 }, je, { inc ecx }
        mov eax, arrow
        call print_string
        mov eax, ecx
        call print_int
        call print_nl
    endfor

    mov eax, separator
    call print_string

    ; ==================================================================
    ; 6. Lógica: i == 5 (Enquanto for Igual)
    ; Condição de Saída: Se i != 5 (jne), saia.
    ; Nota: Começa com 5. O corpo roda. Incrementa para 6. O teste falha e sai.
    ; ==================================================================
    mov eax, msg_eq
    call print_string

    for { mov ecx, 5 }, { cmp ecx, 5 }, jne, { inc ecx }
        mov eax, arrow
        call print_string
        mov eax, ecx
        call print_int
        call print_nl
    endfor

    mov eax, separator
    call print_string

    popa
    mov eax, 0
    leave
    ret