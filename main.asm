TITLE Triangles						(main.asm)

INCLUDE Irvine32.inc
.data
prompt		BYTE "How many lines do you want? <1-26>", 0dh,0ah,0
inCount		DWORD ?
outCount	DWORD ?
.code
main PROC
	call Clrscr

	mov	 	edx,		OFFSET prompt	;moves the memory location of prompt into edx to use in writeString
	call 	writeString					;prints the message in prompt
	call 	readInt
	mov		ecx,		eax				;moves the number in eax into ecx to make it the count for the loop
	mov		inCount,	0				;inner loop count

	makeTriangle:
		mov outCount,	ecx				;saves count position for outter loop
		inc inCount						;increments count for the loop
		mov ecx,		inCount 		;starts the counter for the first nested loop
		mov al, 		'A'				;moves 'A' character to al register to use for WriteChar procedure	
		
		normalOrder:
			call 	WriteChar		;prints a character inside the al register
			inc 	al				;increments al to print the next letter
		LOOP normalOrder
		
		mov bl,		al				;saves letter character value
		mov ecx, 	outCount		;restores outcount to be used by the second inner loop
		mov edx,	ecx
		add ecx,	edx				;adds the count by itself to create count for spaces loop
		
		spaces:						;adds spaces
			mov	al,	' '				
			call	WriteChar
		LOOP spaces
		
		mov al, 	bl				;restores the value from NormalOrder
		mov ecx, 	inCount			;creates count for third inner loop
		
		reversed:
			dec 	al				;reverses characters
			call 	WriteChar		;prints the character in reverse order
		LOOP reversed
		
		mov	ecx,	outCount		;restores the position of the outer loop
		call CRLF
	LOOP makeTriangle
	exit
main ENDP
END main
