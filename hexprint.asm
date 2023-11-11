print_hex:
pusha

    mov CX, BX                          ; Save the original number to CX.

    mov SI, .alphabet                   ; Use SI as base for .alphabet array.

    shr BX, 12                          ; Get the first 4 bits of the original number (0x[1]234).
    mov AL, [BX + SI]                   ; Use it as index in the array of hexadecimal digits. Thus get the appropriate character.
    mov [.result + 2], AL               ; Copy the character to the output array.
                                        ; In other words, these instuctions mean result[2] = alphabet[BX].

    mov BX, CX                          ; Restore the original number.
    shr BX, 8                           ; Get the second 4 bits of the original number (0x1[2]34).
    and BX, 0x0F                        ; We have to apply mask 0x0F to the value in order to get exactly 4 bits.
    mov AL, [BX + SI]                   ; AL = alphabet[BX].
    mov [.result + 3], AL               ; result[3] = AL.

    mov BX, CX                          ; Restore the original number.
    shr BX, 4                           ; Get the third 4 bits of the original number (0x12[3]4).
    and BX, 0x0F                        ;
    mov AL, [BX + SI]                   ; AL = alphabet[BX].
    mov [.result + 4], AL               ; result[4] = AL.

    mov BX, CX                          ; Restore the original number.
    and BX, 0x0F                        ; Get the last 4 bits of the original number (0x123[4]).
    mov AL, [BX + SI]                   ; AL = alphabet[BX].
    mov [.result + 5], AL               ; result[5] = AL.

    mov BX, .result                     ; Print the result.
    call print                    ;

    popa
    ret

.alphabet:
    db '0123456789ABCDEF', 0x0

.result:
    db '0x0000', 0ah