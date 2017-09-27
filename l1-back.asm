.686   
.model small
.stack
.data
Array DWORD 2,21,6,-17,10,21,-6,25,2,51,6,47,-10,51,6
Result DWORD 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
TEMP DWORD 0
COUNT DWORD 0
SUM DWORD 0
ONE DWORD 1
TWO DWORD 2
.code
main proc
   mov esi, [Array]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   mov bx, 15
   m1:
   .IF (eax > 0)
   add esi, 4
   mov eax, esi
   mov cx, 15
   m2:
   .IF (ebx < 0)
   mov TEMP, eax
   ;mov edi, [Array]
   ;mov edi, ebx
   ; TODO
   add edi, 4
   mov ebx, edi
   .ENDIF  
   loop m2
   loop m1
   .ENDIF   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   mov esi, [Array]
   mov cx, 15
   m3:
   add esi, 4
   mov eax, esi
   add COUNT, ONE
   mov ax, COUNT
   div TWO
   .IF (ah = 0)
   add SUM, eax
   .ENDIF  
   loop m3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   mov   ax,4c00h
   int   21h
main   endp
end main