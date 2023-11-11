print:
		pusha
		ploop:
		  mov ah,0x0e
		  mov al,[bx]
		  int 0x10
		  add bx,1
		  cmp [bx],byte 0
		  jne ploop
		popa
		ret


