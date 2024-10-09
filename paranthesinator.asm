; Interpret as 32 bits code
[bits 32]

%include "../include/io.mac"

section .text
; int check_parantheses(char *str)
global check_parantheses
check_parantheses:
    push ebp
    mov ebp, esp

    ; sa-nceapa concursul

    ; load the pointer to the beginning of the string
    mov esi, [ebp + 8]

check_loop:
    ; load the current character
    mov al, [esi]
    ; if I reach the end of the string, exit
    cmp al, 0
    je check_end

    ; check if the character is an open parenthesis (put it on the stack)
    cmp al, '('
    je push_paranthesis
    cmp al, '['
    je push_paranthesis
    cmp al, '{'
    je push_paranthesis

    ; check if the character is a closed parenthesis (remove it from the stack)
    cmp al, ')'
    je pop_round
    cmp al, ']'
    je pop_square
    cmp al, '}'
    je pop_curly

push_paranthesis:
    ; put the open parenthesis on the stack
    push eax
    jmp next_char

pop_round:
    ; if the stack is empty, it is a mismatch
    cmp esp, ebp
    je mismatch
    ; pop out of the stack and check the correspondent for the round bracket
    pop eax
    cmp al, '('
    je next_char
    jmp mismatch

pop_square:
    ; if the stack is empty, it is a mismatch
    cmp esp, ebp
    je mismatch
    ; pop out of the stack and check the correspondent for the square bracket
    pop eax
    cmp al, '['
    je next_char
    jmp mismatch

pop_curly:
    ; if the stack is empty, it is a mismatch
    cmp esp, ebp
    je mismatch
    ; pop out of the stack and check the correspondent for the brace
    pop eax
    cmp al, '{'
    je next_char
    jmp mismatch

next_char:
    ; move to the next character
    inc esi
    jmp check_loop

check_end:
    ; check if the stack is empty
    cmp esp, ebp
    jne not_empty
    ; if stack is empty, return 0 (all parentheses match)
    mov eax, 0
    jmp check_return

not_empty:
    ; if stack is not empty, return 1 (it's wrong)
    mov eax, 1

mismatch:
    ; if there is a mismatch, return 1 (it's wrong)
    mov eax, 1

check_return:

    leave
    ret
