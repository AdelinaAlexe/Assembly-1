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
    aux2 dd 0

section .text
    global sort_requests
    extern printf

sort_requests:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov ebx, [ebp + 8]      ; requests
    mov ecx, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here
   
    xor eax, eax
    xor edx, edx
    xor ecx, ecx
    mov esi, 0

    ; 2 loops to compare the structs
    ; esi is the index of current structs
    ; edi is the index of each of the next structs

compare1:
    cmp esi, [ebp + 12]
    je end
    mov edi, esi
    add edi, 1

compare2:
    cmp edi, [ebp + 12]
    je inc1

    xor ecx, ecx
    xor eax, eax
    xor edx, edx

    ; compare request.admin

    mov ecx, request_size
    imul ecx, esi
    mov al, byte [ebx + ecx + request.admin]
    mov ecx, request_size
    imul ecx, edi
    mov dl, byte [ebx + ecx + request.admin]

    cmp al, dl
    je compare3

    cmp al, dl
    jl switch
    jmp inc2

; label to switch 2 structs, field by field

switch:
    mov ecx, request_size
    imul ecx, esi
    mov eax, [ebx + ecx + request.admin]
    mov ecx, request_size
    imul ecx, edi
    mov edx, [ebx + ecx + request.admin]
    mov [ebx + ecx + request.admin], eax
    mov ecx, request_size
    imul ecx, esi
    mov [ebx + ecx + request.admin], edx

    mov ecx, request_size
    imul ecx, esi
    add ecx, 1
    mov eax, [ebx + ecx + request.prio]
    mov ecx, request_size
    imul ecx, edi
    add ecx, 1
    mov edx, [ebx + ecx + request.prio]
    mov [ebx + ecx + request.prio], eax
    mov ecx, request_size
    imul ecx, esi
    add ecx, 1
    mov [ebx + ecx + request.prio], edx

    mov ecx, request_size
    imul ecx, esi
    mov eax, [ebx + ecx + request.passkey]
    mov ecx, request_size
    imul ecx, edi
    mov edx, [ebx + ecx + request.passkey]
    mov [ebx + ecx + request.passkey], eax
    mov ecx, request_size
    imul ecx, esi
    mov [ebx + ecx + request.passkey], edx

    mov ecx, 50

; loop to switch the admin fields, character by character

string:

    mov dword [aux], ecx
    dec dword [aux]

    mov ecx, request_size
    imul ecx, esi
    add ecx, dword [aux]
    mov al, byte [ebx + ecx + request.username]
    mov ecx, request_size
    imul ecx, edi
    add ecx, dword [aux]
    mov dl, byte [ebx + ecx + request.username]
    mov byte [ebx + ecx + request.username], al
    mov ecx, request_size
    imul ecx, esi
    add ecx, dword [aux]
    mov byte [ebx + ecx + request.username], dl

    inc dword [aux]
    mov ecx, dword [aux]
    loop string

    jmp inc2

; compare prio fields

compare3:
    xor eax, eax
    xor edx, edx
    xor ecx, ecx

    mov ecx, request_size
    imul ecx, esi
    mov al, byte [ebx + ecx + request.prio]
    mov ecx, request_size
    imul ecx, edi
    mov dl, byte [ebx + ecx + request.prio]

    cmp ax, dx
    je compare4

    cmp ax, dx
    jg switch
    jmp inc2

; compare username

compare4:

    mov dword [aux], 0
    xor eax, eax
    xor edx, edx
    xor ecx, ecx

    mov ecx, request_size
    imul ecx, esi
    add ecx, dword [aux]
    mov al, byte [ebx + ecx + request.username]
    mov ecx, request_size
    imul ecx, edi
    add ecx, dword [aux]
    mov dl, byte [ebx + ecx + request.username]

    cmp al, dl
    jg switch

    cmp al, dl
    jl inc2

    mov eax, 0

; loop to compare usernames character by character

loopusn:
    inc eax
    cmp eax, 50
    je inc2

    mov dword [aux], eax

    xor eax, eax
    xor edx, edx
    xor ecx, ecx

    mov ecx, request_size
    imul ecx, esi
    add ecx, dword [aux]
    mov al, byte [ebx + ecx + request.username]
    mov ecx, request_size
    imul ecx, edi
    add ecx, dword [aux]
    mov dl, byte [ebx + ecx + request.username]

    cmp al, dl
    jg switch

    cmp al, dl
    jl inc2 

    mov eax, dword [aux]
    jmp loopusn

    jmp inc2

; increasing the 2 indexes

inc1:
    inc esi
    jmp compare1

inc2:
    inc edi
    jmp compare2

end:
    xor eax, eax
    ;; Your code ends here

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY