.comm _x, 4, 4
.comm _y, 4, 4

main:
  pushl _x
  pushl $5
  popl %eax
  popl %ebx
  ... perform %ebx < %eax ...
  pushl result of comparison
  
  # test result of x < 5
  popl %eax
  cmp $0, %eax
  jne _iftrue0
  jmp _else0
  
_iftrue0:
  pushl _x
  pushl $1
  popl %eax
  popl %ebx
  ... perform x + 1
  pushl result of addition
  
  # perform x = x + 1
  popl %eax
  movl %eax, _x
  
  # completed true statements
  jmp _endif0
_else0:
  pushl _x
  pushl $5
  popl %eax
  popl %ebx
  ... perform x - 5
  pushl result of subtraction
  
  # perform x = x - 5
  popl %eax
  movl %eax, _x
  
  # evaluate y > x
  pushl _y
  pushl _x
  popl %eax
  popl %ebx
  ... perform y > x
  pushl result of comparison
  
  popl %eax
  cmpl $0, %eax
  jne _iftrue1
  jmp _else1
_iftrue1:
  pushl _y  # parameter to writeint call
  # from outACallStmt:
  call writeint
  addl 4, %esp
  
  jmp _endif1
_else1:
  # from outACallExpr
  call readint
  #addl 0, %esp 
  pushl %eax
  
  # from outAAssignStmt
  popl %eax
  movl %eax, _x
_endif1:
_endif0:

_while0:  # from caseAWhileStmt

  pushl _x   # from outAIdExpr
  pushl $5
  popl %eax
  popl %ebx
  ... perform x < 5
  pushl result
  
  # from caseAWhileStmt
  popl %eax
  cmpl $0, %eax
  jne _whilebody0
  jmp _endwhile0
_whilebody0:
  ... x = x + 1
  jmp _while0
_endwhile0


  
  
  
  