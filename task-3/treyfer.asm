section .rodata
	global sbox
	global num_rounds
	sbox db 126, 3, 45, 32, 174, 104, 173, 250, 46, 141, 209, 96, 230, 155, 197, 56, 19, 88, 50, 137, 229, 38, 16, 76, 37, 89, 55, 51, 165, 213, 66, 225, 118, 58, 142, 184, 148, 102, 217, 119, 249, 133, 105, 99, 161, 160, 190, 208, 172, 131, 219, 181, 248, 242, 93, 18, 112, 150, 186, 90, 81, 82, 215, 83, 21, 162, 144, 24, 117, 17, 14, 10, 156, 63, 238, 54, 188, 77, 169, 49, 147, 218, 177, 239, 143, 92, 101, 187, 221, 247, 140, 108, 94, 211, 252, 36, 75, 103, 5, 65, 251, 115, 246, 200, 125, 13, 48, 62, 107, 171, 205, 124, 199, 214, 224, 22, 27, 210, 179, 132, 201, 28, 236, 41, 243, 233, 60, 39, 183, 127, 203, 153, 255, 222, 85, 35, 30, 151, 130, 78, 109, 253, 64, 34, 220, 240, 159, 170, 86, 91, 212, 52, 1, 180, 11, 228, 15, 157, 226, 84, 114, 2, 231, 106, 8, 43, 23, 68, 164, 12, 232, 204, 6, 198, 33, 152, 227, 136, 29, 4, 121, 139, 59, 31, 25, 53, 73, 175, 178, 110, 193, 216, 95, 245, 61, 97, 71, 158, 9, 72, 194, 196, 189, 195, 44, 129, 154, 168, 116, 135, 7, 69, 120, 166, 20, 244, 192, 235, 223, 128, 98, 146, 47, 134, 234, 100, 237, 74, 138, 206, 149, 26, 40, 113, 111, 79, 145, 42, 191, 87, 254, 163, 167, 207, 185, 67, 57, 202, 123, 182, 176, 70, 241, 80, 122, 0
	num_rounds dd 10

section .text
	global treyfer_crypt
	global treyfer_dcrypt

; void treyfer_crypt(char text[8], char key[8]);
treyfer_crypt:
	;; DO NOT MODIFY
	push ebp
	mov ebp, esp
	pusha

	mov esi, [ebp + 8] ; plaintext
	mov edi, [ebp + 12] ; key	
	;; DO NOT MODIFY
	;; FREESTYLE STARTS HERE
	;; TODO implement treyfer_crypt

	; count in eax, number of rounds

	mov eax, 0
	
	; repeat the procedure num_rounds times

round:

	; applied the algorithm for each position from 0 to 7 

	; poz 0
	mov dl, byte [esi + 0]
	add dl, byte [edi + 0]
	cmp dx, 255
	jg sub11

c11:
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	add dl, byte [esi + 1]
	cmp dx, 255
	jg sub12

c12:
	rol dl, 1
	mov byte [esi + 1], dl
	jmp end1

sub11:
	sub dx, 256
	jg c11

sub12:
	sub dx, 256
	jg c12

end1:
	xor ecx, ecx
	xor edx, edx



	; poz 1
	mov dl, byte [esi + 1]
	add dl, byte [edi + 1]
	cmp dx, 255
	jg sub21

c21:
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	add dl, byte [esi + 2]
	cmp dx, 255
	jg sub22

c22:
	rol dl, 1
	mov byte [esi + 2], dl
	jmp end2

sub21:
	sub dx, 256
	jg c21

sub22:
	sub dx, 256
	jg c22

end2:
	xor ecx, ecx
	xor edx, edx



	; poz 2
	mov dl, byte [esi + 2]
	add dl, byte [edi + 2]
	cmp dx, 255
	jg sub31

c31:
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	add dl, byte [esi + 3]
	cmp dx, 255
	jg sub32

c32:
	rol dl, 1
	mov byte [esi + 3], dl
	jmp end3

sub31:
	sub dx, 256
	jg c31

sub32:
	sub dx, 256
	jg c32

end3:
	xor ecx, ecx
	xor edx, edx



	; poz 3
	mov dl, byte [esi + 3]
	add dl, byte [edi + 3]
	cmp dx, 255
	jg sub41

c41:
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	add dl, byte [esi + 4]
	cmp dx, 255
	jg sub42

c42:
	rol dl, 1
	mov byte [esi + 4], dl
	jmp end4

sub41:
	sub dx, 256
	jg c41

sub42:
	sub dx, 256
	jg c42

end4:
	xor ecx, ecx
	xor edx, edx



	; poz 4
	mov dl, byte [esi + 4]
	add dl, byte [edi + 4]
	cmp dx, 255
	jg sub51

c51:
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	add dl, byte [esi + 5]
	cmp dx, 255
	jg sub52

c52:
	rol dl, 1
	mov byte [esi + 5], dl
	jmp end5

sub51:
	sub dx, 256
	jg c51

sub52:
	sub dx, 256
	jg c52

end5:
	xor ecx, ecx
	xor edx, edx



	; poz 5
	mov dl, byte [esi + 5]
	add dl, byte [edi + 5]
	cmp dx, 255
	jg sub61

c61:
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	add dl, byte [esi + 6]
	cmp dx, 255
	jg sub62

c62:
	rol dl, 1
	mov byte [esi + 6], dl
	jmp end6

sub61:
	sub dx, 256
	jg c61

sub62:
	sub dx, 256
	jg c62

end6:
	xor ecx, ecx
	xor edx, edx



	; poz 6
	mov dl, byte [esi + 6]
	add dl, byte [edi + 6]
	cmp dx, 255
	jg sub71

c71:
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	add dl, byte [esi + 7]
	cmp dx, 255
	jg sub72

c72:
	rol dl, 1
	mov byte [esi + 7], dl
	jmp end7

sub71:
	sub dx, 256
	jg c71

sub72:
	sub dx, 256
	jg c72

end7:
	xor ecx, ecx
	xor edx, edx


	; poz 7
	mov dl, byte [esi + 7]
	add dl, byte [edi + 7]
	cmp dx, 255
	jg sub81

c81:
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	add dl, byte [esi + 0]
	cmp dx, 255
	jg sub82

c82:
	rol dl, 1
	mov byte [esi + 0], dl
	jmp end8

sub81:
	sub dx, 256
	jg c81

sub82:
	sub dx, 256
	jg c82

end8:
	xor ecx, ecx
	xor edx, edx

	inc eax
	cmp eax, 10
	jl round


    	;; FREESTYLE ENDS HERE
	;; DO NOT MODIFY
	popa
	leave
	ret

; void treyfer_dcrypt(char text[8], char key[8]);
treyfer_dcrypt:
	;; DO NOT MODIFY
	push ebp
	mov ebp, esp
	pusha
	;; DO NOT MODIFY
	;; FREESTYLE STARTS HERE
	;; TODO implement treyfer_dcrypt

	mov esi, [ebp + 8] ; plaintext
	mov edi, [ebp + 12] ; key	

	; count in eax number of rounds

	mov eax, 0

	; repeat the procedure num_rounds times

round2:

	; applied the algorithm for positions from 7 to 0

	; poz7

	mov dl, byte [esi + 7]
	add dl, byte [edi + 7]
	cmp dx, 255
	jg subs81

a81:
	xor ecx, ecx
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	xor ecx, ecx
	mov cl, byte [esi + 0]
	ror cl, 1
	cmp cl, dl
	jl subs82
	sub cl, dl

a82:
	mov byte [esi + 0], cl
	jmp endd8

subs81:
	sub dx, 256
	jg a81

subs82:
	add cx, 256
	sub cx, dx
	jg a82

endd8:
	xor edx, edx
	xor ecx, ecx



	; poz6

	mov dl, byte [esi + 6]
	add dl, byte [edi + 6]
	cmp dx, 255
	jg subs71

a71:
	xor ecx, ecx
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	xor ecx, ecx
	mov cl, byte [esi + 7]
	ror cl, 1
	cmp cl, dl
	jl subs72
	sub cl, dl

a72:
	mov byte [esi + 7], cl
	jmp endd7

subs71:
	sub dx, 256
	jg a71

subs72:
	add cx, 256
	sub cx, dx
	jg a72

endd7:
	xor edx, edx
	xor ecx, ecx



	; poz5

	mov dl, byte [esi + 5]
	add dl, byte [edi + 5]
	cmp dx, 255
	jg subs61

a61:
	xor ecx, ecx
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	xor ecx, ecx
	mov cl, byte [esi + 6]
	ror cl, 1
	cmp cl, dl
	jl subs62
	sub cl, dl

a62:
	mov byte [esi + 6], cl
	jmp endd6

subs61:
	sub dx, 256
	jg a61

subs62:
	add cx, 256
	sub cx, dx
	jg a62

endd6:
	xor edx, edx
	xor ecx, ecx

	; poz4

	mov dl, byte [esi + 4]
	add dl, byte [edi + 4]
	cmp dx, 255
	jg subs51

a51:
	xor ecx, ecx
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	xor ecx, ecx
	mov cl, byte [esi + 5]
	ror cl, 1
	cmp cl, dl
	jl subs52
	sub cl, dl

a52:
	mov byte [esi + 5], cl
	jmp endd5

subs51:
	sub dx, 256
	jg a51

subs52:
	add cx, 256
	sub cx, dx
	jg a52

endd5:
	xor edx, edx
	xor ecx, ecx



	; poz3

	mov dl, byte [esi + 3]
	add dl, byte [edi + 3]
	cmp dx, 255
	jg subs41

a41:
	xor ecx, ecx
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	xor ecx, ecx
	mov cl, byte [esi + 4]
	ror cl, 1
	cmp cl, dl
	jl subs42
	sub cl, dl

a42:
	mov byte [esi + 4], cl
	jmp endd4

subs41:
	sub dx, 256
	jg a41

subs42:
	add cx, 256
	sub cx, dx
	jg a42

endd4:
	xor edx, edx
	xor ecx, ecx



	; poz2

	mov dl, byte [esi + 2]
	add dl, byte [edi + 2]
	cmp dx, 255
	jg subs31

a31:
	xor ecx, ecx
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	xor ecx, ecx
	mov cl, byte [esi + 3]
	ror cl, 1
	cmp cl, dl
	jl subs32
	sub cl, dl

a132:
	mov byte [esi + 3], cl
	jmp endd3

subs31:
	sub dx, 256
	jg a31

subs32:
	add cx, 256
	sub cx, dx
	jmp a132

endd3:
	xor edx, edx
	xor ecx, ecx



	; poz1

	mov dl, byte [esi + 1]
	add dl, byte [edi + 1]
	cmp dx, 255
	jg subs21

a21:
	xor ecx, ecx
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	xor ecx, ecx
	mov cl, byte [esi + 2]
	ror cl, 1
	cmp cl, dl
	jl subs22
	sub cl, dl

a22:
	mov byte [esi + 2], cl
	jmp endd2

subs21:
	sub dx, 256
	jg a21

subs22:
	add cx, 256
	sub cx, dx
	jg a22

endd2:
	xor edx, edx
	xor ecx, ecx



	; poz0

	mov dl, byte [esi + 0]
	add dl, byte [edi + 0]
	cmp dx, 255
	jg subs11

a11:
	xor ecx, ecx
	movzx ecx, dl
	mov dl, byte [sbox + ecx]
	xor ecx, ecx
	mov cl, byte [esi + 1]
	ror cl, 1
	cmp cl, dl
	jl subs12
	sub cl, dl

a12:
	mov byte [esi + 1], cl
	jmp endd1

subs11:
	sub dx, 256
	jg a11

subs12:
	add cx, 256
	sub cx, dx
	jg a12

endd1:
	xor edx, edx
	xor ecx, ecx

	inc eax
	cmp eax, 10
	jl round2


	;; FREESTYLE ENDS HERE
	;; DO NOT MODIFY
	popa
	leave
	ret

