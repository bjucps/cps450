// This grammar modified from https://github.com/antlr/grammars-v4/blob/master/tiny/tiny.g4
// Modifications by S. Schaub

/*
BSD License
Copyright (c) 2016, Tom Everett
All rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. Neither the name of Tom Everett nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

grammar Tiny;


program
   : 'BEGIN' stmt_list 'END'
   ;


stmt_list
   : stmt+
   ;

stmt
   : assign_stmt # AsmtStmt
   | read_stmt   # ReadStmt
   | write_stmt  # WriteStmt 
   ;

assign_stmt
   : ID ':=' expr
   ;

read_stmt
   : 'READ' id_list
   ;

write_stmt
   : 'WRITE' expr_list
   ;

id_list
   : ids+=ID (',' ids+=ID)*
   ;

expr_list
   : exprs+=expr (',' exprs+=expr)*
   ;

expr 
   : e1=expr mul_op e2=expr  # MulExpr
   | e1=expr add_op e2=expr  # AddExpr
   | term                    # TermExpr
   ;

term 
   : ID            # IdTerm
   | integer       # IntTerm
   | '(' expr ')'  # ParTerm
   ;

integer
   : '-'? NUMBER
   ;

add_op
   : '+'
   | '-'
   ;

mul_op
   : '*'
   | '/'
   ;



ID
   : ('a' .. 'z' | 'A' .. 'Z')+
   ;

NUMBER
   : ('0' .. '9')+
   ;

WS
   : [ \r\n] -> skip
   ;