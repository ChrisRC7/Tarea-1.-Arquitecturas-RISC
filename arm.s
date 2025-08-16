    .data
cadena: .asciz "cadena"

    .text
    .global _start

_start:
    LDR r0, =cadena     @ r0 = inicio
    LDR r1, =cadena     @ r1 = para calcular longitud

@ strlen
len_loop:
    LDRB r2, [r1]
    CMP r2, #0
    BEQ len_found
    ADD r1, r1, #1
    B len_loop

len_found:
    SUB r1, r1, #1      @ r1 apunta al último carácter

@ Invertir
reverse_loop:
    CMP r1, r0
    BLT done

    LDRB r2, [r0]       @ byte inicio
    LDRB r3, [r1]       @ byte fin
    STRB r3, [r0]       @ escribir fin en inicio
    STRB r2, [r1]       @ escribir inicio en fin

    ADD r0, r0, #1      @ mover inicio
    SUB r1, r1, #1      @ mover fin
    B reverse_loop
done:
    B done
