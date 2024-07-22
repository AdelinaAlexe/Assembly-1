%include "../include/io.mac"

extern printf
extern position
global solve_labyrinth

; you can declare any helper variables in .data or .bss

section .data
    line dd 0
    col dd 0
    endl dd 0
    endc dd 0

section .text

; void solve_labyrinth(int *out_line, int *out_col, int m, int n, char **labyrinth);
solve_labyrinth:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     eax, [ebp + 8]  ; unsigned int *out_line, pointer to structure containing exit position
    mov     ebx, [ebp + 12] ; unsigned int *out_col, pointer to structure containing exit position
    mov     ecx, [ebp + 16] ; unsigned int m, number of lines in the labyrinth
    mov     edx, [ebp + 20] ; unsigned int n, number of colons in the labyrinth
    mov     esi, [ebp + 24] ; char **a, matrix represantation of the labyrinth
    ;; DO NOT MODIFY
   
    ;; Freestyle starts here

    ; variables for current line and column
    ; and for number of lines and columns

    mov dword [line], 0
    mov dword [col], 0
    mov dword [endl], ecx
    sub dword [endl], 1
    mov dword [endc], edx
    sub dword [endc], 1

; loop through the elements in the matrix

loop:

    ; mark with 1 the current element
    ; so that it will never come back
    ; to this position

    xor ecx, ecx
    xor edx, edx
    mov ecx, [line]
    mov edx, [esi + 4 * ecx]
    mov ecx, [col]
    add edx, ecx
    mov byte [edx], 49

; check the element above

up: 
    cmp dword [line], 0
    je right
    sub dword [line], 1
    xor ecx, ecx
    xor edx, edx
    mov ecx, [line]
    mov edx, [esi + 4 * ecx]
    mov ecx, [col]
    add edx, ecx

    xor ecx, ecx
    mov cl, byte [edx]
    cmp cl, 48
    je reloop
    add dword [line], 1

; check the element in the right

right:
    add dword [col], 1
    xor ecx, ecx
    xor edx, edx
    mov ecx, [line]
    mov edx, [esi + 4 * ecx]
    mov ecx, [col]
    add edx, ecx

    xor ecx, ecx
    mov cl, byte [edx]
    cmp cl, 48
    je reloop
    sub dword [col], 1

; check the element below

down:
    add dword [line], 1
    xor ecx, ecx
    xor edx, edx
    mov ecx, [line]
    mov edx, [esi + 4 * ecx]
    mov ecx, [col]
    add edx, ecx

    xor ecx, ecx
    mov cl, byte [edx]
    cmp cl, 48
    je reloop
    sub dword [line], 1

; check the element in the left

left:
    cmp dword [col], 0
    je reloop
    sub dword [col], 1
    xor ecx, ecx
    xor edx, edx
    mov ecx, [line]
    mov edx, [esi + 4 * ecx]
    mov ecx, [col]
    add edx, ecx

    xor ecx, ecx
    mov cl, byte [edx]
    cmp cl, 48
    je reloop
    add dword [col], 1
    
reloop:

    ; if either the line or column is the last
    ; it's the end of the labyrinth

    xor ecx, ecx
    mov ecx, dword [line]
    cmp ecx, dword [endl]
    je end2
    xor ecx, ecx
    mov ecx, dword [col]
    cmp ecx, dword [endc]
    je end2
    jmp loop

end2:
    xor ecx, ecx
    mov ecx, dword [line]
    mov dword [eax], ecx
    xor ecx, ecx
    mov ecx, dword [col]
    mov dword [ebx], ecx

    ;; Freestyle ends here
end:
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
