    .data
cadena: .ascii "cadena"

    .text
    .globl _start

_start:
    la t0, cadena       # t0 = dirección base de la cadena
    la t1, cadena       # t1 = dirección para encontrar final

# Longitud de la cadena
len_loop:
    lb t2, 0(t1)        # cargar byte
    beqz t2, len_found  # si es 0 -> fin
    addi t1, t1, 1
    j len_loop

len_found:
    addi t1, t1, -1     # t1 apunta al último carácter válido

# Invertir
reverse_loop:
    blt t1, t0, done    # si t1 < t0, fin

    lb t2, 0(t0)        # cargar byte de inicio
    lb t3, 0(t1)        # cargar byte de fin
    sb t3, 0(t0)        # escribir fin en inicio
    sb t2, 0(t1)        # escribir inicio en fin

    addi t0, t0, 1      # mover inicio adelante
    addi t1, t1, -1     # mover fin atrás
    j reverse_loop

done:
    # Loop infinito para detener ejecución
    j done
