%include "../include/io.mac"

; declare your structs here
    struc request
        .admin: resb 1
        .prio: resb 1
        .passkey: resw 1
        .username: resb 51
    endstruc

section .data
    aux dd 0

section .text
    global check_passkeys
    extern printf

check_passkeys:
    ;; DO NOT MODIFY
    enter 0, 0
    pusha

    mov ebx, [ebp + 8]      ; requests
    mov ecx, [ebp + 12]     ; length
    mov eax, [ebp + 16]     ;
    ;; DO NOT MODIFY

    ;; Your code starts here

    mov esi, 0

; iterate with esi through the structs

loop_passk:

    cmp esi, [ebp + 12]
    je end

    ; keep in edx the current passkey

    mov ecx, request_size
    imul ecx, esi
    mov edx, [ebx + ecx + request.passkey]

    ; check the case where the first or last bit 
    ; is not 1

    test edx, 1
    jz not_hacker

    mov ecx, edx
    shr ecx, 15
    test ecx, 1
    jz not_hacker

    mov ecx, edx
    shr ecx, 8
    mov edi, 0

    ; count in edi the number of bits that are 1 
    ; in the significant half

    test ecx, 1
    jz move1
    add edi, 1

move1:
    shr ecx, 1

    test ecx, 1
    jz move2
    add edi, 1

move2:
    shr ecx, 1

    test ecx, 1
    jz move3
    add edi, 1

move3:
    shr ecx, 1

    test ecx, 1
    jz move4
    add edi, 1

move4:
    shr ecx, 1

    test ecx, 1
    jz move5
    add edi, 1

move5:
    shr ecx, 1

    test ecx, 1
    jz move6
    add edi, 1

move6:
    shr ecx, 1

    test ecx, 1
    jz move7
    add edi, 1

move7:
    shr ecx, 1

    test ecx, 1
    jz move8
    add edi, 1

move8:
    shr ecx, 1

    test edi, 1
    jnz not_hacker

    mov ecx, edx
    shl ecx, 8
    shr ecx, 8
    mov edi, 0

    ; count in edi the number of bits that are 1 
    ; in the least significant half

    test ecx, 1
    jz jump1
    add edi, 1

jump1:
    shr ecx, 1

    test ecx, 1
    jz jump2
    add edi, 1

jump2:
    shr ecx, 1

    test ecx, 1
    jz jump3
    add edi, 1

jump3:
    shr ecx, 1

    test ecx, 1
    jz jump4
    add edi, 1

jump4:
    shr ecx, 1

    test ecx, 1
    jz jump5
    add edi, 1

jump5:
    shr ecx, 1

    test ecx, 1
    jz jump6
    add edi, 1

jump6:
    shr ecx, 1

    test ecx, 1
    jz jump7
    add edi, 1

jump7:
    shr ecx, 1

    test ecx, 1
    jz jump8
    add edi, 1

jump8:
    shr ecx, 1

    test edi, 1
    jz not_hacker

    mov byte [eax], 1
    inc eax
    inc esi
    jmp loop_passk

not_hacker:
    mov byte [eax], 0
    inc eax
    inc esi
    jmp loop_passk
    

end:
    xor ecx, ecx
    ;; Your code ends here

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY