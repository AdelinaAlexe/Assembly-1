%include "../include/io.mac"

extern ant_permissions

extern printf
global check_permission

section .text

check_permission:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     eax, [ebp + 8]  ; id and permission
    mov     ebx, [ebp + 12] ; address to return the result
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    ; id of current ant
    mov ecx, eax
    shr ecx, 24
    and ecx, 0xFF

    ; rooms of current ant
    mov edx, eax
    shl edx, 8
    shr edx, 8

    ; found the permissions the current ant has
    xor eax, eax
    mov eax, dword[ant_permissions + ecx * 4]
    and eax, 0xFFFFFF

    mov dword[ebx], 1
    xor ecx, ecx
    mov ecx, 32

    ; loop through the bytes to see which rooms are available

test_byte:
    cmp ecx, 0
    je end
    dec ecx
    test edx, 1
    jz shift
    test eax, 1
    jnz shift
    mov dword[ebx], 0
    jmp end

shift:
    shr edx, 1
    shr eax, 1
    jmp test_byte

end: 
    xor ecx, ecx
    xor edx, edx
    xor eax, eax
    xor esi, esi
    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
