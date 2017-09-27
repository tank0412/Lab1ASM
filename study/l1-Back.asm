.686   
.model small
.stack
.data
Array DWORD 2,21,6,-17,10,21,-6,25,2,51,6,47,-10,51,6
Result DWORD 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
;Begin DWORD 1
;Finish DWORD 15
.code
main proc
   lea esi, Array
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   mov eax, [esi]
   m1:
   .IF (eax > 0)
   add esi, 4
   mov eax, esi
   loop m1
   .ENDIF   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   mov   ax,4c00h
   int   21h
main   endp
end main