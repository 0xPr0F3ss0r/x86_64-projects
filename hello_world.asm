
global _start


_start:
section  .data
    
    msg db "hello ,world" ;  define variable

    length equ $ - msg ; get the length of msg and store it in length variable



section .text
    ;start write the instrcutions of the program 
     
     mov rsi,msg  ; our message 

     mov rdx, length  ; put the length of message in rdx

     mov rdi, 1   ; file descriptor for write (stdout)

     mov rax,1   ;  use syscall write for rax which is 1

     syscall   ; linux kernel for system call 


     mov rdi, 0    ;  use 0 for exit wihout any eror
     mov rax , 60  ;  use 60 for syscall exit

     syscall   ; linux kernel for system call 