
spectre_shell:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 5f 00 00 	mov    0x5fd9(%rip),%rax        # 6fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 42 5f 00 00    	pushq  0x5f42(%rip)        # 6f68 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 44 5f 00 00    	jmpq   *0x5f44(%rip)        # 6f70 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <_ZNSolsEm@plt>:
    1030:	ff 25 42 5f 00 00    	jmpq   *0x5f42(%rip)        # 6f78 <_ZNSolsEm@GLIBCXX_3.4>
    1036:	68 00 00 00 00       	pushq  $0x0
    103b:	e9 e0 ff ff ff       	jmpq   1020 <.plt>

0000000000001040 <memset@plt>:
    1040:	ff 25 3a 5f 00 00    	jmpq   *0x5f3a(%rip)        # 6f80 <memset@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	pushq  $0x1
    104b:	e9 d0 ff ff ff       	jmpq   1020 <.plt>

0000000000001050 <_ZNSolsEPKv@plt>:
    1050:	ff 25 32 5f 00 00    	jmpq   *0x5f32(%rip)        # 6f88 <_ZNSolsEPKv@GLIBCXX_3.4>
    1056:	68 02 00 00 00       	pushq  $0x2
    105b:	e9 c0 ff ff ff       	jmpq   1020 <.plt>

0000000000001060 <__cxa_atexit@plt>:
    1060:	ff 25 2a 5f 00 00    	jmpq   *0x5f2a(%rip)        # 6f90 <__cxa_atexit@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	pushq  $0x3
    106b:	e9 b0 ff ff ff       	jmpq   1020 <.plt>

0000000000001070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
    1070:	ff 25 22 5f 00 00    	jmpq   *0x5f22(%rip)        # 6f98 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@GLIBCXX_3.4>
    1076:	68 04 00 00 00       	pushq  $0x4
    107b:	e9 a0 ff ff ff       	jmpq   1020 <.plt>

0000000000001080 <_ZNSolsEPFRSoS_E@plt>:
    1080:	ff 25 1a 5f 00 00    	jmpq   *0x5f1a(%rip)        # 6fa0 <_ZNSolsEPFRSoS_E@GLIBCXX_3.4>
    1086:	68 05 00 00 00       	pushq  $0x5
    108b:	e9 90 ff ff ff       	jmpq   1020 <.plt>

0000000000001090 <malloc@plt>:
    1090:	ff 25 12 5f 00 00    	jmpq   *0x5f12(%rip)        # 6fa8 <malloc@GLIBC_2.2.5>
    1096:	68 06 00 00 00       	pushq  $0x6
    109b:	e9 80 ff ff ff       	jmpq   1020 <.plt>

00000000000010a0 <_ZNSt8ios_base4InitC1Ev@plt>:
    10a0:	ff 25 0a 5f 00 00    	jmpq   *0x5f0a(%rip)        # 6fb0 <_ZNSt8ios_base4InitC1Ev@GLIBCXX_3.4>
    10a6:	68 07 00 00 00       	pushq  $0x7
    10ab:	e9 70 ff ff ff       	jmpq   1020 <.plt>

00000000000010b0 <puts@plt>:
    10b0:	ff 25 02 5f 00 00    	jmpq   *0x5f02(%rip)        # 6fb8 <puts@GLIBC_2.2.5>
    10b6:	68 08 00 00 00       	pushq  $0x8
    10bb:	e9 60 ff ff ff       	jmpq   1020 <.plt>

00000000000010c0 <_ZNSolsEi@plt>:
    10c0:	ff 25 fa 5e 00 00    	jmpq   *0x5efa(%rip)        # 6fc0 <_ZNSolsEi@GLIBCXX_3.4>
    10c6:	68 09 00 00 00       	pushq  $0x9
    10cb:	e9 50 ff ff ff       	jmpq   1020 <.plt>

Disassembly of section .plt.got:

00000000000010d0 <__cxa_finalize@plt>:
    10d0:	ff 25 f2 5e 00 00    	jmpq   *0x5ef2(%rip)        # 6fc8 <__cxa_finalize@GLIBC_2.2.5>
    10d6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000000010e0 <_start>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	31 ed                	xor    %ebp,%ebp
    10e6:	49 89 d1             	mov    %rdx,%r9
    10e9:	5e                   	pop    %rsi
    10ea:	48 89 e2             	mov    %rsp,%rdx
    10ed:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10f1:	50                   	push   %rax
    10f2:	54                   	push   %rsp
    10f3:	4c 8d 05 46 09 00 00 	lea    0x946(%rip),%r8        # 1a40 <__libc_csu_fini>
    10fa:	48 8d 0d cf 08 00 00 	lea    0x8cf(%rip),%rcx        # 19d0 <__libc_csu_init>
    1101:	48 8d 3d 54 04 00 00 	lea    0x454(%rip),%rdi        # 155c <main>
    1108:	ff 15 d2 5e 00 00    	callq  *0x5ed2(%rip)        # 6fe0 <__libc_start_main@GLIBC_2.2.5>
    110e:	f4                   	hlt    
    110f:	90                   	nop

0000000000001110 <deregister_tm_clones>:
    1110:	48 8d 3d f9 5e 00 00 	lea    0x5ef9(%rip),%rdi        # 7010 <__TMC_END__>
    1117:	48 8d 05 f2 5e 00 00 	lea    0x5ef2(%rip),%rax        # 7010 <__TMC_END__>
    111e:	48 39 f8             	cmp    %rdi,%rax
    1121:	74 15                	je     1138 <deregister_tm_clones+0x28>
    1123:	48 8b 05 ae 5e 00 00 	mov    0x5eae(%rip),%rax        # 6fd8 <_ITM_deregisterTMCloneTable>
    112a:	48 85 c0             	test   %rax,%rax
    112d:	74 09                	je     1138 <deregister_tm_clones+0x28>
    112f:	ff e0                	jmpq   *%rax
    1131:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1138:	c3                   	retq   
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <register_tm_clones>:
    1140:	48 8d 3d c9 5e 00 00 	lea    0x5ec9(%rip),%rdi        # 7010 <__TMC_END__>
    1147:	48 8d 35 c2 5e 00 00 	lea    0x5ec2(%rip),%rsi        # 7010 <__TMC_END__>
    114e:	48 29 fe             	sub    %rdi,%rsi
    1151:	48 89 f0             	mov    %rsi,%rax
    1154:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1158:	48 c1 f8 03          	sar    $0x3,%rax
    115c:	48 01 c6             	add    %rax,%rsi
    115f:	48 d1 fe             	sar    %rsi
    1162:	74 14                	je     1178 <register_tm_clones+0x38>
    1164:	48 8b 05 85 5e 00 00 	mov    0x5e85(%rip),%rax        # 6ff0 <_ITM_registerTMCloneTable>
    116b:	48 85 c0             	test   %rax,%rax
    116e:	74 08                	je     1178 <register_tm_clones+0x38>
    1170:	ff e0                	jmpq   *%rax
    1172:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1178:	c3                   	retq   
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001180 <__do_global_dtors_aux>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	80 3d c5 5f 00 00 00 	cmpb   $0x0,0x5fc5(%rip)        # 7150 <completed.8061>
    118b:	75 2b                	jne    11b8 <__do_global_dtors_aux+0x38>
    118d:	55                   	push   %rbp
    118e:	48 83 3d 32 5e 00 00 	cmpq   $0x0,0x5e32(%rip)        # 6fc8 <__cxa_finalize@GLIBC_2.2.5>
    1195:	00 
    1196:	48 89 e5             	mov    %rsp,%rbp
    1199:	74 0c                	je     11a7 <__do_global_dtors_aux+0x27>
    119b:	48 8b 3d 66 5e 00 00 	mov    0x5e66(%rip),%rdi        # 7008 <__dso_handle>
    11a2:	e8 29 ff ff ff       	callq  10d0 <__cxa_finalize@plt>
    11a7:	e8 64 ff ff ff       	callq  1110 <deregister_tm_clones>
    11ac:	c6 05 9d 5f 00 00 01 	movb   $0x1,0x5f9d(%rip)        # 7150 <completed.8061>
    11b3:	5d                   	pop    %rbp
    11b4:	c3                   	retq   
    11b5:	0f 1f 00             	nopl   (%rax)
    11b8:	c3                   	retq   
    11b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011c0 <frame_dummy>:
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	e9 77 ff ff ff       	jmpq   1140 <register_tm_clones>

00000000000011c9 <_Z20check_sandbox_mallocP7Sandbox>:
    11c9:	f3 0f 1e fa          	endbr64 
    11cd:	55                   	push   %rbp
    11ce:	48 89 e5             	mov    %rsp,%rbp
    11d1:	48 83 ec 10          	sub    $0x10,%rsp
    11d5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    11d9:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    11de:	75 13                	jne    11f3 <_Z20check_sandbox_mallocP7Sandbox+0x2a>
    11e0:	48 8d 3d 59 3e 00 00 	lea    0x3e59(%rip),%rdi        # 5040 <input+0x3000>
    11e7:	e8 c4 fe ff ff       	callq  10b0 <puts@plt>
    11ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    11f1:	eb 16                	jmp    1209 <_Z20check_sandbox_mallocP7Sandbox+0x40>
    11f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11f7:	48 05 f8 df 00 00    	add    $0xdff8,%rax
    11fd:	48 89 05 5c 5f 00 00 	mov    %rax,0x5f5c(%rip)        # 7160 <stack_base>
    1204:	b8 00 00 00 00       	mov    $0x0,%eax
    1209:	c9                   	leaveq 
    120a:	c3                   	retq   

000000000000120b <_Z12init_sandboxP7Sandbox>:
    120b:	f3 0f 1e fa          	endbr64 
    120f:	55                   	push   %rbp
    1210:	48 89 e5             	mov    %rsp,%rbp
    1213:	48 83 ec 60          	sub    $0x60,%rsp
    1217:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
    121b:	48 8d 35 52 3e 00 00 	lea    0x3e52(%rip),%rsi        # 5074 <input+0x3034>
    1222:	48 8d 3d 17 5e 00 00 	lea    0x5e17(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    1229:	e8 42 fe ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    122e:	48 89 c2             	mov    %rax,%rdx
    1231:	48 8b 05 98 5d 00 00 	mov    0x5d98(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    1238:	48 89 c6             	mov    %rax,%rsi
    123b:	48 89 d7             	mov    %rdx,%rdi
    123e:	e8 3d fe ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    1243:	48 8d 05 f6 0d 00 00 	lea    0xdf6(%rip),%rax        # 2040 <input>
    124a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    124e:	48 8d 35 34 3e 00 00 	lea    0x3e34(%rip),%rsi        # 5089 <input+0x3049>
    1255:	48 8d 3d e4 5d 00 00 	lea    0x5de4(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    125c:	e8 0f fe ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1261:	48 89 c2             	mov    %rax,%rdx
    1264:	48 8b 05 65 5d 00 00 	mov    0x5d65(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    126b:	48 89 c6             	mov    %rax,%rsi
    126e:	48 89 d7             	mov    %rdx,%rdi
    1271:	e8 0a fe ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    1276:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    127a:	48 05 00 c0 00 00    	add    $0xc000,%rax
    1280:	ba 00 10 00 00       	mov    $0x1000,%edx
    1285:	be 00 00 00 00       	mov    $0x0,%esi
    128a:	48 89 c7             	mov    %rax,%rdi
    128d:	e8 ae fd ff ff       	callq  1040 <memset@plt>
    1292:	48 8d 35 ff 3d 00 00 	lea    0x3dff(%rip),%rsi        # 5098 <input+0x3058>
    1299:	48 8d 3d a0 5d 00 00 	lea    0x5da0(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    12a0:	e8 cb fd ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    12a5:	48 89 c2             	mov    %rax,%rdx
    12a8:	48 8b 05 21 5d 00 00 	mov    0x5d21(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    12af:	48 89 c6             	mov    %rax,%rsi
    12b2:	48 89 d7             	mov    %rdx,%rdi
    12b5:	e8 c6 fd ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    12ba:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%rbp)
    12c1:	81 7d b0 ff 01 00 00 	cmpl   $0x1ff,-0x50(%rbp)
    12c8:	7f 24                	jg     12ee <_Z12init_sandboxP7Sandbox+0xe3>
    12ca:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    12ce:	48 8d 90 00 f0 00 00 	lea    0xf000(%rax),%rdx
    12d5:	8b 45 b0             	mov    -0x50(%rbp),%eax
    12d8:	48 98                	cltq   
    12da:	48 c1 e0 03          	shl    $0x3,%rax
    12de:	48 01 d0             	add    %rdx,%rax
    12e1:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    12e8:	83 45 b0 01          	addl   $0x1,-0x50(%rbp)
    12ec:	eb d3                	jmp    12c1 <_Z12init_sandboxP7Sandbox+0xb6>
    12ee:	48 8d 35 cb 3d 00 00 	lea    0x3dcb(%rip),%rsi        # 50c0 <input+0x3080>
    12f5:	48 8d 3d 44 5d 00 00 	lea    0x5d44(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    12fc:	e8 6f fd ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1301:	48 89 c2             	mov    %rax,%rdx
    1304:	48 8b 05 c5 5c 00 00 	mov    0x5cc5(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    130b:	48 89 c6             	mov    %rax,%rsi
    130e:	48 89 d7             	mov    %rdx,%rdi
    1311:	e8 6a fd ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    1316:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    131a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    131e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    1322:	48 05 00 d0 00 00    	add    $0xd000,%rax
    1328:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    132c:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%rbp)
    1333:	81 7d b4 ff 01 00 00 	cmpl   $0x1ff,-0x4c(%rbp)
    133a:	7f 35                	jg     1371 <_Z12init_sandboxP7Sandbox+0x166>
    133c:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    133f:	48 98                	cltq   
    1341:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    1348:	00 
    1349:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    134d:	48 01 d0             	add    %rdx,%rax
    1350:	8b 55 b4             	mov    -0x4c(%rbp),%edx
    1353:	48 63 d2             	movslq %edx,%rdx
    1356:	48 8d 0c d5 00 00 00 	lea    0x0(,%rdx,8),%rcx
    135d:	00 
    135e:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    1362:	48 01 ca             	add    %rcx,%rdx
    1365:	48 8b 00             	mov    (%rax),%rax
    1368:	48 89 02             	mov    %rax,(%rdx)
    136b:	83 45 b4 01          	addl   $0x1,-0x4c(%rbp)
    136f:	eb c2                	jmp    1333 <_Z12init_sandboxP7Sandbox+0x128>
    1371:	48 8d 35 5e 3d 00 00 	lea    0x3d5e(%rip),%rsi        # 50d6 <input+0x3096>
    1378:	48 8d 3d c1 5c 00 00 	lea    0x5cc1(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    137f:	e8 ec fc ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1384:	48 89 c2             	mov    %rax,%rdx
    1387:	48 8b 05 42 5c 00 00 	mov    0x5c42(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    138e:	48 89 c6             	mov    %rax,%rsi
    1391:	48 89 d7             	mov    %rdx,%rdi
    1394:	e8 e7 fc ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    1399:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    139d:	48 05 00 10 00 00    	add    $0x1000,%rax
    13a3:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    13a7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    13ab:	48 05 00 e0 00 00    	add    $0xe000,%rax
    13b1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    13b5:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%rbp)
    13bc:	81 7d b8 ff 01 00 00 	cmpl   $0x1ff,-0x48(%rbp)
    13c3:	7f 35                	jg     13fa <_Z12init_sandboxP7Sandbox+0x1ef>
    13c5:	8b 45 b8             	mov    -0x48(%rbp),%eax
    13c8:	48 98                	cltq   
    13ca:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    13d1:	00 
    13d2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    13d6:	48 01 d0             	add    %rdx,%rax
    13d9:	8b 55 b8             	mov    -0x48(%rbp),%edx
    13dc:	48 63 d2             	movslq %edx,%rdx
    13df:	48 8d 0c d5 00 00 00 	lea    0x0(,%rdx,8),%rcx
    13e6:	00 
    13e7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    13eb:	48 01 ca             	add    %rcx,%rdx
    13ee:	48 8b 00             	mov    (%rax),%rax
    13f1:	48 89 02             	mov    %rax,(%rdx)
    13f4:	83 45 b8 01          	addl   $0x1,-0x48(%rbp)
    13f8:	eb c2                	jmp    13bc <_Z12init_sandboxP7Sandbox+0x1b1>
    13fa:	48 8d 35 e8 3c 00 00 	lea    0x3ce8(%rip),%rsi        # 50e9 <input+0x30a9>
    1401:	48 8d 3d 38 5c 00 00 	lea    0x5c38(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    1408:	e8 63 fc ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    140d:	48 89 c2             	mov    %rax,%rdx
    1410:	48 8b 05 b9 5b 00 00 	mov    0x5bb9(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    1417:	48 89 c6             	mov    %rax,%rsi
    141a:	48 89 d7             	mov    %rdx,%rdi
    141d:	e8 5e fc ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    1422:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1426:	48 05 00 20 00 00    	add    $0x2000,%rax
    142c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1430:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    1434:	48 05 00 f0 00 00    	add    $0xf000,%rax
    143a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    143e:	48 8d 35 b9 3c 00 00 	lea    0x3cb9(%rip),%rsi        # 50fe <input+0x30be>
    1445:	48 8d 3d f4 5b 00 00 	lea    0x5bf4(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    144c:	e8 1f fc ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1451:	48 89 c2             	mov    %rax,%rdx
    1454:	48 8b 05 75 5b 00 00 	mov    0x5b75(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    145b:	48 89 c6             	mov    %rax,%rsi
    145e:	48 89 d7             	mov    %rdx,%rdi
    1461:	e8 1a fc ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    1466:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%rbp)
    146d:	83 7d bc 05          	cmpl   $0x5,-0x44(%rbp)
    1471:	7f 35                	jg     14a8 <_Z12init_sandboxP7Sandbox+0x29d>
    1473:	8b 45 bc             	mov    -0x44(%rbp),%eax
    1476:	48 98                	cltq   
    1478:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    147f:	00 
    1480:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1484:	48 01 d0             	add    %rdx,%rax
    1487:	8b 55 bc             	mov    -0x44(%rbp),%edx
    148a:	48 63 d2             	movslq %edx,%rdx
    148d:	48 8d 0c d5 00 00 00 	lea    0x0(,%rdx,8),%rcx
    1494:	00 
    1495:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1499:	48 01 ca             	add    %rcx,%rdx
    149c:	48 8b 00             	mov    (%rax),%rax
    149f:	48 89 02             	mov    %rax,(%rdx)
    14a2:	83 45 bc 01          	addl   $0x1,-0x44(%rbp)
    14a6:	eb c5                	jmp    146d <_Z12init_sandboxP7Sandbox+0x262>
    14a8:	48 8d 35 67 3c 00 00 	lea    0x3c67(%rip),%rsi        # 5116 <input+0x30d6>
    14af:	48 8d 3d 8a 5b 00 00 	lea    0x5b8a(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    14b6:	e8 b5 fb ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    14bb:	48 89 c2             	mov    %rax,%rdx
    14be:	48 8b 05 0b 5b 00 00 	mov    0x5b0b(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    14c5:	48 89 c6             	mov    %rax,%rsi
    14c8:	48 89 d7             	mov    %rdx,%rdi
    14cb:	e8 b0 fb ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    14d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    14d4:	48 83 c0 30          	add    $0x30,%rax
    14d8:	48 8b 00             	mov    (%rax),%rax
    14db:	25 d5 08 00 00       	and    $0x8d5,%eax
    14e0:	48 83 c8 02          	or     $0x2,%rax
    14e4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    14e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    14ec:	48 8d 50 30          	lea    0x30(%rax),%rdx
    14f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14f4:	48 89 02             	mov    %rax,(%rdx)
    14f7:	48 8d 35 31 3c 00 00 	lea    0x3c31(%rip),%rsi        # 512f <input+0x30ef>
    14fe:	48 8d 3d 3b 5b 00 00 	lea    0x5b3b(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    1505:	e8 66 fb ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    150a:	48 89 c2             	mov    %rax,%rdx
    150d:	48 8b 05 bc 5a 00 00 	mov    0x5abc(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    1514:	48 89 c6             	mov    %rax,%rsi
    1517:	48 89 d7             	mov    %rdx,%rdi
    151a:	e8 61 fb ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    151f:	48 8b 15 3a 5c 00 00 	mov    0x5c3a(%rip),%rdx        # 7160 <stack_base>
    1526:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    152a:	48 83 c0 38          	add    $0x38,%rax
    152e:	48 89 10             	mov    %rdx,(%rax)
    1531:	48 8d 35 01 3c 00 00 	lea    0x3c01(%rip),%rsi        # 5139 <input+0x30f9>
    1538:	48 8d 3d 01 5b 00 00 	lea    0x5b01(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    153f:	e8 2c fb ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1544:	48 89 c2             	mov    %rax,%rdx
    1547:	48 8b 05 82 5a 00 00 	mov    0x5a82(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    154e:	48 89 c6             	mov    %rax,%rsi
    1551:	48 89 d7             	mov    %rdx,%rdi
    1554:	e8 27 fb ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    1559:	90                   	nop
    155a:	c9                   	leaveq 
    155b:	c3                   	retq   

000000000000155c <main>:
    155c:	f3 0f 1e fa          	endbr64 
    1560:	55                   	push   %rbp
    1561:	48 89 e5             	mov    %rsp,%rbp
    1564:	41 57                	push   %r15
    1566:	41 56                	push   %r14
    1568:	53                   	push   %rbx
    1569:	48 83 ec 38          	sub    $0x38,%rsp
    156d:	89 7d bc             	mov    %edi,-0x44(%rbp)
    1570:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
    1574:	48 8d 35 d5 3b 00 00 	lea    0x3bd5(%rip),%rsi        # 5150 <input+0x3110>
    157b:	48 8d 3d be 5a 00 00 	lea    0x5abe(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    1582:	e8 e9 fa ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1587:	48 89 c2             	mov    %rax,%rdx
    158a:	48 8b 05 3f 5a 00 00 	mov    0x5a3f(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    1591:	48 89 c6             	mov    %rax,%rsi
    1594:	48 89 d7             	mov    %rdx,%rdi
    1597:	e8 e4 fa ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    159c:	48 8d 35 cd 3b 00 00 	lea    0x3bcd(%rip),%rsi        # 5170 <input+0x3130>
    15a3:	48 8d 3d 96 5a 00 00 	lea    0x5a96(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    15aa:	e8 c1 fa ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    15af:	48 89 c2             	mov    %rax,%rdx
    15b2:	48 8b 05 17 5a 00 00 	mov    0x5a17(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    15b9:	48 89 c6             	mov    %rax,%rsi
    15bc:	48 89 d7             	mov    %rdx,%rdi
    15bf:	e8 bc fa ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    15c4:	bf 10 00 01 00       	mov    $0x10010,%edi
    15c9:	e8 c2 fa ff ff       	callq  1090 <malloc@plt>
    15ce:	48 89 05 83 5b 00 00 	mov    %rax,0x5b83(%rip)        # 7158 <sandbox>
    15d5:	48 8b 05 7c 5b 00 00 	mov    0x5b7c(%rip),%rax        # 7158 <sandbox>
    15dc:	48 89 c7             	mov    %rax,%rdi
    15df:	e8 e5 fb ff ff       	callq  11c9 <_Z20check_sandbox_mallocP7Sandbox>
    15e4:	89 45 cc             	mov    %eax,-0x34(%rbp)
    15e7:	48 8d 35 9a 3b 00 00 	lea    0x3b9a(%rip),%rsi        # 5188 <input+0x3148>
    15ee:	48 8d 3d 4b 5a 00 00 	lea    0x5a4b(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    15f5:	e8 76 fa ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    15fa:	48 89 c2             	mov    %rax,%rdx
    15fd:	8b 45 cc             	mov    -0x34(%rbp),%eax
    1600:	89 c6                	mov    %eax,%esi
    1602:	48 89 d7             	mov    %rdx,%rdi
    1605:	e8 b6 fa ff ff       	callq  10c0 <_ZNSolsEi@plt>
    160a:	48 89 c2             	mov    %rax,%rdx
    160d:	48 8b 05 bc 59 00 00 	mov    0x59bc(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    1614:	48 89 c6             	mov    %rax,%rsi
    1617:	48 89 d7             	mov    %rdx,%rdi
    161a:	e8 61 fa ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    161f:	48 8d 35 82 3b 00 00 	lea    0x3b82(%rip),%rsi        # 51a8 <input+0x3168>
    1626:	48 8d 3d 13 5a 00 00 	lea    0x5a13(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    162d:	e8 3e fa ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1632:	48 89 c2             	mov    %rax,%rdx
    1635:	48 8b 05 94 59 00 00 	mov    0x5994(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    163c:	48 89 c6             	mov    %rax,%rsi
    163f:	48 89 d7             	mov    %rdx,%rdi
    1642:	e8 39 fa ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    1647:	48 8b 05 0a 5b 00 00 	mov    0x5b0a(%rip),%rax        # 7158 <sandbox>
    164e:	48 89 c7             	mov    %rax,%rdi
    1651:	e8 b5 fb ff ff       	callq  120b <_Z12init_sandboxP7Sandbox>
    1656:	48 8d 35 5b 3b 00 00 	lea    0x3b5b(%rip),%rsi        # 51b8 <input+0x3178>
    165d:	48 8d 3d dc 59 00 00 	lea    0x59dc(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    1664:	e8 07 fa ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1669:	48 89 c2             	mov    %rax,%rdx
    166c:	48 8b 05 5d 59 00 00 	mov    0x595d(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    1673:	48 89 c6             	mov    %rax,%rsi
    1676:	48 89 d7             	mov    %rdx,%rdi
    1679:	e8 02 fa ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    167e:	48 8b 05 d3 5a 00 00 	mov    0x5ad3(%rip),%rax        # 7158 <sandbox>
    1685:	48 05 00 d0 00 00    	add    $0xd000,%rax
    168b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    168f:	48 8d 35 3e 3b 00 00 	lea    0x3b3e(%rip),%rsi        # 51d4 <input+0x3194>
    1696:	48 8d 3d a3 59 00 00 	lea    0x59a3(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    169d:	e8 ce f9 ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    16a2:	48 89 c2             	mov    %rax,%rdx
    16a5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    16a9:	48 89 c6             	mov    %rax,%rsi
    16ac:	48 89 d7             	mov    %rdx,%rdi
    16af:	e8 9c f9 ff ff       	callq  1050 <_ZNSolsEPKv@plt>
    16b4:	48 89 c2             	mov    %rax,%rdx
    16b7:	48 8b 05 12 59 00 00 	mov    0x5912(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    16be:	48 89 c6             	mov    %rax,%rsi
    16c1:	48 89 d7             	mov    %rdx,%rdi
    16c4:	e8 b7 f9 ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    16c9:	48 8d 35 20 3b 00 00 	lea    0x3b20(%rip),%rsi        # 51f0 <input+0x31b0>
    16d0:	48 8d 3d 69 59 00 00 	lea    0x5969(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    16d7:	e8 94 f9 ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    16dc:	48 89 c2             	mov    %rax,%rdx
    16df:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    16e3:	48 8b 00             	mov    (%rax),%rax
    16e6:	48 89 c6             	mov    %rax,%rsi
    16e9:	48 89 d7             	mov    %rdx,%rdi
    16ec:	e8 3f f9 ff ff       	callq  1030 <_ZNSolsEm@plt>
    16f1:	48 89 c2             	mov    %rax,%rdx
    16f4:	48 8b 05 d5 58 00 00 	mov    0x58d5(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    16fb:	48 89 c6             	mov    %rax,%rsi
    16fe:	48 89 d7             	mov    %rdx,%rdi
    1701:	e8 7a f9 ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    1706:	48 8b 05 c3 58 00 00 	mov    0x58c3(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    170d:	48 89 c6             	mov    %rax,%rsi
    1710:	48 8d 3d 29 59 00 00 	lea    0x5929(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    1717:	e8 64 f9 ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    171c:	48 8d 35 ef 3a 00 00 	lea    0x3aef(%rip),%rsi        # 5212 <input+0x31d2>
    1723:	48 8d 3d 16 59 00 00 	lea    0x5916(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    172a:	e8 41 f9 ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    172f:	48 89 c2             	mov    %rax,%rdx
    1732:	48 8b 05 97 58 00 00 	mov    0x5897(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    1739:	48 89 c6             	mov    %rax,%rsi
    173c:	48 89 d7             	mov    %rdx,%rdi
    173f:	e8 3c f9 ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    1744:	be 00 00 00 00       	mov    $0x0,%esi
    1749:	bf 00 00 00 00       	mov    $0x0,%edi
    174e:	e8 2b 02 00 00       	callq  197e <m5_reset_stats>
    1753:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
    175a:	00 
    175b:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
    175f:	4d 89 c6             	mov    %r8,%r14
    1762:	49 89 a6 00 30 00 00 	mov    %rsp,0x3000(%r14)
    1769:	49 89 ae 08 30 00 00 	mov    %rbp,0x3008(%r14)
    1770:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
    1777:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx
    177e:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx
    1785:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
    178c:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
    1793:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    179a:	49 8d a6 00 20 00 00 	lea    0x2000(%r14),%rsp
    17a1:	58                   	pop    %rax
    17a2:	5b                   	pop    %rbx
    17a3:	59                   	pop    %rcx
    17a4:	5a                   	pop    %rdx
    17a5:	5e                   	pop    %rsi
    17a6:	5f                   	pop    %rdi
    17a7:	9d                   	popfq  
    17a8:	5c                   	pop    %rsp
    17a9:	48 89 e5             	mov    %rsp,%rbp
    17ac:	50                   	push   %rax
    17ad:	57                   	push   %rdi
    17ae:	56                   	push   %rsi
    17af:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
    17b6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    17bd:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
    17c4:	0f 04                	(bad)  
    17c6:	5a                   	pop    %rdx
    17c7:	00 5e 5f             	add    %bl,0x5f(%rsi)
    17ca:	58                   	pop    %rax

00000000000017cb <.test_case_enter>:
    17cb:	0f ae e8             	lfence 
    17ce:	48 25 c0 0f 00 00    	and    $0xfc0,%rax
    17d4:	48 8d 5c 03 01       	lea    0x1(%rbx,%rax,1),%rbx
    17d9:	48 8d 5c 03 01       	lea    0x1(%rbx,%rax,1),%rbx
    17de:	48 8d 5c 03 01       	lea    0x1(%rbx,%rax,1),%rbx
    17e3:	48 8d 5c 03 01       	lea    0x1(%rbx,%rax,1),%rbx
    17e8:	48 8d 5c 03 01       	lea    0x1(%rbx,%rax,1),%rbx
    17ed:	48 8d 5c 03 01       	lea    0x1(%rbx,%rax,1),%rbx
    17f2:	48 8d 5c 03 01       	lea    0x1(%rbx,%rax,1),%rbx
    17f7:	48 8d 5c 03 01       	lea    0x1(%rbx,%rax,1),%rbx
    17fc:	48 8d 5c 03 01       	lea    0x1(%rbx,%rax,1),%rbx
    1801:	48 8d 5c 03 01       	lea    0x1(%rbx,%rax,1),%rbx
    1806:	48 83 e3 40          	and    $0x40,%rbx
    180a:	48 83 fb 00          	cmp    $0x0,%rbx
    180e:	74 06                	je     1816 <.l1>

0000000000001810 <.l0>:
    1810:	49 8b 04 06          	mov    (%r14,%rax,1),%rax
    1814:	eb 04                	jmp    181a <.l2>

0000000000001816 <.l1>:
    1816:	49 8b 46 40          	mov    0x40(%r14),%rax

000000000000181a <.l2>:
    181a:	0f ae f0             	mfence 
    181d:	50                   	push   %rax
    181e:	57                   	push   %rdi
    181f:	56                   	push   %rsi
    1820:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
    1827:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    182e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
    1835:	0f 04                	(bad)  
    1837:	5b                   	pop    %rbx
    1838:	00 5e 5f             	add    %bl,0x5f(%rsi)
    183b:	58                   	pop    %rax
    183c:	49 89 c0             	mov    %rax,%r8
    183f:	49 8b a6 00 30 00 00 	mov    0x3000(%r14),%rsp
    1846:	49 8b ae 08 30 00 00 	mov    0x3008(%r14),%rbp
    184d:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    1851:	be 00 00 00 00       	mov    $0x0,%esi
    1856:	bf 00 00 00 00       	mov    $0x0,%edi
    185b:	e8 23 01 00 00       	callq  1983 <m5_dump_stats>
    1860:	48 8d 35 be 39 00 00 	lea    0x39be(%rip),%rsi        # 5225 <input+0x31e5>
    1867:	48 8d 3d d2 57 00 00 	lea    0x57d2(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    186e:	e8 fd f7 ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1873:	48 89 c2             	mov    %rax,%rdx
    1876:	48 8b 05 53 57 00 00 	mov    0x5753(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    187d:	48 89 c6             	mov    %rax,%rsi
    1880:	48 89 d7             	mov    %rdx,%rdi
    1883:	e8 f8 f7 ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    1888:	48 8d 35 b9 39 00 00 	lea    0x39b9(%rip),%rsi        # 5248 <input+0x3208>
    188f:	48 8d 3d aa 57 00 00 	lea    0x57aa(%rip),%rdi        # 7040 <_ZSt4cout@@GLIBCXX_3.4>
    1896:	e8 d5 f7 ff ff       	callq  1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    189b:	48 89 c2             	mov    %rax,%rdx
    189e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    18a2:	48 89 c6             	mov    %rax,%rsi
    18a5:	48 89 d7             	mov    %rdx,%rdi
    18a8:	e8 83 f7 ff ff       	callq  1030 <_ZNSolsEm@plt>
    18ad:	48 89 c2             	mov    %rax,%rdx
    18b0:	48 8b 05 19 57 00 00 	mov    0x5719(%rip),%rax        # 6fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    18b7:	48 89 c6             	mov    %rax,%rsi
    18ba:	48 89 d7             	mov    %rdx,%rdi
    18bd:	e8 be f7 ff ff       	callq  1080 <_ZNSolsEPFRSoS_E@plt>
    18c2:	bf 00 00 00 00       	mov    $0x0,%edi
    18c7:	e8 99 00 00 00       	callq  1965 <m5_exit>
    18cc:	b8 00 00 00 00       	mov    $0x0,%eax
    18d1:	48 83 c4 38          	add    $0x38,%rsp
    18d5:	5b                   	pop    %rbx
    18d6:	41 5e                	pop    %r14
    18d8:	41 5f                	pop    %r15
    18da:	5d                   	pop    %rbp
    18db:	c3                   	retq   

00000000000018dc <_Z41__static_initialization_and_destruction_0ii>:
    18dc:	f3 0f 1e fa          	endbr64 
    18e0:	55                   	push   %rbp
    18e1:	48 89 e5             	mov    %rsp,%rbp
    18e4:	48 83 ec 10          	sub    $0x10,%rsp
    18e8:	89 7d fc             	mov    %edi,-0x4(%rbp)
    18eb:	89 75 f8             	mov    %esi,-0x8(%rbp)
    18ee:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
    18f2:	75 32                	jne    1926 <_Z41__static_initialization_and_destruction_0ii+0x4a>
    18f4:	81 7d f8 ff ff 00 00 	cmpl   $0xffff,-0x8(%rbp)
    18fb:	75 29                	jne    1926 <_Z41__static_initialization_and_destruction_0ii+0x4a>
    18fd:	48 8d 3d 64 58 00 00 	lea    0x5864(%rip),%rdi        # 7168 <_ZStL8__ioinit>
    1904:	e8 97 f7 ff ff       	callq  10a0 <_ZNSt8ios_base4InitC1Ev@plt>
    1909:	48 8d 15 f8 56 00 00 	lea    0x56f8(%rip),%rdx        # 7008 <__dso_handle>
    1910:	48 8d 35 51 58 00 00 	lea    0x5851(%rip),%rsi        # 7168 <_ZStL8__ioinit>
    1917:	48 8b 05 da 56 00 00 	mov    0x56da(%rip),%rax        # 6ff8 <_ZNSt8ios_base4InitD1Ev@GLIBCXX_3.4>
    191e:	48 89 c7             	mov    %rax,%rdi
    1921:	e8 3a f7 ff ff       	callq  1060 <__cxa_atexit@plt>
    1926:	90                   	nop
    1927:	c9                   	leaveq 
    1928:	c3                   	retq   

0000000000001929 <_GLOBAL__sub_I_sandbox>:
    1929:	f3 0f 1e fa          	endbr64 
    192d:	55                   	push   %rbp
    192e:	48 89 e5             	mov    %rsp,%rbp
    1931:	be ff ff 00 00       	mov    $0xffff,%esi
    1936:	bf 01 00 00 00       	mov    $0x1,%edi
    193b:	e8 9c ff ff ff       	callq  18dc <_Z41__static_initialization_and_destruction_0ii>
    1940:	5d                   	pop    %rbp
    1941:	c3                   	retq   

0000000000001942 <m5_arm>:
    1942:	0f 04                	(bad)  
    1944:	00 00                	add    %al,(%rax)
    1946:	c3                   	retq   

0000000000001947 <m5_quiesce>:
    1947:	0f 04                	(bad)  
    1949:	01 00                	add    %eax,(%rax)
    194b:	c3                   	retq   

000000000000194c <m5_quiesce_ns>:
    194c:	0f 04                	(bad)  
    194e:	02 00                	add    (%rax),%al
    1950:	c3                   	retq   

0000000000001951 <m5_quiesce_cycle>:
    1951:	0f 04                	(bad)  
    1953:	03 00                	add    (%rax),%eax
    1955:	c3                   	retq   

0000000000001956 <m5_quiesce_time>:
    1956:	0f 04                	(bad)  
    1958:	04 00                	add    $0x0,%al
    195a:	c3                   	retq   

000000000000195b <m5_rpns>:
    195b:	0f 04                	(bad)  
    195d:	07                   	(bad)  
    195e:	00 c3                	add    %al,%bl

0000000000001960 <m5_wake_cpu>:
    1960:	0f 04                	(bad)  
    1962:	09 00                	or     %eax,(%rax)
    1964:	c3                   	retq   

0000000000001965 <m5_exit>:
    1965:	0f 04                	(bad)  
    1967:	21 00                	and    %eax,(%rax)
    1969:	c3                   	retq   

000000000000196a <m5_fail>:
    196a:	0f 04                	(bad)  
    196c:	22 00                	and    (%rax),%al
    196e:	c3                   	retq   

000000000000196f <m5_sum>:
    196f:	0f 04                	(bad)  
    1971:	23 00                	and    (%rax),%eax
    1973:	c3                   	retq   

0000000000001974 <m5_init_param>:
    1974:	0f 04                	(bad)  
    1976:	30 00                	xor    %al,(%rax)
    1978:	c3                   	retq   

0000000000001979 <m5_load_symbol>:
    1979:	0f 04                	(bad)  
    197b:	31 00                	xor    %eax,(%rax)
    197d:	c3                   	retq   

000000000000197e <m5_reset_stats>:
    197e:	0f 04                	(bad)  
    1980:	40 00 c3             	add    %al,%bl

0000000000001983 <m5_dump_stats>:
    1983:	0f 04                	(bad)  
    1985:	41 00 c3             	add    %al,%r11b

0000000000001988 <m5_dump_reset_stats>:
    1988:	0f 04                	(bad)  
    198a:	42 00 c3             	rex.X add %al,%bl

000000000000198d <m5_checkpoint>:
    198d:	0f 04                	(bad)  
    198f:	43 00 c3             	rex.XB add %al,%r11b

0000000000001992 <m5_write_file>:
    1992:	0f 04                	(bad)  
    1994:	4f 00 c3             	rex.WRXB add %r8b,%r11b

0000000000001997 <m5_read_file>:
    1997:	0f 04                	(bad)  
    1999:	50                   	push   %rax
    199a:	00 c3                	add    %al,%bl

000000000000199c <m5_debug_break>:
    199c:	0f 04                	(bad)  
    199e:	51                   	push   %rcx
    199f:	00 c3                	add    %al,%bl

00000000000019a1 <m5_switch_cpu>:
    19a1:	0f 04                	(bad)  
    19a3:	52                   	push   %rdx
    19a4:	00 c3                	add    %al,%bl

00000000000019a6 <m5_add_symbol>:
    19a6:	0f 04                	(bad)  
    19a8:	53                   	push   %rbx
    19a9:	00 c3                	add    %al,%bl

00000000000019ab <m5_panic>:
    19ab:	0f 04                	(bad)  
    19ad:	54                   	push   %rsp
    19ae:	00 c3                	add    %al,%bl

00000000000019b0 <m5_work_begin>:
    19b0:	0f 04                	(bad)  
    19b2:	5a                   	pop    %rdx
    19b3:	00 c3                	add    %al,%bl

00000000000019b5 <m5_work_end>:
    19b5:	0f 04                	(bad)  
    19b7:	5b                   	pop    %rbx
    19b8:	00 c3                	add    %al,%bl

00000000000019ba <m5_dist_toggle_sync>:
    19ba:	0f 04                	(bad)  
    19bc:	62                   	.byte 0x62
    19bd:	00 c3                	add    %al,%bl

00000000000019bf <m5_workload>:
    19bf:	0f 04                	(bad)  
    19c1:	70 00                	jo     19c3 <m5_workload+0x4>
    19c3:	c3                   	retq   
    19c4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    19cb:	00 00 00 
    19ce:	66 90                	xchg   %ax,%ax

00000000000019d0 <__libc_csu_init>:
    19d0:	f3 0f 1e fa          	endbr64 
    19d4:	41 57                	push   %r15
    19d6:	4c 8d 3d 6b 53 00 00 	lea    0x536b(%rip),%r15        # 6d48 <__frame_dummy_init_array_entry>
    19dd:	41 56                	push   %r14
    19df:	49 89 d6             	mov    %rdx,%r14
    19e2:	41 55                	push   %r13
    19e4:	49 89 f5             	mov    %rsi,%r13
    19e7:	41 54                	push   %r12
    19e9:	41 89 fc             	mov    %edi,%r12d
    19ec:	55                   	push   %rbp
    19ed:	48 8d 2d 64 53 00 00 	lea    0x5364(%rip),%rbp        # 6d58 <__do_global_dtors_aux_fini_array_entry>
    19f4:	53                   	push   %rbx
    19f5:	4c 29 fd             	sub    %r15,%rbp
    19f8:	48 83 ec 08          	sub    $0x8,%rsp
    19fc:	e8 ff f5 ff ff       	callq  1000 <_init>
    1a01:	48 c1 fd 03          	sar    $0x3,%rbp
    1a05:	74 1f                	je     1a26 <__libc_csu_init+0x56>
    1a07:	31 db                	xor    %ebx,%ebx
    1a09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1a10:	4c 89 f2             	mov    %r14,%rdx
    1a13:	4c 89 ee             	mov    %r13,%rsi
    1a16:	44 89 e7             	mov    %r12d,%edi
    1a19:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    1a1d:	48 83 c3 01          	add    $0x1,%rbx
    1a21:	48 39 dd             	cmp    %rbx,%rbp
    1a24:	75 ea                	jne    1a10 <__libc_csu_init+0x40>
    1a26:	48 83 c4 08          	add    $0x8,%rsp
    1a2a:	5b                   	pop    %rbx
    1a2b:	5d                   	pop    %rbp
    1a2c:	41 5c                	pop    %r12
    1a2e:	41 5d                	pop    %r13
    1a30:	41 5e                	pop    %r14
    1a32:	41 5f                	pop    %r15
    1a34:	c3                   	retq   
    1a35:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    1a3c:	00 00 00 00 

0000000000001a40 <__libc_csu_fini>:
    1a40:	f3 0f 1e fa          	endbr64 
    1a44:	c3                   	retq   

Disassembly of section .fini:

0000000000001a48 <_fini>:
    1a48:	f3 0f 1e fa          	endbr64 
    1a4c:	48 83 ec 08          	sub    $0x8,%rsp
    1a50:	48 83 c4 08          	add    $0x8,%rsp
    1a54:	c3                   	retq   
