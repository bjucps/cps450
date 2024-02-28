	.386p
	ifdef ??version
	if    ??version GT 500H
	.mmx
	endif
	endif
	model flat
	ifndef	??version
	?debug	macro
	endm
	endif
	?debug	S "polydemo.cpp"
	?debug	T "polydemo.cpp"
_TEXT	segment dword public use32 'CODE'
_TEXT	ends
_DATA	segment dword public use32 'DATA'
_DATA	ends
_BSS	segment dword public use32 'BSS'
_BSS	ends
DGROUP	group	_BSS,_DATA
_TEXT	segment dword public use32 'CODE'
@Parent@initP$qi	segment virtual
@@Parent@initP$qi	proc	near
?live16385@0:
   ;	
   ;	Parent *Parent::initP(int newX) {
   ;	
	push      ebp
	mov       ebp,esp
	mov       eax,dword ptr [ebp+8]
   ;	
   ;	    x = newX;
   ;	
?live16385@16: ; EAX = this
@1:
	mov       edx,dword ptr [ebp+12]
	mov       dword ptr [eax+4],edx
   ;	
   ;	    return this;
   ;	
   ;	
   ;	}
   ;	
?live16385@48: ; 
@3:
@2:
	pop       ebp
	ret 
@@Parent@initP$qi	endp
@Parent@initP$qi	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@Parent@foo$qv	segment virtual
@@Parent@foo$qv	proc	near
?live16386@0:
   ;	
   ;	void Parent::foo() {
   ;	
	push      ebp
	mov       ebp,esp
	mov       eax,dword ptr [ebp+8]
   ;	
   ;	    printf("%d\n", x);
   ;	
?live16386@16: ; EAX = this
@4:
	push      dword ptr [eax+4]
	push      offset s@
	call      @_printf
	add       esp,8
   ;	
   ;	}
   ;	
?live16386@32: ; 
@5:
	pop       ebp
	ret 
@@Parent@foo$qv	endp
@Parent@foo$qv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@Parent@getX$qv	segment virtual
@@Parent@getX$qv	proc	near
?live16387@0:
   ;	
   ;	int Parent::getX() {
   ;	
	push      ebp
	mov       ebp,esp
	mov       eax,dword ptr [ebp+8]
   ;	
   ;	    return x;
   ;	
?live16387@16: ; EAX = this
@6:
	mov       eax,dword ptr [eax+4]
   ;	
   ;	}
   ;	
?live16387@32: ; 
@8:
@7:
	pop       ebp
	ret 
@@Parent@getX$qv	endp
@Parent@getX$qv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@Child@initC$qii	segment virtual
@@Child@initC$qii	proc	near
?live16388@0:
   ;	
   ;	Child *Child::initC(int newX, int newY) {
   ;	
	push      ebp
	mov       ebp,esp
	push      ebx
	mov       ebx,dword ptr [ebp+8]
   ;	
   ;	    initP(newX);
   ;	
?live16388@16: ; EBX = this
@9:
	push      dword ptr [ebp+12]
	push      ebx
	mov       eax,dword ptr [ebx]
	call      dword ptr [eax]
	add       esp,8
   ;	
   ;	    y = newY;
   ;	
	mov       edx,dword ptr [ebp+16]
	mov       dword ptr [ebx+8],edx
   ;	
   ;	    return this;
   ;	
	mov       eax,ebx
   ;	
   ;	}
   ;	
?live16388@64: ; 
@11:
@10:
	pop       ebx
	pop       ebp
	ret 
@@Child@initC$qii	endp
@Child@initC$qii	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@Child@getY$qv	segment virtual
@@Child@getY$qv	proc	near
?live16389@0:
   ;	
   ;	int Child::getY() {
   ;	
	push      ebp
	mov       ebp,esp
	mov       eax,dword ptr [ebp+8]
   ;	
   ;	    return y;
   ;	
?live16389@16: ; EAX = this
@12:
	mov       eax,dword ptr [eax+8]
   ;	
   ;	}
   ;	
?live16389@32: ; 
@14:
@13:
	pop       ebp
	ret 
@@Child@getY$qv	endp
@Child@getY$qv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@Child@foo$qv	segment virtual
@@Child@foo$qv	proc	near
?live16390@0:
   ;	
   ;	void Child::foo() {
   ;	
	push      ebp
	mov       ebp,esp
	push      ebx
	mov       ebx,dword ptr [ebp+8]
   ;	
   ;	    printf("%d\n", getX() + y);
   ;	
?live16390@16: ; EBX = this
@15:
	push      ebx
	mov       eax,dword ptr [ebx]
	call      dword ptr [eax+8]
	pop       ecx
	add       eax,dword ptr [ebx+8]
	push      eax
	push      offset s@+4
	call      @_printf
	add       esp,8
   ;	
   ;	    
   ;	}
   ;	
?live16390@32: ; 
@16:
	pop       ebx
	pop       ebp
	ret 
@@Child@foo$qv	endp
@Child@foo$qv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@doFoo$qp6Parent	segment virtual
@@doFoo$qp6Parent	proc	near
?live16391@0:
   ;	
   ;	void doFoo(Parent *p) {
   ;	
	push      ebp
	mov       ebp,esp
   ;	
   ;	    p->foo();
   ;	
@17:
	mov       eax,dword ptr [ebp+8]
	push      eax
	mov       edx,dword ptr [eax]
	call      dword ptr [edx+4]
	pop       ecx
   ;	
   ;	}
   ;	
@18:
	pop       ebp
	ret 
@@doFoo$qp6Parent	endp
@doFoo$qp6Parent	ends
_TEXT	ends
_BSS	segment dword public use32 'BSS'
	align	4
_p	label	dword
	db	4	dup(?)
	align	4
_c	label	dword
	db	4	dup(?)
_BSS	ends
_DATA	segment dword public use32 'DATA'
@_$DCB$@main$qv	segment virtual
	align	2
@@_$DCB$@main$qv	label	dword
	dd	@@$xt$p6Parent
	dd	8199
	dd	-4
	dd	0
	dd	@@$xt$p5Child
	dd	8199
	dd	-8
	dd	0
@_$DCB$@main$qv	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@_$ECTC$@main$qv	segment virtual
	align	2
@@_$ECTC$@main$qv	label	dword
	dd	0
	dd	-44
	dw	0
	dw	5
	dd	0
	dd	0
	dw	8
	dw	5
	dd	0
	dd	@@_$DCB$@main$qv
	dw	0
	dw	5
	dd	0
	dd	0
	dw	32
	dw	5
	dd	0
	dd	@@_$DCB$@main$qv+16
@_$ECTC$@main$qv	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
_main	segment virtual
@_main	proc	near
?live16392@0:
   ;	
   ;	int main() {
   ;	
	push      ebp
	mov       ebp,esp
	add       esp,-44
@19:
	mov       eax,offset @@_$ECTC$@main$qv
	call      @__InitExceptBlockLDTC
   ;	
   ;	    p = new Parent();
   ;	
	push      8
	call      @$bnew$qui
	pop       ecx
	mov       dword ptr [ebp-4],eax
	test      eax,eax
	je        short @20
	mov       word ptr [ebp-28],20
	mov       edx,offset @@Parent@3+12
	mov       ecx,dword ptr [ebp-4]
	mov       dword ptr [ecx],edx
	mov       word ptr [ebp-28],8
	mov       eax,dword ptr [ebp-4]
	jmp       short @21
@20:
	mov       eax,dword ptr [ebp-4]
@21:
	mov       dword ptr [_p],eax
   ;	
   ;	    p->initP(5);
   ;	
	push      5
	mov       edx,dword ptr [_p]
	push      edx
	mov       ecx,dword ptr [edx]
	call      dword ptr [ecx]
	add       esp,8
   ;	
   ;	    c = new Child();
   ;	
	push      12
	call      @$bnew$qui
	pop       ecx
	mov       dword ptr [ebp-8],eax
	test      eax,eax
	je        short @22
	mov       word ptr [ebp-28],44
	mov       edx,offset @@Parent@3+12
	mov       ecx,dword ptr [ebp-8]
	mov       dword ptr [ecx],edx
	mov       eax,offset @@Child@3+12
	mov       edx,dword ptr [ebp-8]
	mov       dword ptr [edx],eax
	mov       word ptr [ebp-28],32
	mov       ecx,dword ptr [ebp-8]
	jmp       short @23
@22:
	mov       ecx,dword ptr [ebp-8]
@23:
	mov       dword ptr [_c],ecx
   ;	
   ;	    c->initC(10, 20);
   ;	
	push      20
	push      10
	mov       eax,dword ptr [_c]
	push      eax
	mov       edx,dword ptr [eax]
	call      dword ptr [edx+12]
	add       esp,12
   ;	
   ;	    
   ;	    doFoo(p);
   ;	
	push      dword ptr [_p]
	call      @@doFoo$qp6Parent
	pop       ecx
   ;	
   ;	    doFoo(c);
   ;	
	push      dword ptr [_c]
	call      @@doFoo$qp6Parent
	pop       ecx
   ;	
   ;	    
   ;	}
   ;	
	mov       eax,dword ptr [ebp-44]
	mov       dword ptr fs:[0],eax
	xor       eax,eax
@25:
@24:
	mov       esp,ebp
	pop       ebp
	ret 
@_main	endp
_main	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@$xt$p5Child	segment virtual
	align	2
@@$xt$p5Child	label	dword
	dd	4
	dw	144
	dw	12
	dd	@@$xt$5Child
	db	67
	db	104
	db	105
	db	108
	db	100
	db	32
	db	42
	db	0
@$xt$p5Child	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@$xt$p6Parent	segment virtual
	align	2
@@$xt$p6Parent	label	dword
	dd	4
	dw	16
	dw	12
	dd	@@$xt$6Parent
	db	80
	db	97
	db	114
	db	101
	db	110
	db	116
	db	32
	db	42
	db	0
@$xt$p6Parent	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
@Child@3	segment virtual
	align	2
@@Child@3	label	byte
	dd	@@$xt$5Child
	dd	0
	dd	0
	dd	@@Parent@initP$qi
	dd	@@Child@foo$qv
	dd	@@Parent@getX$qv
	dd	@@Child@initC$qii
	dd	@@Child@getY$qv
@Child@3	ends
_DATA	ends
_DATA	segment dword public use32 'DATA'
@Parent@3	segment virtual
	align	2
@@Parent@3	label	byte
	dd	@@$xt$6Parent
	dd	0
	dd	0
	dd	@@Parent@initP$qi
	dd	@@Parent@foo$qv
	dd	@@Parent@getX$qv
@Parent@3	ends
_DATA	ends
_TEXT	segment dword public use32 'CODE'
@$xt$6Parent	segment virtual
	align	2
@@$xt$6Parent	label	byte
	dd	8
	dw	3
	dw	32
	dd	0
	dd	81
	dw	40
	dw	44
	dd	0
	dw	0
	dw	0
	dd	0
	db	80
	db	97
	db	114
	db	101
	db	110
	db	116
	db	0
	db	0
	dd	0
	dd	0
@$xt$6Parent	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@$xt$5Child	segment virtual
	align	2
@@$xt$5Child	label	byte
	dd	12
	dw	3
	dw	32
	dd	0
	dd	85
	dw	40
	dw	56
	dd	0
	dw	0
	dw	0
	dd	0
	db	67
	db	104
	db	105
	db	108
	db	100
	db	0
	db	0
	db	0
	dd	@@$xt$6Parent
	dd	0
	dd	3
	dd	0
	dd	0
@$xt$5Child	ends
_TEXT	ends
_DATA	segment dword public use32 'DATA'
s@	label	byte
	;	s@+0:
	db	"%d",10,0
	;	s@+4:
	db	"%d",10,0
	align	4
_DATA	ends
_TEXT	segment dword public use32 'CODE'
_TEXT	ends
 extrn   __Exception_list:dword
@_printf equ _printf
 extrn   _printf:near
	public	_p
	public	_c
 extrn   @$bnew$qui:near
 extrn   @__InitExceptBlockLDTC:near
	?debug	D "j:\Borland\Bcc55\include\_nfile.h" 10459 10272
	?debug	D "j:\Borland\Bcc55\include\_null.h" 10459 10272
	?debug	D "j:\Borland\Bcc55\include\_defs.h" 10459 10272
	?debug	D "j:\Borland\Bcc55\include\_stddef.h" 10459 10272
	?debug	D "j:\Borland\Bcc55\include\stdio.h" 10459 10272
	?debug	D "polydemo.cpp" 12935 22991
	end
