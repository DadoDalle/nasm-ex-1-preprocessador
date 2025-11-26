# Tarefa 1: Simulação de `for` em NASM (Assembly x86)

Este repositório contém a solução para a **Tarefa 1 de Pré-processador** da disciplina de Software Básico. O objetivo é implementar macros que simulem o comportamento da estrutura de repetição `for` da linguagem C dentro do Assembly NASM, permitindo o uso de loops aninhados de forma intuitiva.

## 📋 Descrição

O projeto utiliza o pré-processador do NASM para traduzir uma sintaxe de alto nível para instruções de baixo nível (`cmp`, `jmp`, rótulos).

As principais características da implementação são:
* **Sintaxe estilo C:** `for {inicialização}, {comparação}, condição_salto, {incremento}`.
* **Suporte a aninhamento:** Utiliza a *Pilha de Contexto* (`%push`, `%pop`) para permitir loops dentro de loops sem conflito de rótulos.
* **Integração com C:** Utiliza a biblioteca `asm_io` (Paul Carter) e um driver em C para facilitar a entrada e saída de dados.

## 📂 Estrutura de Arquivos

* `macros.inc`: Arquivo contendo a definição das macros `%macro for` e `%macro endfor`.
* `tarefa1.asm`: Código principal em Assembly que demonstra o uso das macros (loops aninhados).
* `asm_io.asm` / `asm_io.inc`: Biblioteca auxiliar para I/O simplificado.
* `driver.c`: Programa em C que inicializa o ambiente e chama a função Assembly (`asm_main`).
* `cdecl.h`: Cabeçalho para compatibilidade de convenção de chamada C/Assembly.

## 🚀 Pré-requisitos

Para compilar e executar este projeto, você precisará de:

1.  **NASM**: Montador Assembly (certifique-se de que está no PATH do sistema).
2.  **GCC (MinGW no Windows)**: Compilador C com suporte a 32-bits (multilib).
3.  **VS Code** (Opcional): Recomendado para edição e terminal integrado.

## 🛠️ Como Compilar e Executar

Este projeto foi desenvolvido para arquitetura **32-bits** (x86). Siga as instruções de acordo com seu sistema operacional.

### Opção 1: Windows (PowerShell)
```powershell
# 1. Montar o arquivo principal
nasm -f win32 tarefa1.asm -o tarefa1.obj

# 2. Montar a biblioteca auxiliar
nasm -f win32 asm_io.asm -o asm_io.obj

# 3. Compilar o driver em C e ligar (link) tudo
gcc -m32 -o tarefa1.exe driver.c tarefa1.obj asm_io.obj

# 4. Executar
.\tarefa1.exe
   
