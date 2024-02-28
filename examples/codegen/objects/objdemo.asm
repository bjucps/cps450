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
	?debug	S "objdemo.cpp"
	?debug	T "objdemo.cpp"
_TEXT	segment dword public use32 'CODE'
_TEXT	ends
_DATA	segment dword public use32 'DATA'
_DATA	ends
_BSS	segment dword public use32 'BSS'
_BSS	ends
DGROUP	group	_BSS,_DATA
_TEXT	segment dword public use32 'CODE'
@Point@setX$qi	segment virtual
@@Point@setX$qi	proc	near
?live16385@0:
   ;	
   ;	void Point::setX(int newX) {
   ;	
	push      ebp
	mov       ebp,esp
	mov       eax,dword ptr [ebp+8]
   ;	
   ;	        x = newX;
   ;	
?live16385@16: ; EAX = this
@1:
	mov       edx,dword ptr [ebp+12]
	mov       dword ptr [eax],edx
   ;	
   ;	}
   ;	
?live16385@32: ; 
@2:
	pop       ebp
	ret 
@@Point@setX$qi	endp
@Point@setX$qi	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@Point@getX$qv	segment virtual
@@Point@getX$qv	proc	near
?live16386@0:
   ;	
   ;	int Point::getX() { 
   ;	
	push      ebp
	mov       ebp,esp
	mov       eax,dword ptr [ebp+8]
   ;	
   ;	    return x; 
   ;	
?live16386@16: ; EAX = this
@3:
	mov       eax,dword ptr [eax]
   ;	
   ;	}
   ;	
?live16386@32: ; 
@5:
@4:
	pop       ebp
	ret 
@@Point@getX$qv	endp
@Point@getX$qv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@Point@setY$qi	segment virtual
@@Point@setY$qi	proc	near
?live16387@0:
   ;	
   ;	void Point::setY(int newY) {
   ;	
	push      ebp
	mov       ebp,esp
	mov       eax,dword ptr [ebp+8]
   ;	
   ;	        y = newY;
   ;	
?live16387@16: ; EAX = this
@6:
	mov       edx,dword ptr [ebp+12]
	mov       dword ptr [eax+4],edx
   ;	
   ;	}
   ;	
?live16387@32: ; 
@7:
	pop       ebp
	ret 
@@Point@setY$qi	endp
@Point@setY$qi	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
@Point@getY$qv	segment virtual
@@Point@getY$qv	proc	near
?live16388@0:
   ;	
   ;	int Point::getY() { 
   ;	
	push      ebp
	mov       ebp,esp
	mov       eax,dword ptr [ebp+8]
   ;	
   ;	    return y; 
   ;	
?live16388@16: ; EAX = this
@8:
	mov       eax,dword ptr [eax+4]
   ;	
   ;	}
   ;	
?live16388@32: ; 
@10:
@9:
	pop       ebp
	ret 
@@Point@getY$qv	endp
@Point@getY$qv	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
_main	segment virtual
@_main	proc	near
?live16389@0:
   ;	
   ;	int main()
   ;	
	push      ebp
	mov       ebp,esp
	push      ebx
	push      esi
   ;	
   ;	{
   ;	    Point *a = new Point();
   ;	
@11:
	push      8
	call      @$bnew$qui
	pop       ecx
	mov       ebx,eax
   ;	
   ;	    Point *b = new Point();
   ;	
?live16389@32: ; EBX = a
	push      8
	call      @$bnew$qui
	pop       ecx
	mov       esi,eax
   ;	
   ;	    
   ;	    a->setX(25);
   ;	
?live16389@48: ; EBX = a, ESI = b
	push      25
	push      ebx
	call      @@Point@setX$qi
	add       esp,8
   ;	
   ;	    b->setX(35);
   ;	
?live16389@64: ; ESI = b
	push      35
	push      esi
	call      @@Point@setX$qi
	add       esp,8
	xor       eax,eax
   ;	
   ;	    
   ;	}
   ;	
?live16389@80: ; 
@13:
@12:
	pop       esi
	pop       ebx
	pop       ebp
	ret 
@_main	endp
_main	ends
_TEXT	ends
_TEXT	segment dword public use32 'CODE'
_TEXT	ends
 extrn   @$bnew$qui:near
	?debug	D "objdemo.cpp" 13438 29447
	end
