global _start


_start:

section .data

     msg db "who are you? "

     length equ $ - msg 
     
     value db "programmer"
     
     msg2 db "equal"
     
     msg2_len equ $ - msg2
     
     msg3 db "not equal"
     
     msg3_len equ $ - msg3

section .bss
   
       name_input resb 16
section .text 

     call _print1 ; print first text

     call _getname  ; print second text

     call _check  ; go check 
     
     mov rax, 60         ; for syscall exit
     
     xor rdi, rdi       ; for exit wihout any error 
     
 
     
     syscall  ; linux kernel for system call 

    
_print1:
    mov rdi ,1   
   
    mov rax , 1

    mov rsi , msg

    mov rdx, length

    syscall 
    ret



_getname:
    mov rax , 0

    mov rsi,name_input

    mov rdx,16

    syscall 
    ret

_check:
    lea rsi, name_input ;  load evective address from the name_input to rsi register
    
    lea rdi , value  ;  load evective address from the value to rdi register
    
    mov rcx , 10  ; check first 10 characteres
    
    cld   ; make it forward and read all the input value

    repe cmpsb ;comparaison

    je _equal ; jump if values are  equal

    call _notequal  ; jump if values are not equal
    
    syscall   

    ret
_equal:
    mov rdi ,1
   
    mov rax , 1

    mov rsi , msg2

    mov rdx, msg2_len

    syscall 
    ret


_notequal:
    mov rdi ,1
   
    mov rax , 1

    mov rsi , msg3

    mov rdx, msg3_len

    syscall 
    ret