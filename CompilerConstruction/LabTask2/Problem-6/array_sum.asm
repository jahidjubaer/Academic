
array_sum.o:     file format pe-i386


Disassembly of section .text:

00000000 <_main>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	83 e4 f0             	and    esp,0xfffffff0
   6:	83 ec 30             	sub    esp,0x30
   9:	e8 00 00 00 00       	call   e <_main+0xe>
   e:	c7 44 24 10 01 00 00 	mov    DWORD PTR [esp+0x10],0x1
  15:	00 
  16:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  1d:	00 
  1e:	c7 44 24 18 03 00 00 	mov    DWORD PTR [esp+0x18],0x3
  25:	00 
  26:	c7 44 24 1c 04 00 00 	mov    DWORD PTR [esp+0x1c],0x4
  2d:	00 
  2e:	c7 44 24 20 05 00 00 	mov    DWORD PTR [esp+0x20],0x5
  35:	00 
  36:	c7 44 24 24 05 00 00 	mov    DWORD PTR [esp+0x24],0x5
  3d:	00 
  3e:	c7 44 24 2c 00 00 00 	mov    DWORD PTR [esp+0x2c],0x0
  45:	00 
  46:	c7 44 24 28 00 00 00 	mov    DWORD PTR [esp+0x28],0x0
  4d:	00 
  4e:	eb 11                	jmp    61 <_main+0x61>
  50:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  54:	8b 44 84 10          	mov    eax,DWORD PTR [esp+eax*4+0x10]
  58:	01 44 24 2c          	add    DWORD PTR [esp+0x2c],eax
  5c:	83 44 24 28 01       	add    DWORD PTR [esp+0x28],0x1
  61:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  65:	3b 44 24 24          	cmp    eax,DWORD PTR [esp+0x24]
  69:	7c e5                	jl     50 <_main+0x50>
  6b:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  6f:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  73:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  7a:	e8 00 00 00 00       	call   7f <_main+0x7f>
  7f:	b8 00 00 00 00       	mov    eax,0x0
  84:	c9                   	leave  
  85:	c3                   	ret    
  86:	90                   	nop
  87:	90                   	nop
