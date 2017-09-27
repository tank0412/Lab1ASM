.MODEL	small

STACK SEGMENT PARA STACK 'stack'
 	DB 100h DUP(?)
STACK ENDS

DATA SEGMENT PARA PUBLIC 'data'
	mas DW 2,21,6,-17,10,21,-6,25,2,51,6,47,-10,51,6
	res  DW 12 DUP(0)
	counter EQU 12
	second DW -2
DATA ENDS

CODE SEGMENT PARA PUBLIC 'code'
	ASSUME CS: CODE, DS: DATA, SS: STACK


;ЧАСТЬ 1: Обработка исходного массива
START:

		MOV	AX, DATA				; получить адрес DS
		MOV	DS, AX					; установить DS
     	MOV	CX, counter				; значение счетчика в CX
     	MOV	BX, OFFSET mas			; указатель текущего элемента массива OFFSET ЗАПИСАЛ АДРЕС
     	MOV	SI, DX					; указатель на место вставки элемента
     		     				
BEGIN:
		MOV	DX, mas[BX]
		CMP	DX, 0
		JGE	 	NEXT
		XCHG	DX, [SI]
		XCHG	DX, [BX]
		ADD		SI, 2						; увеличить указатель места вставки элемента

NEXT:
		ADD 	BX, 2					; увеличить указатель текущего элемента массива
		LOOP	BEGIN


;ЧАСТЬ 2: Формирование массива-результата
		MOV 	CX, counter				; восстанавливаем  значение счетчика
		XOR 	SI, SI					; обнуляем индекс начала массива
		MOV 	DX, mas[SI]

;Поиск минимального элемента массива, результат в DX
MAX:	CMP 	DX, mas[SI+2]
		JLE		CONTINUE
GREATER:
		MOV 	DX, mas[SI+2]
		JMP 	SHORT CONTINUE
CONTINUE:
		ADD		SI, 2
		LOOP	MAX

;Вычисление среднего арфимитического второго элемента и наименьшего элемента массива, DX,AX
		ADD		DX, second
		SAR		DX, 1

;Формирование массива-результата
		XOR		SI, SI
		XOR		DI, DI
		MOV	CX, counter
NXT:
		MOV	AX, mas[SI]
		CMP 	DX, AX
		JGE		CONT
INCERT:
		MOV 	res[DI], AX
		ADD		DI, 2
		JMP 	SHORT CONT
CONT:
		ADD		SI, 2
		LOOP	NXT

		MOV	AX, 4C00h				; the exit fuction  [4C+no error (00)]
		INT		21h						; call DOS interrupt 21h
CODE ENDS
	END START
