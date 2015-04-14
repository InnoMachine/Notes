data SEGMENT
     msg DB 'Hello, world.$'
data ENDS
code SEGMENT
    ASSUME CS:code,DS:data		;段分配，伪指令——代码段寄存器cs与code关联；数据段寄存器ds与data关联
start:
    MOV AX,data
    MOV DS,AX
    lea dx,msg					;有效地址传送指令 LEA；将有效地址传送到指定的的寄存器
    mov ah,9h
    int 21h						;通过给AH寄存器赋值9H，然后调用INT 21H指令，显示字符串（DS:DX=串地址，'$'结束字符串）
    MOV AX,4C00h
    INT 21h 					;其实起作用的就是 AH=4CH，意思就是调用INT 21H的4CH中断，安全退出程序（其实这句等价于MOV AH,4CH 	INT 21H）
code ENDS
END start