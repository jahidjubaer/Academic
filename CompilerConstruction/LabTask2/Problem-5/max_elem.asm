
max_elem.o:     file format pe-i386


Disassembly of section .text:

00000000 <_main>:
   0:	8d 4c 24 04          	lea    ecx,[esp+0x4]
   4:	83 e4 f0             	and    esp,0xfffffff0
   7:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
   a:	55                   	push   ebp
   b:	89 e5                	mov    ebp,esp
   d:	53                   	push   ebx
   e:	51                   	push   ecx
   f:	83 ec 30             	sub    esp,0x30
  12:	e8 00 00 00 00       	call   17 <_main+0x17>
  17:	89 e0                	mov    eax,esp
  19:	89 c3                	mov    ebx,eax
  1b:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  22:	e8 00 00 00 00       	call   27 <_main+0x27>
  27:	8d 45 e0             	lea    eax,[ebp-0x20]
  2a:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  2e:	c7 04 24 2c 00 00 00 	mov    DWORD PTR [esp],0x2c
  35:	e8 00 00 00 00       	call   3a <_main+0x3a>
  3a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  3d:	8d 50 ff             	lea    edx,[eax-0x1]
  40:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
  43:	c1 e0 02             	shl    eax,0x2
  46:	8d 50 03             	lea    edx,[eax+0x3]
  49:	b8 10 00 00 00       	mov    eax,0x10
  4e:	83 e8 01             	sub    eax,0x1
  51:	01 d0                	add    eax,edx
  53:	b9 10 00 00 00       	mov    ecx,0x10
  58:	ba 00 00 00 00       	mov    edx,0x0
  5d:	f7 f1                	div    ecx
  5f:	6b c0 10             	imul   eax,eax,0x10
  62:	e8 00 00 00 00       	call   67 <_main+0x67>
  67:	29 c4                	sub    esp,eax
  69:	8d 44 24 08          	lea    eax,[esp+0x8]
  6d:	83 c0 03             	add    eax,0x3
  70:	c1 e8 02             	shr    eax,0x2
  73:	c1 e0 02             	shl    eax,0x2
  76:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  79:	c7 04 24 30 00 00 00 	mov    DWORD PTR [esp],0x30
  80:	e8 00 00 00 00       	call   85 <_main+0x85>
  85:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  8c:	eb 23                	jmp    b1 <_main+0xb1>
  8e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  91:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
  98:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  9b:	01 d0                	add    eax,edx
  9d:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  a1:	c7 04 24 2c 00 00 00 	mov    DWORD PTR [esp],0x2c
  a8:	e8 00 00 00 00       	call   ad <_main+0xad>
  ad:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
  b1:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  b4:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
  b7:	7c d5                	jl     8e <_main+0x8e>
  b9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  bc:	8b 00                	mov    eax,DWORD PTR [eax]
  be:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  c1:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
  c8:	eb 1e                	jmp    e8 <_main+0xe8>
  ca:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  cd:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
  d0:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
  d3:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
  d6:	7e 0c                	jle    e4 <_main+0xe4>
  d8:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  db:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
  de:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
  e1:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  e4:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
  e8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  eb:	39 45 ec             	cmp    DWORD PTR [ebp-0x14],eax
  ee:	7c da                	jl     ca <_main+0xca>
  f0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  f3:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  f7:	c7 04 24 52 00 00 00 	mov    DWORD PTR [esp],0x52
  fe:	e8 00 00 00 00       	call   103 <_main+0x103>
 103:	b8 00 00 00 00       	mov    eax,0x0
 108:	89 dc                	mov    esp,ebx
 10a:	8d 65 f8             	lea    esp,[ebp-0x8]
 10d:	59                   	pop    ecx
 10e:	5b                   	pop    ebx
 10f:	5d                   	pop    ebp
 110:	8d 61 fc             	lea    esp,[ecx-0x4]
 113:	c3                   	ret    
