	.386p
	ifdef ??version
	if ??version GT 500H
	.mmx
	endif
	endif
	model flat
	ifndef	??version
	?debug	macro
	endm
	endif
	?debug	S "inheritdemo.cpp"
	?debug	T "inheritdemo.cpp"
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
	mov       dword ptr [eax],edx
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
	push      dword ptr [eax]
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
	mov       eax,dword ptr [eax]
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
	call      @@Parent@initP$qi
	add       esp,8
 ;	
 ;	    y = newY;
 ;	
	mov       eax,dword ptr [ebp+16]
	mov       dword ptr [ebx+4],eax
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
	mov       eax,dword ptr [eax+4]
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
	call      @@Parent@getX$qv
	pop       ecx
	add       eax,dword ptr [ebx+4]
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
	push      dword ptr [ebp+8]
	call      @@Parent@foo$qv
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
_TEXT	segment dword public use32 'CODE'
_main	segment virtual
@_main	proc	near
?live16392@0:
 ;	
 ;	int main() {
 ;	
	push      ebp
	mov       ebp,esp
 ;	
 ;	    p = new Parent();
 ;	
@19:
	push      4
	call      @$bnew$qui
	pop       ecx
	mov       dword ptr [_p],eax
 ;	
 ;	    p->initP(5);
 ;	
	push      5
	push      dword ptr [_p]
	call      @@Parent@initP$qi
	add       esp,8
 ;	
 ;	    c = new Child();
 ;	
	push      8
	call      @$bnew$qui
	pop       ecx
	mov       dword ptr [_c],eax
 ;	
 ;	    c->initC(10, 20);
 ;	
	push      20
	push      10
	push      dword ptr [_c]
	call      @@Child@initC$qii
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
	xor       eax,eax
 ;	
 ;	    
 ;	}
 ;	
@21:
@20:
	pop       ebp
	ret 
@_main	endp
_main	ends
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
@_printf equ _printf
 extrn _printf:near
	public	_p
	public	_c
 extrn @$bnew$qui:near
	?debug	D "C:\Program Files\Borland\BDS\4.0\Include\_nfile.h" 13608 24122
	?debug	D "C:\Program Files\Borland\BDS\4.0\Include\_null.h" 13608 24122
	?debug	D "C:\Program Files\Borland\BDS\4.0\Include\_defs.h" 13608 24122
	?debug	D "C:\Program Files\Borland\BDS\4.0\Include\_stddef.h" 13608 24122
	?debug	D "C:\Program Files\Borland\BDS\4.0\Include\stdio.h" 13608 24145
	?debug	D "inheritdemo.cpp" 14985 26157
	end
