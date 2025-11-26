; =============================================================
; MACROS PARA SIMULAR O COMANDO FOR (Versão Corrigida v2)
; =============================================================

; Sintaxe: for <inicializacao>, <comparacao>, <salto_saida>, <incremento>
; Exemplo: for { mov ecx, 0 }, { cmp ecx, 3 }, jge, { inc ecx }
;
; OBS: Usar chaves { } com ESPAÇOS internos para evitar erros de token.

%macro for 4
    %push for_loop          ; 1. Cria contexto
    
    %1                      ; 2. Inicialização (ex: mov ecx, 0)
    
    %$begin:                ; 3. Rótulo de início
    
    %2                      ; 4. Comparação (ex: cmp ecx, 3)
    
    %3 %$exit               ; 5. Condição de Saída (ex: jge %$exit)
                            ;    O NASM expande para: jge ..@..exit

    %define %$inc %4        ; 6. Guarda o incremento para o final
%endmacro

%macro endfor 0
    %ifctx for_loop
        %$inc               ; 1. Executa incremento
        jmp %$begin         ; 2. Volta para o início
        
        %$exit:             ; 3. Rótulo de saída
        
        %pop                ; 4. Limpa contexto
    %else
        %error "Erro: 'endfor' sem 'for'"
    %endif
%endmacro