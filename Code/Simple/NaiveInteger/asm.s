
dist/Release/GNU-Linux-x86/naiveinteger:     file format elf64-x86-64


Disassembly of section .init:

00000000004019a0 <_init>:
  4019a0:	48 83 ec 08          	sub    $0x8,%rsp
  4019a4:	48 8b 05 4d 36 20 00 	mov    0x20364d(%rip),%rax        # 604ff8 <_DYNAMIC+0x210>
  4019ab:	48 85 c0             	test   %rax,%rax
  4019ae:	74 05                	je     4019b5 <_init+0x15>
  4019b0:	e8 4b 00 00 00       	callq  401a00 <__gmon_start__@plt>
  4019b5:	48 83 c4 08          	add    $0x8,%rsp
  4019b9:	c3                   	retq   

Disassembly of section .plt:

00000000004019c0 <_ZSt20__throw_length_errorPKc@plt-0x10>:
  4019c0:	ff 35 42 36 20 00    	pushq  0x203642(%rip)        # 605008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4019c6:	ff 25 44 36 20 00    	jmpq   *0x203644(%rip)        # 605010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4019cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004019d0 <_ZSt20__throw_length_errorPKc@plt>:
  4019d0:	ff 25 42 36 20 00    	jmpq   *0x203642(%rip)        # 605018 <_GLOBAL_OFFSET_TABLE_+0x18>
  4019d6:	68 00 00 00 00       	pushq  $0x0
  4019db:	e9 e0 ff ff ff       	jmpq   4019c0 <_init+0x20>

00000000004019e0 <_ZSt16__throw_bad_castv@plt>:
  4019e0:	ff 25 3a 36 20 00    	jmpq   *0x20363a(%rip)        # 605020 <_GLOBAL_OFFSET_TABLE_+0x20>
  4019e6:	68 01 00 00 00       	pushq  $0x1
  4019eb:	e9 d0 ff ff ff       	jmpq   4019c0 <_init+0x20>

00000000004019f0 <_ZNSt8ios_baseC2Ev@plt>:
  4019f0:	ff 25 32 36 20 00    	jmpq   *0x203632(%rip)        # 605028 <_GLOBAL_OFFSET_TABLE_+0x28>
  4019f6:	68 02 00 00 00       	pushq  $0x2
  4019fb:	e9 c0 ff ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401a00 <__gmon_start__@plt>:
  401a00:	ff 25 2a 36 20 00    	jmpq   *0x20362a(%rip)        # 605030 <_GLOBAL_OFFSET_TABLE_+0x30>
  401a06:	68 03 00 00 00       	pushq  $0x3
  401a0b:	e9 b0 ff ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401a10 <_Znam@plt>:
  401a10:	ff 25 22 36 20 00    	jmpq   *0x203622(%rip)        # 605038 <_GLOBAL_OFFSET_TABLE_+0x38>
  401a16:	68 04 00 00 00       	pushq  $0x4
  401a1b:	e9 a0 ff ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401a20 <PAPI_start_counters@plt>:
  401a20:	ff 25 1a 36 20 00    	jmpq   *0x20361a(%rip)        # 605040 <_GLOBAL_OFFSET_TABLE_+0x40>
  401a26:	68 05 00 00 00       	pushq  $0x5
  401a2b:	e9 90 ff ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401a30 <_ZdlPv@plt>:
  401a30:	ff 25 12 36 20 00    	jmpq   *0x203612(%rip)        # 605048 <_GLOBAL_OFFSET_TABLE_+0x48>
  401a36:	68 06 00 00 00       	pushq  $0x6
  401a3b:	e9 80 ff ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>:
  401a40:	ff 25 0a 36 20 00    	jmpq   *0x20360a(%rip)        # 605050 <_GLOBAL_OFFSET_TABLE_+0x50>
  401a46:	68 07 00 00 00       	pushq  $0x7
  401a4b:	e9 70 ff ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401a50 <exit@plt>:
  401a50:	ff 25 02 36 20 00    	jmpq   *0x203602(%rip)        # 605058 <_GLOBAL_OFFSET_TABLE_+0x58>
  401a56:	68 08 00 00 00       	pushq  $0x8
  401a5b:	e9 60 ff ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401a60 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>:
  401a60:	ff 25 fa 35 20 00    	jmpq   *0x2035fa(%rip)        # 605060 <_GLOBAL_OFFSET_TABLE_+0x60>
  401a66:	68 09 00 00 00       	pushq  $0x9
  401a6b:	e9 50 ff ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401a70 <__printf_chk@plt>:
  401a70:	ff 25 f2 35 20 00    	jmpq   *0x2035f2(%rip)        # 605068 <_GLOBAL_OFFSET_TABLE_+0x68>
  401a76:	68 0a 00 00 00       	pushq  $0xa
  401a7b:	e9 40 ff ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401a80 <_ZNSi5tellgEv@plt>:
  401a80:	ff 25 ea 35 20 00    	jmpq   *0x2035ea(%rip)        # 605070 <_GLOBAL_OFFSET_TABLE_+0x70>
  401a86:	68 0b 00 00 00       	pushq  $0xb
  401a8b:	e9 30 ff ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401a90 <_ZNSt8ios_base4InitC1Ev@plt>:
  401a90:	ff 25 e2 35 20 00    	jmpq   *0x2035e2(%rip)        # 605078 <_GLOBAL_OFFSET_TABLE_+0x78>
  401a96:	68 0c 00 00 00       	pushq  $0xc
  401a9b:	e9 20 ff ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401aa0 <__libc_start_main@plt>:
  401aa0:	ff 25 da 35 20 00    	jmpq   *0x2035da(%rip)        # 605080 <_GLOBAL_OFFSET_TABLE_+0x80>
  401aa6:	68 0d 00 00 00       	pushq  $0xd
  401aab:	e9 10 ff ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401ab0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1ERKSsSt13_Ios_Openmode@plt>:
  401ab0:	ff 25 d2 35 20 00    	jmpq   *0x2035d2(%rip)        # 605088 <_GLOBAL_OFFSET_TABLE_+0x88>
  401ab6:	68 0e 00 00 00       	pushq  $0xe
  401abb:	e9 00 ff ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401ac0 <_ZNSi5seekgElSt12_Ios_Seekdir@plt>:
  401ac0:	ff 25 ca 35 20 00    	jmpq   *0x2035ca(%rip)        # 605090 <_GLOBAL_OFFSET_TABLE_+0x90>
  401ac6:	68 0f 00 00 00       	pushq  $0xf
  401acb:	e9 f0 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401ad0 <__cxa_atexit@plt>:
  401ad0:	ff 25 c2 35 20 00    	jmpq   *0x2035c2(%rip)        # 605098 <_GLOBAL_OFFSET_TABLE_+0x98>
  401ad6:	68 10 00 00 00       	pushq  $0x10
  401adb:	e9 e0 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401ae0 <_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode@plt>:
  401ae0:	ff 25 ba 35 20 00    	jmpq   *0x2035ba(%rip)        # 6050a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  401ae6:	68 11 00 00 00       	pushq  $0x11
  401aeb:	e9 d0 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401af0 <_ZNSi4readEPcl@plt>:
  401af0:	ff 25 b2 35 20 00    	jmpq   *0x2035b2(%rip)        # 6050a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  401af6:	68 12 00 00 00       	pushq  $0x12
  401afb:	e9 c0 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401b00 <_ZNSt8ios_base4InitD1Ev@plt>:
  401b00:	ff 25 aa 35 20 00    	jmpq   *0x2035aa(%rip)        # 6050b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  401b06:	68 13 00 00 00       	pushq  $0x13
  401b0b:	e9 b0 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401b10 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
  401b10:	ff 25 a2 35 20 00    	jmpq   *0x2035a2(%rip)        # 6050b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  401b16:	68 14 00 00 00       	pushq  $0x14
  401b1b:	e9 a0 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401b20 <PAPI_stop_counters@plt>:
  401b20:	ff 25 9a 35 20 00    	jmpq   *0x20359a(%rip)        # 6050c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  401b26:	68 15 00 00 00       	pushq  $0x15
  401b2b:	e9 90 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401b30 <PAPI_get_real_usec@plt>:
  401b30:	ff 25 92 35 20 00    	jmpq   *0x203592(%rip)        # 6050c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  401b36:	68 16 00 00 00       	pushq  $0x16
  401b3b:	e9 80 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401b40 <_ZNSs6insertEmPKc@plt>:
  401b40:	ff 25 8a 35 20 00    	jmpq   *0x20358a(%rip)        # 6050d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  401b46:	68 17 00 00 00       	pushq  $0x17
  401b4b:	e9 70 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401b50 <_ZNSs6insertEmPKcm@plt>:
  401b50:	ff 25 82 35 20 00    	jmpq   *0x203582(%rip)        # 6050d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  401b56:	68 18 00 00 00       	pushq  $0x18
  401b5b:	e9 60 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401b60 <pow@plt>:
  401b60:	ff 25 7a 35 20 00    	jmpq   *0x20357a(%rip)        # 6050e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  401b66:	68 19 00 00 00       	pushq  $0x19
  401b6b:	e9 50 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401b70 <_ZNSsC1EPKcRKSaIcE@plt>:
  401b70:	ff 25 72 35 20 00    	jmpq   *0x203572(%rip)        # 6050e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  401b76:	68 1a 00 00 00       	pushq  $0x1a
  401b7b:	e9 40 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401b80 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@plt>:
  401b80:	ff 25 6a 35 20 00    	jmpq   *0x20356a(%rip)        # 6050f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  401b86:	68 1b 00 00 00       	pushq  $0x1b
  401b8b:	e9 30 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401b90 <strtol@plt>:
  401b90:	ff 25 62 35 20 00    	jmpq   *0x203562(%rip)        # 6050f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  401b96:	68 1c 00 00 00       	pushq  $0x1c
  401b9b:	e9 20 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401ba0 <PAPI_strerror@plt>:
  401ba0:	ff 25 5a 35 20 00    	jmpq   *0x20355a(%rip)        # 605100 <_GLOBAL_OFFSET_TABLE_+0x100>
  401ba6:	68 1d 00 00 00       	pushq  $0x1d
  401bab:	e9 10 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401bb0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>:
  401bb0:	ff 25 52 35 20 00    	jmpq   *0x203552(%rip)        # 605108 <_GLOBAL_OFFSET_TABLE_+0x108>
  401bb6:	68 1e 00 00 00       	pushq  $0x1e
  401bbb:	e9 00 fe ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401bc0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>:
  401bc0:	ff 25 4a 35 20 00    	jmpq   *0x20354a(%rip)        # 605110 <_GLOBAL_OFFSET_TABLE_+0x110>
  401bc6:	68 1f 00 00 00       	pushq  $0x1f
  401bcb:	e9 f0 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401bd0 <memmove@plt>:
  401bd0:	ff 25 42 35 20 00    	jmpq   *0x203542(%rip)        # 605118 <_GLOBAL_OFFSET_TABLE_+0x118>
  401bd6:	68 20 00 00 00       	pushq  $0x20
  401bdb:	e9 e0 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401be0 <_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@plt>:
  401be0:	ff 25 3a 35 20 00    	jmpq   *0x20353a(%rip)        # 605120 <_GLOBAL_OFFSET_TABLE_+0x120>
  401be6:	68 21 00 00 00       	pushq  $0x21
  401beb:	e9 d0 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401bf0 <PAPI_get_real_cyc@plt>:
  401bf0:	ff 25 32 35 20 00    	jmpq   *0x203532(%rip)        # 605128 <_GLOBAL_OFFSET_TABLE_+0x128>
  401bf6:	68 22 00 00 00       	pushq  $0x22
  401bfb:	e9 c0 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401c00 <_ZNSo5flushEv@plt>:
  401c00:	ff 25 2a 35 20 00    	jmpq   *0x20352a(%rip)        # 605130 <_GLOBAL_OFFSET_TABLE_+0x130>
  401c06:	68 23 00 00 00       	pushq  $0x23
  401c0b:	e9 b0 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401c10 <__stack_chk_fail@plt>:
  401c10:	ff 25 22 35 20 00    	jmpq   *0x203522(%rip)        # 605138 <_GLOBAL_OFFSET_TABLE_+0x138>
  401c16:	68 24 00 00 00       	pushq  $0x24
  401c1b:	e9 a0 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401c20 <_ZNSt8ios_baseD2Ev@plt>:
  401c20:	ff 25 1a 35 20 00    	jmpq   *0x20351a(%rip)        # 605140 <_GLOBAL_OFFSET_TABLE_+0x140>
  401c26:	68 25 00 00 00       	pushq  $0x25
  401c2b:	e9 90 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401c30 <_ZNSt12__basic_fileIcED1Ev@plt>:
  401c30:	ff 25 12 35 20 00    	jmpq   *0x203512(%rip)        # 605148 <_GLOBAL_OFFSET_TABLE_+0x148>
  401c36:	68 26 00 00 00       	pushq  $0x26
  401c3b:	e9 80 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401c40 <_ZdaPv@plt>:
  401c40:	ff 25 0a 35 20 00    	jmpq   *0x20350a(%rip)        # 605150 <_GLOBAL_OFFSET_TABLE_+0x150>
  401c46:	68 27 00 00 00       	pushq  $0x27
  401c4b:	e9 70 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401c50 <_ZNSs6appendEPKc@plt>:
  401c50:	ff 25 02 35 20 00    	jmpq   *0x203502(%rip)        # 605158 <_GLOBAL_OFFSET_TABLE_+0x158>
  401c56:	68 28 00 00 00       	pushq  $0x28
  401c5b:	e9 60 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401c60 <_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@plt>:
  401c60:	ff 25 fa 34 20 00    	jmpq   *0x2034fa(%rip)        # 605160 <_GLOBAL_OFFSET_TABLE_+0x160>
  401c66:	68 29 00 00 00       	pushq  $0x29
  401c6b:	e9 50 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401c70 <_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev@plt>:
  401c70:	ff 25 f2 34 20 00    	jmpq   *0x2034f2(%rip)        # 605168 <_GLOBAL_OFFSET_TABLE_+0x168>
  401c76:	68 2a 00 00 00       	pushq  $0x2a
  401c7b:	e9 40 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401c80 <_ZNSo9_M_insertImEERSoT_@plt>:
  401c80:	ff 25 ea 34 20 00    	jmpq   *0x2034ea(%rip)        # 605170 <_GLOBAL_OFFSET_TABLE_+0x170>
  401c86:	68 2b 00 00 00       	pushq  $0x2b
  401c8b:	e9 30 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401c90 <__cxa_end_catch@plt>:
  401c90:	ff 25 e2 34 20 00    	jmpq   *0x2034e2(%rip)        # 605178 <_GLOBAL_OFFSET_TABLE_+0x178>
  401c96:	68 2c 00 00 00       	pushq  $0x2c
  401c9b:	e9 20 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401ca0 <_ZSt17__throw_bad_allocv@plt>:
  401ca0:	ff 25 da 34 20 00    	jmpq   *0x2034da(%rip)        # 605180 <_GLOBAL_OFFSET_TABLE_+0x180>
  401ca6:	68 2d 00 00 00       	pushq  $0x2d
  401cab:	e9 10 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401cb0 <_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev@plt>:
  401cb0:	ff 25 d2 34 20 00    	jmpq   *0x2034d2(%rip)        # 605188 <_GLOBAL_OFFSET_TABLE_+0x188>
  401cb6:	68 2e 00 00 00       	pushq  $0x2e
  401cbb:	e9 00 fd ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401cc0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>:
  401cc0:	ff 25 ca 34 20 00    	jmpq   *0x2034ca(%rip)        # 605190 <_GLOBAL_OFFSET_TABLE_+0x190>
  401cc6:	68 2f 00 00 00       	pushq  $0x2f
  401ccb:	e9 f0 fc ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401cd0 <__cxa_begin_catch@plt>:
  401cd0:	ff 25 c2 34 20 00    	jmpq   *0x2034c2(%rip)        # 605198 <_GLOBAL_OFFSET_TABLE_+0x198>
  401cd6:	68 30 00 00 00       	pushq  $0x30
  401cdb:	e9 e0 fc ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401ce0 <__gxx_personality_v0@plt>:
  401ce0:	ff 25 ba 34 20 00    	jmpq   *0x2034ba(%rip)        # 6051a0 <_GLOBAL_OFFSET_TABLE_+0x1a0>
  401ce6:	68 31 00 00 00       	pushq  $0x31
  401ceb:	e9 d0 fc ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401cf0 <_Znwm@plt>:
  401cf0:	ff 25 b2 34 20 00    	jmpq   *0x2034b2(%rip)        # 6051a8 <_GLOBAL_OFFSET_TABLE_+0x1a8>
  401cf6:	68 32 00 00 00       	pushq  $0x32
  401cfb:	e9 c0 fc ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401d00 <_Unwind_Resume@plt>:
  401d00:	ff 25 aa 34 20 00    	jmpq   *0x2034aa(%rip)        # 6051b0 <_GLOBAL_OFFSET_TABLE_+0x1b0>
  401d06:	68 33 00 00 00       	pushq  $0x33
  401d0b:	e9 b0 fc ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401d10 <_ZNSt6localeD1Ev@plt>:
  401d10:	ff 25 a2 34 20 00    	jmpq   *0x2034a2(%rip)        # 6051b8 <_GLOBAL_OFFSET_TABLE_+0x1b8>
  401d16:	68 34 00 00 00       	pushq  $0x34
  401d1b:	e9 a0 fc ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401d20 <_ZNKSt12__basic_fileIcE7is_openEv@plt>:
  401d20:	ff 25 9a 34 20 00    	jmpq   *0x20349a(%rip)        # 6051c0 <_GLOBAL_OFFSET_TABLE_+0x1c0>
  401d26:	68 35 00 00 00       	pushq  $0x35
  401d2b:	e9 90 fc ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401d30 <_ZNSo3putEc@plt>:
  401d30:	ff 25 92 34 20 00    	jmpq   *0x203492(%rip)        # 6051c8 <_GLOBAL_OFFSET_TABLE_+0x1c8>
  401d36:	68 36 00 00 00       	pushq  $0x36
  401d3b:	e9 80 fc ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401d40 <_ZNSs6appendERKSs@plt>:
  401d40:	ff 25 8a 34 20 00    	jmpq   *0x20348a(%rip)        # 6051d0 <_GLOBAL_OFFSET_TABLE_+0x1d0>
  401d46:	68 37 00 00 00       	pushq  $0x37
  401d4b:	e9 70 fc ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401d50 <_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv@plt>:
  401d50:	ff 25 82 34 20 00    	jmpq   *0x203482(%rip)        # 6051d8 <_GLOBAL_OFFSET_TABLE_+0x1d8>
  401d56:	68 38 00 00 00       	pushq  $0x38
  401d5b:	e9 60 fc ff ff       	jmpq   4019c0 <_init+0x20>

0000000000401d60 <_ZNSo9_M_insertIxEERSoT_@plt>:
  401d60:	ff 25 7a 34 20 00    	jmpq   *0x20347a(%rip)        # 6051e0 <_GLOBAL_OFFSET_TABLE_+0x1e0>
  401d66:	68 39 00 00 00       	pushq  $0x39
  401d6b:	e9 50 fc ff ff       	jmpq   4019c0 <_init+0x20>

Disassembly of section .text:

0000000000401d70 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.part.9>:
    operator<<(basic_ostream<_CharT, _Traits>& __out, const char* __s);

  // Partial specializations
  template<class _Traits>
    inline basic_ostream<char, _Traits>&
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
  401d70:	50                   	push   %rax
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
  401d71:	48 8b 07             	mov    (%rdi),%rax
  401d74:	48 03 78 e8          	add    -0x18(%rax),%rdi
  operator&(_Ios_Iostate __a, _Ios_Iostate __b)
  { return _Ios_Iostate(static_cast<int>(__a) & static_cast<int>(__b)); }

  inline _GLIBCXX_CONSTEXPR _Ios_Iostate
  operator|(_Ios_Iostate __a, _Ios_Iostate __b)
  { return _Ios_Iostate(static_cast<int>(__a) | static_cast<int>(__b)); }
  401d78:	8b 77 20             	mov    0x20(%rdi),%esi
  401d7b:	83 ce 01             	or     $0x1,%esi
       *
       *  See std::ios_base::iostate for the possible bit values.
      */
      void
      setstate(iostate __state)
      { this->clear(this->rdstate() | __state); }
  401d7e:	e8 dd fe ff ff       	callq  401c60 <_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@plt>
      else
	__ostream_insert(__out, __s,
			 static_cast<streamsize>(_Traits::length(__s)));
      return __out;
    }
  401d83:	5a                   	pop    %rdx
  401d84:	c3                   	retq   
  401d85:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401d8c:	00 00 00 
  401d8f:	90                   	nop

0000000000401d90 <_GLOBAL__sub_I__ZN4NodeC2EPSt6vectorIiSaIiEEiiPS_j>:
        ulong pos = i*wordsize;
        return pos + popcountBinarySelectAux(maskedWord, charBit, occurance - occ);
    } else {
        occ += wordOcc;
    }
}
  401d90:	48 83 ec 08          	sub    $0x8,%rsp
  extern wostream wclog;	/// Linked to standard error (buffered)
#endif
  //@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
  401d94:	bf e1 54 60 00       	mov    $0x6054e1,%edi
  401d99:	e8 f2 fc ff ff       	callq  401a90 <_ZNSt8ios_base4InitC1Ev@plt>
  401d9e:	ba f0 51 60 00       	mov    $0x6051f0,%edx
  401da3:	be e1 54 60 00       	mov    $0x6054e1,%esi
  401da8:	bf 00 1b 40 00       	mov    $0x401b00,%edi
  401dad:	48 83 c4 08          	add    $0x8,%rsp
  401db1:	e9 1a fd ff ff       	jmpq   401ad0 <__cxa_atexit@plt>
  401db6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401dbd:	00 00 00 

0000000000401dc0 <main>:
}

/*
 * 
 */
int main(int argc, char** argv) {
  401dc0:	41 57                	push   %r15
  401dc2:	41 56                	push   %r14
  401dc4:	41 55                	push   %r13
  401dc6:	41 54                	push   %r12
  401dc8:	55                   	push   %rbp
  401dc9:	53                   	push   %rbx
  401dca:	48 81 ec 78 05 00 00 	sub    $0x578,%rsp
  401dd1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401dd8:	00 00 
  401dda:	48 89 84 24 68 05 00 	mov    %rax,0x568(%rsp)
  401de1:	00 
  401de2:	31 c0                	xor    %eax,%eax
    if(argc < 4) { cout << "NOT ENOUGH ARGUMENTS" << endl; return 0; }
  401de4:	83 ff 03             	cmp    $0x3,%edi
  401de7:	0f 8e 39 08 00 00    	jle    402626 <main+0x866>
    
    string filename = "../../../Data/n" + string(argv[1]) + "_as" + string(argv[2]) + ".data";
  401ded:	48 8d 94 24 90 00 00 	lea    0x90(%rsp),%rdx
  401df4:	00 
  401df5:	48 89 f5             	mov    %rsi,%rbp
  401df8:	48 8b 76 10          	mov    0x10(%rsi),%rsi
  401dfc:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  401e03:	00 
  401e04:	e8 67 fd ff ff       	callq  401b70 <_ZNSsC1EPKcRKSaIcE@plt>
  401e09:	48 8b 75 08          	mov    0x8(%rbp),%rsi
  401e0d:	48 8d 94 24 80 00 00 	lea    0x80(%rsp),%rdx
  401e14:	00 
  401e15:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  401e1c:	00 
  401e1d:	e8 4e fd ff ff       	callq  401b70 <_ZNSsC1EPKcRKSaIcE@plt>

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(const _CharT* __lhs,
	      basic_string<_CharT, _Traits, _Alloc>&& __rhs)
    { return std::move(__rhs.insert(0, __lhs)); }
  401e22:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  401e29:	00 
  401e2a:	ba d3 40 40 00       	mov    $0x4040d3,%edx
  401e2f:	31 f6                	xor    %esi,%esi
  401e31:	e8 0a fd ff ff       	callq  401b40 <_ZNSs6insertEmPKc@plt>
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  401e36:	48 8b 10             	mov    (%rax),%rdx

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(basic_string<_CharT, _Traits, _Alloc>&& __lhs,
	      const _CharT* __rhs)
    { return std::move(__lhs.append(__rhs)); }
  401e39:	48 8d bc 24 c0 00 00 	lea    0xc0(%rsp),%rdi
  401e40:	00 
  401e41:	be e3 40 40 00       	mov    $0x4040e3,%esi
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  401e46:	48 89 94 24 c0 00 00 	mov    %rdx,0xc0(%rsp)
  401e4d:	00 
      _M_data() const
      { return  _M_dataplus._M_p; }

      _CharT*
      _M_data(_CharT* __p)
      { return (_M_dataplus._M_p = __p); }
  401e4e:	48 c7 00 d8 54 60 00 	movq   $0x6054d8,(%rax)

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(basic_string<_CharT, _Traits, _Alloc>&& __lhs,
	      const _CharT* __rhs)
    { return std::move(__lhs.append(__rhs)); }
  401e55:	e8 f6 fd ff ff       	callq  401c50 <_ZNSs6appendEPKc@plt>
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  401e5a:	48 8b 10             	mov    (%rax),%rdx
  401e5d:	4c 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%r15
  401e64:	00 
  401e65:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  401e6c:	00 
  401e6d:	4c 89 fe             	mov    %r15,%rsi
  401e70:	48 89 94 24 d0 00 00 	mov    %rdx,0xd0(%rsp)
  401e77:	00 
  401e78:	48 8d 94 24 e0 00 00 	lea    0xe0(%rsp),%rdx
  401e7f:	00 
      _M_data() const
      { return  _M_dataplus._M_p; }

      _CharT*
      _M_data(_CharT* __p)
      { return (_M_dataplus._M_p = __p); }
  401e80:	48 c7 00 d8 54 60 00 	movq   $0x6054d8,(%rax)
  401e87:	e8 b4 20 00 00       	callq  403f40 <_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EOS6_S7_>

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(basic_string<_CharT, _Traits, _Alloc>&& __lhs,
	      const _CharT* __rhs)
    { return std::move(__lhs.append(__rhs)); }
  401e8c:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  401e93:	00 
  401e94:	be e7 40 40 00       	mov    $0x4040e7,%esi
  401e99:	e8 b2 fd ff ff       	callq  401c50 <_ZNSs6appendEPKc@plt>
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  401e9e:	4c 8b 30             	mov    (%rax),%r14
      _M_data() const
      { return  _M_dataplus._M_p; }

      _CharT*
      _M_data(_CharT* __p)
      { return (_M_dataplus._M_p = __p); }
  401ea1:	48 c7 00 d8 54 60 00 	movq   $0x6054d8,(%rax)

      /**
       *  @brief  Destroy the string instance.
       */
      ~basic_string() _GLIBCXX_NOEXCEPT
      { _M_rep()->_M_dispose(this->get_allocator()); }
  401ea8:	4c 8d ac 24 a0 00 00 	lea    0xa0(%rsp),%r13
  401eaf:	00 
  401eb0:	48 8b 84 24 00 01 00 	mov    0x100(%rsp),%rax
  401eb7:	00 
  401eb8:	4c 89 ee             	mov    %r13,%rsi
  401ebb:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  401ebf:	e8 7c fb ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  401ec4:	48 8b 84 24 d0 00 00 	mov    0xd0(%rsp),%rax
  401ecb:	00 
  401ecc:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  401ed3:	00 
  401ed4:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  401ed8:	e8 63 fb ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  401edd:	48 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%rax
  401ee4:	00 
  401ee5:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  401eec:	00 
  401eed:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  401ef1:	e8 4a fb ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  401ef6:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
  401efd:	00 
  401efe:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  401f05:	00 
  401f06:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  401f0a:	e8 31 fb ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  401f0f:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  401f16:	00 
  401f17:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  401f1e:	00 
  401f1f:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  401f23:	e8 18 fb ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
    operator<<(basic_ostream<_CharT, _Traits>& __os,
	       const basic_string<_CharT, _Traits, _Alloc>& __str)
    {
      // _GLIBCXX_RESOLVE_LIB_DEFECTS
      // 586. string inserter not a formatted function
      return __ostream_insert(__os, __str.data(), __str.size());
  401f28:	49 8b 56 e8          	mov    -0x18(%r14),%rdx
  401f2c:	4c 89 f6             	mov    %r14,%rsi
  401f2f:	bf 00 53 60 00       	mov    $0x605300,%edi
  401f34:	e8 87 fc ff ff       	callq  401bc0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
      operator<<(__ostream_type& (*__pf)(__ostream_type&))
      {
	// _GLIBCXX_RESOLVE_LIB_DEFECTS
	// DR 60. What is a formatted input function?
	// The inserters for manipulators are *not* formatted output functions.
	return __pf(*this);
  401f39:	48 89 c7             	mov    %rax,%rdi
  401f3c:	e8 7f fd ff ff       	callq  401cc0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    cout << filename << endl;
    int size_out = 0;
    int* inputArr = read_file(size_out, filename.c_str());
  401f41:	48 8d 7c 24 4c       	lea    0x4c(%rsp),%rdi
  401f46:	4c 89 f6             	mov    %r14,%rsi
int main(int argc, char** argv) {
    if(argc < 4) { cout << "NOT ENOUGH ARGUMENTS" << endl; return 0; }
    
    string filename = "../../../Data/n" + string(argv[1]) + "_as" + string(argv[2]) + ".data";
    cout << filename << endl;
    int size_out = 0;
  401f49:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%rsp)
  401f50:	00 
    int* inputArr = read_file(size_out, filename.c_str());
  401f51:	e8 8a 1c 00 00       	callq  403be0 <_Z9read_fileRiPKc>
    
    vector<int>* input = new vector<int>(inputArr, inputArr + size_out);
  401f56:	bf 18 00 00 00       	mov    $0x18,%edi
    if(argc < 4) { cout << "NOT ENOUGH ARGUMENTS" << endl; return 0; }
    
    string filename = "../../../Data/n" + string(argv[1]) + "_as" + string(argv[2]) + ".data";
    cout << filename << endl;
    int size_out = 0;
    int* inputArr = read_file(size_out, filename.c_str());
  401f5b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    
    vector<int>* input = new vector<int>(inputArr, inputArr + size_out);
  401f60:	e8 8b fd ff ff       	callq  401cf0 <_Znwm@plt>
  401f65:	48 63 5c 24 4c       	movslq 0x4c(%rsp),%rbx
  401f6a:	49 89 c4             	mov    %rax,%r12
	_Vector_impl()
	: _Tp_alloc_type(), _M_start(0), _M_finish(0), _M_end_of_storage(0)
	{ }

	_Vector_impl(_Tp_alloc_type const& __a)
	: _Tp_alloc_type(__a), _M_start(0), _M_finish(0), _M_end_of_storage(0)
  401f6d:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  401f74:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  401f7b:	00 
  401f7c:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  401f83:	00 
    public:
      _Vector_impl _M_impl;

      pointer
      _M_allocate(size_t __n)
      { return __n != 0 ? _M_impl.allocate(__n) : 0; }
  401f84:	31 c0                	xor    %eax,%eax
  401f86:	48 85 db             	test   %rbx,%rbx
  401f89:	0f 85 76 06 00 00    	jne    402605 <main+0x845>
        _M_range_initialize(_ForwardIterator __first,
			    _ForwardIterator __last, std::forward_iterator_tag)
        {
	  const size_type __n = std::distance(__first, __last);
	  this->_M_impl._M_start = this->_M_allocate(__n);
	  this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
  401f8f:	48 8d 14 9d 00 00 00 	lea    0x0(,%rbx,4),%rdx
  401f96:	00 
      template<typename _Tp>
        static _Tp*
        __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
        {
	  const ptrdiff_t _Num = __last - __first;
	  if (_Num)
  401f97:	48 85 db             	test   %rbx,%rbx
        void
        _M_range_initialize(_ForwardIterator __first,
			    _ForwardIterator __last, std::forward_iterator_tag)
        {
	  const size_type __n = std::distance(__first, __last);
	  this->_M_impl._M_start = this->_M_allocate(__n);
  401f9a:	49 89 04 24          	mov    %rax,(%r12)
	  this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
  401f9e:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
  401fa2:	49 89 4c 24 10       	mov    %rcx,0x10(%r12)
  401fa7:	0f 85 3c 06 00 00    	jne    4025e9 <main+0x829>
    delete[] inputArr;
  401fad:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
	  this->_M_impl._M_finish =
  401fb3:	49 89 4c 24 08       	mov    %rcx,0x8(%r12)
  401fb8:	74 0a                	je     401fc4 <main+0x204>
  401fba:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  401fbf:	e8 7c fc ff ff       	callq  401c40 <_ZdaPv@plt>
#ifdef __USE_EXTERN_INLINES
__BEGIN_NAMESPACE_STD
__extern_inline int
__NTH (atoi (const char *__nptr))
{
  return (int) strtol (__nptr, (char **) NULL, 10);
  401fc4:	48 8b 7d 08          	mov    0x8(%rbp),%rdi
  401fc8:	ba 0a 00 00 00       	mov    $0xa,%edx
  401fcd:	31 f6                	xor    %esi,%esi
  401fcf:	e8 bc fb ff ff       	callq  401b90 <strtol@plt>
    inline _GLIBCXX_CONSTEXPR
    typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    pow(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return pow(__type(__x), __type(__y));
  401fd4:	c5 fb 10 05 6c 21 00 	vmovsd 0x216c(%rip),%xmm0        # 404148 <_IO_stdin_used+0x118>
  401fdb:	00 
  401fdc:	c5 f3 2a c8          	vcvtsi2sd %eax,%xmm1,%xmm1
  401fe0:	e8 7b fb ff ff       	callq  401b60 <pow@plt>
  401fe5:	48 8b 7d 10          	mov    0x10(%rbp),%rdi
  401fe9:	ba 0a 00 00 00       	mov    $0xa,%edx
    
    int amount = pow(10, atoi(argv[1]));
  401fee:	c5 fb 2c c0          	vcvttsd2si %xmm0,%eax
  401ff2:	31 f6                	xor    %esi,%esi
  401ff4:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401ff8:	e8 93 fb ff ff       	callq  401b90 <strtol@plt>
  401ffd:	c5 fb 10 05 4b 21 00 	vmovsd 0x214b(%rip),%xmm0        # 404150 <_IO_stdin_used+0x120>
  402004:	00 
  402005:	c5 f3 2a c8          	vcvtsi2sd %eax,%xmm1,%xmm1
  402009:	e8 52 fb ff ff       	callq  401b60 <pow@plt>
  40200e:	48 8b 7d 18          	mov    0x18(%rbp),%rdi
  402012:	ba 0a 00 00 00       	mov    $0xa,%edx
    int alphabetSize = pow(2, atoi(argv[2]));
  402017:	c5 fb 2c c0          	vcvttsd2si %xmm0,%eax
  40201b:	31 f6                	xor    %esi,%esi
  40201d:	89 44 24 18          	mov    %eax,0x18(%rsp)
  402021:	e8 6a fb ff ff       	callq  401b90 <strtol@plt>
    
    
    /***************/
    /*  BUILDING  */
    /***************/
    string buildOutputFilename = "../../../Output/naiveinteger_build_n" + string(argv[1]) + "_as" + string(argv[2]) + ".output";
  402026:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  40202a:	48 8d 94 24 b0 00 00 	lea    0xb0(%rsp),%rdx
  402031:	00 
  402032:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  402039:	00 
  40203a:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    vector<int>* input = new vector<int>(inputArr, inputArr + size_out);
    delete[] inputArr;
    
    int amount = pow(10, atoi(argv[1]));
    int alphabetSize = pow(2, atoi(argv[2]));
    uint skew = atoi(argv[3]);
  40203f:	89 c3                	mov    %eax,%ebx
    
    
    int Events[NUM_EVENTS] = { PAPI_TOT_CYC, PAPI_L1_TCM, PAPI_BR_MSP };
  402041:	c7 84 24 d0 00 00 00 	movl   $0x8000003b,0xd0(%rsp)
  402048:	3b 00 00 80 
  40204c:	c7 84 24 d4 00 00 00 	movl   $0x80000006,0xd4(%rsp)
  402053:	06 00 00 80 
  402057:	c7 84 24 d8 00 00 00 	movl   $0x8000002e,0xd8(%rsp)
  40205e:	2e 00 00 80 
    
    
    /***************/
    /*  BUILDING  */
    /***************/
    string buildOutputFilename = "../../../Output/naiveinteger_build_n" + string(argv[1]) + "_as" + string(argv[2]) + ".output";
  402062:	e8 09 fb ff ff       	callq  401b70 <_ZNSsC1EPKcRKSaIcE@plt>
  402067:	48 8b 75 08          	mov    0x8(%rbp),%rsi
  40206b:	48 8d 94 24 80 00 00 	lea    0x80(%rsp),%rdx
  402072:	00 
  402073:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  402078:	e8 f3 fa ff ff       	callq  401b70 <_ZNSsC1EPKcRKSaIcE@plt>

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(const _CharT* __lhs,
	      basic_string<_CharT, _Traits, _Alloc>&& __rhs)
    { return std::move(__rhs.insert(0, __lhs)); }
  40207d:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  402082:	ba f8 40 40 00       	mov    $0x4040f8,%edx
  402087:	31 f6                	xor    %esi,%esi
  402089:	e8 b2 fa ff ff       	callq  401b40 <_ZNSs6insertEmPKc@plt>
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  40208e:	48 8b 10             	mov    (%rax),%rdx

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(basic_string<_CharT, _Traits, _Alloc>&& __lhs,
	      const _CharT* __rhs)
    { return std::move(__lhs.append(__rhs)); }
  402091:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  402098:	00 
  402099:	be e3 40 40 00       	mov    $0x4040e3,%esi
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  40209e:	48 89 94 24 e0 00 00 	mov    %rdx,0xe0(%rsp)
  4020a5:	00 
      _M_data() const
      { return  _M_dataplus._M_p; }

      _CharT*
      _M_data(_CharT* __p)
      { return (_M_dataplus._M_p = __p); }
  4020a6:	48 c7 00 d8 54 60 00 	movq   $0x6054d8,(%rax)

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(basic_string<_CharT, _Traits, _Alloc>&& __lhs,
	      const _CharT* __rhs)
    { return std::move(__lhs.append(__rhs)); }
  4020ad:	e8 9e fb ff ff       	callq  401c50 <_ZNSs6appendEPKc@plt>
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  4020b2:	48 8b 10             	mov    (%rax),%rdx
  4020b5:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  4020bc:	00 
  4020bd:	4c 89 ef             	mov    %r13,%rdi
  4020c0:	48 89 94 24 00 01 00 	mov    %rdx,0x100(%rsp)
  4020c7:	00 
  4020c8:	48 8d 94 24 90 00 00 	lea    0x90(%rsp),%rdx
  4020cf:	00 
      _M_data() const
      { return  _M_dataplus._M_p; }

      _CharT*
      _M_data(_CharT* __p)
      { return (_M_dataplus._M_p = __p); }
  4020d0:	48 c7 00 d8 54 60 00 	movq   $0x6054d8,(%rax)
  4020d7:	e8 64 1e 00 00       	callq  403f40 <_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EOS6_S7_>

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(basic_string<_CharT, _Traits, _Alloc>&& __lhs,
	      const _CharT* __rhs)
    { return std::move(__lhs.append(__rhs)); }
  4020dc:	be ed 40 40 00       	mov    $0x4040ed,%esi
  4020e1:	4c 89 ef             	mov    %r13,%rdi
  4020e4:	e8 67 fb ff ff       	callq  401c50 <_ZNSs6appendEPKc@plt>
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  4020e9:	48 8b 10             	mov    (%rax),%rdx

      /**
       *  @brief  Destroy the string instance.
       */
      ~basic_string() _GLIBCXX_NOEXCEPT
      { _M_rep()->_M_dispose(this->get_allocator()); }
  4020ec:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  4020f3:	00 
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  4020f4:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
      _M_data() const
      { return  _M_dataplus._M_p; }

      _CharT*
      _M_data(_CharT* __p)
      { return (_M_dataplus._M_p = __p); }
  4020f9:	48 c7 00 d8 54 60 00 	movq   $0x6054d8,(%rax)

      /**
       *  @brief  Destroy the string instance.
       */
      ~basic_string() _GLIBCXX_NOEXCEPT
      { _M_rep()->_M_dispose(this->get_allocator()); }
  402100:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
  402107:	00 
  402108:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  40210c:	e8 2f f9 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  402111:	48 8b 84 24 00 01 00 	mov    0x100(%rsp),%rax
  402118:	00 
  402119:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  402120:	00 
  402121:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  402125:	e8 16 f9 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  40212a:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  402131:	00 
  402132:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  402139:	00 
  40213a:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  40213e:	e8 fd f8 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  402143:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  402148:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  40214f:	00 
  402150:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  402154:	e8 e7 f8 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  402159:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
  402160:	00 
  402161:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  402168:	00 
  402169:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  40216d:	e8 ce f8 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
    ofstream buildOutput(buildOutputFilename, ios::app);
  402172:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  402177:	ba 01 00 00 00       	mov    $0x1,%edx
  40217c:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  402183:	00 
  402184:	e8 27 f9 ff ff       	callq  401ab0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1ERKSsSt13_Ios_Openmode@plt>

    /* Start counting events */
    if (PAPI_start_counters(Events, NUM_EVENTS) != PAPI_OK) handle_error(1);
  402189:	be 03 00 00 00       	mov    $0x3,%esi
  40218e:	4c 89 ff             	mov    %r15,%rdi
  402191:	e8 8a f8 ff ff       	callq  401a20 <PAPI_start_counters@plt>
  402196:	85 c0                	test   %eax,%eax
  402198:	0f 85 8d 05 00 00    	jne    40272b <main+0x96b>
    start_cycles = PAPI_get_real_cyc();
  40219e:	e8 4d fa ff ff       	callq  401bf0 <PAPI_get_real_cyc@plt>
  4021a3:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    start_usec = PAPI_get_real_usec();
  4021a8:	e8 83 f9 ff ff       	callq  401b30 <PAPI_get_real_usec@plt>
    
    Tree tree = Tree(input, amount, alphabetSize, skew);
  4021ad:	44 8b 44 24 08       	mov    0x8(%rsp),%r8d
  4021b2:	4c 89 e6             	mov    %r12,%rsi
    ofstream buildOutput(buildOutputFilename, ios::app);

    /* Start counting events */
    if (PAPI_start_counters(Events, NUM_EVENTS) != PAPI_OK) handle_error(1);
    start_cycles = PAPI_get_real_cyc();
    start_usec = PAPI_get_real_usec();
  4021b5:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    
    Tree tree = Tree(input, amount, alphabetSize, skew);
  4021ba:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
  4021be:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  4021c5:	00 
  4021c6:	8b 54 24 10          	mov    0x10(%rsp),%edx
  4021ca:	e8 81 19 00 00       	callq  403b50 <_ZN4TreeC1EPSt6vectorIiSaIiEEiij>
    
    end_cycles = PAPI_get_real_cyc();
  4021cf:	e8 1c fa ff ff       	callq  401bf0 <PAPI_get_real_cyc@plt>
  4021d4:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    end_usec = PAPI_get_real_usec();
  4021d9:	e8 52 f9 ff ff       	callq  401b30 <PAPI_get_real_usec@plt>
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);
  4021de:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  4021e5:	00 
  4021e6:	be 03 00 00 00       	mov    $0x3,%esi
    start_usec = PAPI_get_real_usec();
    
    Tree tree = Tree(input, amount, alphabetSize, skew);
    
    end_cycles = PAPI_get_real_cyc();
    end_usec = PAPI_get_real_usec();
  4021eb:	49 89 c4             	mov    %rax,%r12
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);
  4021ee:	e8 2d f9 ff ff       	callq  401b20 <PAPI_stop_counters@plt>
  4021f3:	85 c0                	test   %eax,%eax
  4021f5:	0f 85 1e 05 00 00    	jne    402719 <main+0x959>
    buildOutput << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
            << values[0] << "\t" // cycles
            << values[1] << "\t" // lvl1 cache misses
            << values[2] << endl; // branch mispredictions
  4021fb:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
  402202:	00 
      __ostream_type&
      operator<<(unsigned int __n)
      {
	// _GLIBCXX_RESOLVE_LIB_DEFECTS
	// 117. basic_ostream uses nonexistent num_put member functions.
	return _M_insert(static_cast<unsigned long>(__n));
  402203:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  40220a:	00 
    end_usec = PAPI_get_real_usec();
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);
    
    buildOutput << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
  40220b:	4c 2b 64 24 28       	sub    0x28(%rsp),%r12
            << values[0] << "\t" // cycles
            << values[1] << "\t" // lvl1 cache misses
  402210:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
  402217:	00 
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);
    
    buildOutput << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
            << values[0] << "\t" // cycles
  402218:	48 8b 94 24 e0 00 00 	mov    0xe0(%rsp),%rdx
  40221f:	00 
            << values[1] << "\t" // lvl1 cache misses
            << values[2] << endl; // branch mispredictions
  402220:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    end_cycles = PAPI_get_real_cyc();
    end_usec = PAPI_get_real_usec();
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);
    
    buildOutput << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
  402225:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
            << end_usec - start_usec << "\t" //wall time in microseconds
  40222a:	4c 89 64 24 28       	mov    %r12,0x28(%rsp)
  40222f:	44 8b 64 24 08       	mov    0x8(%rsp),%r12d
            << values[0] << "\t" // cycles
            << values[1] << "\t" // lvl1 cache misses
  402234:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);
    
    buildOutput << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
            << values[0] << "\t" // cycles
  402239:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
    end_cycles = PAPI_get_real_cyc();
    end_usec = PAPI_get_real_usec();
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);
    
    buildOutput << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
  40223e:	48 2b 44 24 20       	sub    0x20(%rsp),%rax
  402243:	4c 89 e6             	mov    %r12,%rsi
  402246:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  40224b:	e8 30 fa ff ff       	callq  401c80 <_ZNSo9_M_insertImEERSoT_@plt>
    
    end_cycles = PAPI_get_real_cyc();
    end_usec = PAPI_get_real_usec();
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);
    
    buildOutput << skew << "\t"
  402250:	be f5 40 40 00       	mov    $0x4040f5,%esi
  402255:	48 89 c7             	mov    %rax,%rdi
  402258:	e8 b3 f8 ff ff       	callq  401b10 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
      }

#ifdef _GLIBCXX_USE_LONG_LONG
      __ostream_type&
      operator<<(long long __n)
      { return _M_insert(__n); }
  40225d:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  402262:	48 89 c7             	mov    %rax,%rdi
  402265:	e8 f6 fa ff ff       	callq  401d60 <_ZNSo9_M_insertIxEERSoT_@plt>
            << end_cycles - start_cycles << "\t" //real cycles
  40226a:	be f5 40 40 00       	mov    $0x4040f5,%esi
  40226f:	48 89 c7             	mov    %rax,%rdi
  402272:	e8 99 f8 ff ff       	callq  401b10 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  402277:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  40227c:	48 89 c7             	mov    %rax,%rdi
  40227f:	e8 dc fa ff ff       	callq  401d60 <_ZNSo9_M_insertIxEERSoT_@plt>
            << end_usec - start_usec << "\t" //wall time in microseconds
  402284:	be f5 40 40 00       	mov    $0x4040f5,%esi
  402289:	48 89 c7             	mov    %rax,%rdi
  40228c:	e8 7f f8 ff ff       	callq  401b10 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  402291:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
  402296:	48 89 c7             	mov    %rax,%rdi
  402299:	e8 c2 fa ff ff       	callq  401d60 <_ZNSo9_M_insertIxEERSoT_@plt>
            << values[0] << "\t" // cycles
  40229e:	be f5 40 40 00       	mov    $0x4040f5,%esi
  4022a3:	48 89 c7             	mov    %rax,%rdi
  4022a6:	e8 65 f8 ff ff       	callq  401b10 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  4022ab:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
  4022b0:	48 89 c7             	mov    %rax,%rdi
  4022b3:	e8 a8 fa ff ff       	callq  401d60 <_ZNSo9_M_insertIxEERSoT_@plt>
            << values[1] << "\t" // lvl1 cache misses
  4022b8:	be f5 40 40 00       	mov    $0x4040f5,%esi
  4022bd:	48 89 c7             	mov    %rax,%rdi
  4022c0:	e8 4b f8 ff ff       	callq  401b10 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  4022c5:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  4022ca:	48 89 c7             	mov    %rax,%rdi
  4022cd:	e8 8e fa ff ff       	callq  401d60 <_ZNSo9_M_insertIxEERSoT_@plt>
      operator<<(__ostream_type& (*__pf)(__ostream_type&))
      {
	// _GLIBCXX_RESOLVE_LIB_DEFECTS
	// DR 60. What is a formatted input function?
	// The inserters for manipulators are *not* formatted output functions.
	return __pf(*this);
  4022d2:	48 89 c7             	mov    %rax,%rdi
  4022d5:	e8 e6 f9 ff ff       	callq  401cc0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    
    
    /****************/
    /*  QUERYING   */
    /****************/
    string queryOutputFilename = "../../../Output/naiveinteger_query_n" + string(argv[1]) + "_as" + string(argv[2]) + ".output";
  4022da:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  4022de:	48 8d 54 24 4b       	lea    0x4b(%rsp),%rdx
  4022e3:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  4022ea:	00 
  4022eb:	e8 80 f8 ff ff       	callq  401b70 <_ZNSsC1EPKcRKSaIcE@plt>
  4022f0:	48 8b 75 08          	mov    0x8(%rbp),%rsi
  4022f4:	48 8d 54 24 4a       	lea    0x4a(%rsp),%rdx
  4022f9:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  402300:	00 
  402301:	e8 6a f8 ff ff       	callq  401b70 <_ZNSsC1EPKcRKSaIcE@plt>

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(const _CharT* __lhs,
	      basic_string<_CharT, _Traits, _Alloc>&& __rhs)
    { return std::move(__rhs.insert(0, __lhs)); }
  402306:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  40230d:	00 
  40230e:	ba 20 41 40 00       	mov    $0x404120,%edx
  402313:	31 f6                	xor    %esi,%esi
  402315:	e8 26 f8 ff ff       	callq  401b40 <_ZNSs6insertEmPKc@plt>
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  40231a:	48 8b 10             	mov    (%rax),%rdx

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(basic_string<_CharT, _Traits, _Alloc>&& __lhs,
	      const _CharT* __rhs)
    { return std::move(__lhs.append(__rhs)); }
  40231d:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  402324:	00 
  402325:	be e3 40 40 00       	mov    $0x4040e3,%esi
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  40232a:	48 89 94 24 90 00 00 	mov    %rdx,0x90(%rsp)
  402331:	00 
      _M_data() const
      { return  _M_dataplus._M_p; }

      _CharT*
      _M_data(_CharT* __p)
      { return (_M_dataplus._M_p = __p); }
  402332:	48 c7 00 d8 54 60 00 	movq   $0x6054d8,(%rax)

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(basic_string<_CharT, _Traits, _Alloc>&& __lhs,
	      const _CharT* __rhs)
    { return std::move(__lhs.append(__rhs)); }
  402339:	e8 12 f9 ff ff       	callq  401c50 <_ZNSs6appendEPKc@plt>
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  40233e:	48 8b 10             	mov    (%rax),%rdx
  402341:	48 8d bc 24 c0 00 00 	lea    0xc0(%rsp),%rdi
  402348:	00 
  402349:	4c 89 ee             	mov    %r13,%rsi
  40234c:	48 89 94 24 a0 00 00 	mov    %rdx,0xa0(%rsp)
  402353:	00 
  402354:	48 8d 94 24 b0 00 00 	lea    0xb0(%rsp),%rdx
  40235b:	00 
      _M_data() const
      { return  _M_dataplus._M_p; }

      _CharT*
      _M_data(_CharT* __p)
      { return (_M_dataplus._M_p = __p); }
  40235c:	48 c7 00 d8 54 60 00 	movq   $0x6054d8,(%rax)
  402363:	e8 d8 1b 00 00       	callq  403f40 <_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EOS6_S7_>

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(basic_string<_CharT, _Traits, _Alloc>&& __lhs,
	      const _CharT* __rhs)
    { return std::move(__lhs.append(__rhs)); }
  402368:	48 8d bc 24 c0 00 00 	lea    0xc0(%rsp),%rdi
  40236f:	00 
  402370:	be ed 40 40 00       	mov    $0x4040ed,%esi
  402375:	e8 d6 f8 ff ff       	callq  401c50 <_ZNSs6appendEPKc@plt>
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  40237a:	48 8b 10             	mov    (%rax),%rdx

      /**
       *  @brief  Destroy the string instance.
       */
      ~basic_string() _GLIBCXX_NOEXCEPT
      { _M_rep()->_M_dispose(this->get_allocator()); }
  40237d:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  402382:	48 89 54 24 70       	mov    %rdx,0x70(%rsp)
      _M_data() const
      { return  _M_dataplus._M_p; }

      _CharT*
      _M_data(_CharT* __p)
      { return (_M_dataplus._M_p = __p); }
  402387:	48 c7 00 d8 54 60 00 	movq   $0x6054d8,(%rax)

      /**
       *  @brief  Destroy the string instance.
       */
      ~basic_string() _GLIBCXX_NOEXCEPT
      { _M_rep()->_M_dispose(this->get_allocator()); }
  40238e:	48 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%rax
  402395:	00 
  402396:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  40239a:	e8 a1 f6 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  40239f:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
  4023a6:	00 
  4023a7:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  4023ae:	00 
  4023af:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  4023b3:	e8 88 f6 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  4023b8:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
  4023bf:	00 
  4023c0:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  4023c7:	00 
  4023c8:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  4023cc:	e8 6f f6 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  4023d1:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
  4023d8:	00 
  4023d9:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  4023e0:	00 
  4023e1:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  4023e5:	e8 56 f6 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  4023ea:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
  4023f1:	00 
  4023f2:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  4023f9:	00 
  4023fa:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  4023fe:	e8 3d f6 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
    ofstream queryOutput(queryOutputFilename, ios::app);
  402403:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
  402408:	ba 01 00 00 00       	mov    $0x1,%edx
  40240d:	48 8d bc 24 60 03 00 	lea    0x360(%rsp),%rdi
  402414:	00 
  402415:	e8 96 f6 ff ff       	callq  401ab0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1ERKSsSt13_Ios_Openmode@plt>
    
    /* Start counting events */
    if (PAPI_start_counters(Events, NUM_EVENTS) != PAPI_OK) handle_error(1);
  40241a:	be 03 00 00 00       	mov    $0x3,%esi
  40241f:	4c 89 ff             	mov    %r15,%rdi
  402422:	e8 f9 f5 ff ff       	callq  401a20 <PAPI_start_counters@plt>
  402427:	85 c0                	test   %eax,%eax
  402429:	0f 85 54 02 00 00    	jne    402683 <main+0x8c3>
    start_cycles = PAPI_get_real_cyc();
  40242f:	e8 bc f7 ff ff       	callq  401bf0 <PAPI_get_real_cyc@plt>
  402434:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    start_usec = PAPI_get_real_usec();
  402439:	e8 f2 f6 ff ff       	callq  401b30 <PAPI_get_real_usec@plt>
  40243e:	49 89 c7             	mov    %rax,%r15
  402441:	31 ed                	xor    %ebp,%ebp
  402443:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

    uint maxChar = 100;
    for(uint character = 0; character < maxChar; character++) {
//        ulong rank = tree.rank(character, amount, skew);
//        cout << "rank: " << rank << endl;
        unsigned long pos = tree.select(character, 2000, skew);
  402448:	89 d9                	mov    %ebx,%ecx
  40244a:	ba d0 07 00 00       	mov    $0x7d0,%edx
  40244f:	89 ee                	mov    %ebp,%esi
  402451:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  402458:	00 
  402459:	e8 52 17 00 00       	callq  403bb0 <_ZN4Tree6selectEimj>
    if (PAPI_start_counters(Events, NUM_EVENTS) != PAPI_OK) handle_error(1);
    start_cycles = PAPI_get_real_cyc();
    start_usec = PAPI_get_real_usec();

    uint maxChar = 100;
    for(uint character = 0; character < maxChar; character++) {
  40245e:	83 c5 01             	add    $0x1,%ebp
  402461:	83 fd 64             	cmp    $0x64,%ebp
  402464:	75 e2                	jne    402448 <main+0x688>
//        cout << "rank: " << rank << endl;
        unsigned long pos = tree.select(character, 2000, skew);
//        cout << "select: " << pos << endl;
    }

    end_cycles = PAPI_get_real_cyc();
  402466:	e8 85 f7 ff ff       	callq  401bf0 <PAPI_get_real_cyc@plt>
  40246b:	48 89 c3             	mov    %rax,%rbx
    end_usec = PAPI_get_real_usec();
  40246e:	e8 bd f6 ff ff       	callq  401b30 <PAPI_get_real_usec@plt>

    /* Stop counting events */
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);
  402473:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  40247a:	00 
  40247b:	be 03 00 00 00       	mov    $0x3,%esi
        unsigned long pos = tree.select(character, 2000, skew);
//        cout << "select: " << pos << endl;
    }

    end_cycles = PAPI_get_real_cyc();
    end_usec = PAPI_get_real_usec();
  402480:	48 89 c5             	mov    %rax,%rbp

    /* Stop counting events */
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);
  402483:	e8 98 f6 ff ff       	callq  401b20 <PAPI_stop_counters@plt>
  402488:	85 c0                	test   %eax,%eax
  40248a:	0f 85 e9 01 00 00    	jne    402679 <main+0x8b9>
    queryOutput  << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
            << values[0] << "\t" // cycles
            << values[1] << "\t" // lvl1 cache misses
            << values[2] << endl; // branch mispredictions
  402490:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
  402497:	00 
      __ostream_type&
      operator<<(unsigned int __n)
      {
	// _GLIBCXX_RESOLVE_LIB_DEFECTS
	// 117. basic_ostream uses nonexistent num_put member functions.
	return _M_insert(static_cast<unsigned long>(__n));
  402498:	4c 89 e6             	mov    %r12,%rsi
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);

//    output << "# [SKEW] [lvl1 cache misses] [branch mispredictions]" << endl;
    queryOutput  << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
  40249b:	4c 29 fd             	sub    %r15,%rbp
            << values[0] << "\t" // cycles
            << values[1] << "\t" // lvl1 cache misses
  40249e:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
  4024a5:	00 
  4024a6:	48 8d bc 24 60 03 00 	lea    0x360(%rsp),%rdi
  4024ad:	00 

//    output << "# [SKEW] [lvl1 cache misses] [branch mispredictions]" << endl;
    queryOutput  << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
            << values[0] << "\t" // cycles
  4024ae:	48 8b 94 24 e0 00 00 	mov    0xe0(%rsp),%rdx
  4024b5:	00 
    /* Stop counting events */
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);

//    output << "# [SKEW] [lvl1 cache misses] [branch mispredictions]" << endl;
    queryOutput  << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
  4024b6:	48 2b 5c 24 08       	sub    0x8(%rsp),%rbx
            << end_usec - start_usec << "\t" //wall time in microseconds
            << values[0] << "\t" // cycles
            << values[1] << "\t" // lvl1 cache misses
            << values[2] << endl; // branch mispredictions
  4024bb:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
//    output << "# [SKEW] [lvl1 cache misses] [branch mispredictions]" << endl;
    queryOutput  << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
            << values[0] << "\t" // cycles
            << values[1] << "\t" // lvl1 cache misses
  4024c0:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)

//    output << "# [SKEW] [lvl1 cache misses] [branch mispredictions]" << endl;
    queryOutput  << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
            << values[0] << "\t" // cycles
  4024c5:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
  4024ca:	e8 b1 f7 ff ff       	callq  401c80 <_ZNSo9_M_insertImEERSoT_@plt>

    /* Stop counting events */
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);

//    output << "# [SKEW] [lvl1 cache misses] [branch mispredictions]" << endl;
    queryOutput  << skew << "\t"
  4024cf:	be f5 40 40 00       	mov    $0x4040f5,%esi
  4024d4:	48 89 c7             	mov    %rax,%rdi
  4024d7:	e8 34 f6 ff ff       	callq  401b10 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
      }

#ifdef _GLIBCXX_USE_LONG_LONG
      __ostream_type&
      operator<<(long long __n)
      { return _M_insert(__n); }
  4024dc:	48 89 de             	mov    %rbx,%rsi
  4024df:	48 89 c7             	mov    %rax,%rdi
  4024e2:	e8 79 f8 ff ff       	callq  401d60 <_ZNSo9_M_insertIxEERSoT_@plt>
            << end_cycles - start_cycles << "\t" //real cycles
  4024e7:	be f5 40 40 00       	mov    $0x4040f5,%esi
  4024ec:	48 89 c7             	mov    %rax,%rdi
  4024ef:	e8 1c f6 ff ff       	callq  401b10 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  4024f4:	48 89 ee             	mov    %rbp,%rsi
  4024f7:	48 89 c7             	mov    %rax,%rdi
  4024fa:	e8 61 f8 ff ff       	callq  401d60 <_ZNSo9_M_insertIxEERSoT_@plt>
            << end_usec - start_usec << "\t" //wall time in microseconds
  4024ff:	be f5 40 40 00       	mov    $0x4040f5,%esi
  402504:	48 89 c7             	mov    %rax,%rdi
  402507:	e8 04 f6 ff ff       	callq  401b10 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  40250c:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  402511:	48 89 c7             	mov    %rax,%rdi
  402514:	e8 47 f8 ff ff       	callq  401d60 <_ZNSo9_M_insertIxEERSoT_@plt>
            << values[0] << "\t" // cycles
  402519:	be f5 40 40 00       	mov    $0x4040f5,%esi
  40251e:	48 89 c7             	mov    %rax,%rdi
  402521:	e8 ea f5 ff ff       	callq  401b10 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  402526:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  40252b:	48 89 c7             	mov    %rax,%rdi
  40252e:	e8 2d f8 ff ff       	callq  401d60 <_ZNSo9_M_insertIxEERSoT_@plt>
            << values[1] << "\t" // lvl1 cache misses
  402533:	be f5 40 40 00       	mov    $0x4040f5,%esi
  402538:	48 89 c7             	mov    %rax,%rdi
  40253b:	e8 d0 f5 ff ff       	callq  401b10 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  402540:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  402545:	48 89 c7             	mov    %rax,%rdi
  402548:	e8 13 f8 ff ff       	callq  401d60 <_ZNSo9_M_insertIxEERSoT_@plt>
      operator<<(__ostream_type& (*__pf)(__ostream_type&))
      {
	// _GLIBCXX_RESOLVE_LIB_DEFECTS
	// DR 60. What is a formatted input function?
	// The inserters for manipulators are *not* formatted output functions.
	return __pf(*this);
  40254d:	48 89 c7             	mov    %rax,%rdi
  402550:	e8 6b f7 ff ff       	callq  401cc0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    
    /****************/
    /*  QUERYING   */
    /****************/
    string queryOutputFilename = "../../../Output/naiveinteger_query_n" + string(argv[1]) + "_as" + string(argv[2]) + ".output";
    ofstream queryOutput(queryOutputFilename, ios::app);
  402555:	48 8d bc 24 60 03 00 	lea    0x360(%rsp),%rdi
  40255c:	00 
  40255d:	e8 4e f6 ff ff       	callq  401bb0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>
  402562:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  402567:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  40256e:	00 
  40256f:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  402573:	e8 c8 f4 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
	__x._M_impl._M_finish = _Bit_iterator();
	__x._M_impl._M_end_of_storage = 0;
      }
#endif

      ~_Bvector_base()
  402578:	48 8b bc 24 00 01 00 	mov    0x100(%rsp),%rdi
  40257f:	00 
      { return _M_impl.allocate(_S_nword(__n)); }

      void
      _M_deallocate()
      {
	if (_M_impl._M_start._M_p)
  402580:	48 85 ff             	test   %rdi,%rdi
  402583:	74 05                	je     40258a <main+0x7ca>
      }

      // __p is not permitted to be a null pointer.
      void
      deallocate(pointer __p, size_type)
      { ::operator delete(__p); }
  402585:	e8 a6 f4 ff ff       	callq  401a30 <_ZdlPv@plt>
    
    /***************/
    /*  BUILDING  */
    /***************/
    string buildOutputFilename = "../../../Output/naiveinteger_build_n" + string(argv[1]) + "_as" + string(argv[2]) + ".output";
    ofstream buildOutput(buildOutputFilename, ios::app);
  40258a:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  402591:	00 
  402592:	e8 19 f6 ff ff       	callq  401bb0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>
  402597:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
  40259c:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  4025a3:	00 
  4025a4:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  4025a8:	e8 93 f4 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  4025ad:	49 8d 7e e8          	lea    -0x18(%r14),%rdi
  4025b1:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  4025b8:	00 
  4025b9:	e8 82 f4 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
            << values[0] << "\t" // cycles
            << values[1] << "\t" // lvl1 cache misses
            << values[2] << endl; // branch mispredictions
    
    return 0;
}
  4025be:	31 c0                	xor    %eax,%eax
  4025c0:	48 8b 8c 24 68 05 00 	mov    0x568(%rsp),%rcx
  4025c7:	00 
  4025c8:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  4025cf:	00 00 
  4025d1:	0f 85 92 01 00 00    	jne    402769 <main+0x9a9>
  4025d7:	48 81 c4 78 05 00 00 	add    $0x578,%rsp
  4025de:	5b                   	pop    %rbx
  4025df:	5d                   	pop    %rbp
  4025e0:	41 5c                	pop    %r12
  4025e2:	41 5d                	pop    %r13
  4025e4:	41 5e                	pop    %r14
  4025e6:	41 5f                	pop    %r15
  4025e8:	c3                   	retq   
	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
  4025e9:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  4025ee:	48 89 c7             	mov    %rax,%rdi
  4025f1:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
  4025f6:	e8 d5 f5 ff ff       	callq  401bd0 <memmove@plt>
  4025fb:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  402600:	e9 a8 f9 ff ff       	jmpq   401fad <main+0x1ed>
      // NB: __n is permitted to be 0.  The C++ standard says nothing
      // about what the return value is when __n == 0.
      pointer
      allocate(size_type __n, const void* = 0)
      { 
	if (__n > this->max_size())
  402605:	48 b8 ff ff ff ff ff 	movabs $0x3fffffffffffffff,%rax
  40260c:	ff ff 3f 
  40260f:	48 39 c3             	cmp    %rax,%rbx
  402612:	77 2e                	ja     402642 <main+0x882>
	  std::__throw_bad_alloc();

	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
  402614:	48 8d 3c 9d 00 00 00 	lea    0x0(,%rbx,4),%rdi
  40261b:	00 
  40261c:	e8 cf f6 ff ff       	callq  401cf0 <_Znwm@plt>
  402621:	e9 69 f9 ff ff       	jmpq   401f8f <main+0x1cf>

/*
 * 
 */
int main(int argc, char** argv) {
    if(argc < 4) { cout << "NOT ENOUGH ARGUMENTS" << endl; return 0; }
  402626:	be be 40 40 00       	mov    $0x4040be,%esi
  40262b:	bf 00 53 60 00       	mov    $0x605300,%edi
  402630:	e8 db f4 ff ff       	callq  401b10 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  402635:	48 89 c7             	mov    %rax,%rdi
  402638:	e8 83 f6 ff ff       	callq  401cc0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
  40263d:	e9 7c ff ff ff       	jmpq   4025be <main+0x7fe>
      // about what the return value is when __n == 0.
      pointer
      allocate(size_type __n, const void* = 0)
      { 
	if (__n > this->max_size())
	  std::__throw_bad_alloc();
  402642:	e8 59 f6 ff ff       	callq  401ca0 <_ZSt17__throw_bad_allocv@plt>
      }
#endif

      ~_Vector_base()
      { _M_deallocate(this->_M_impl._M_start, this->_M_impl._M_end_of_storage
		      - this->_M_impl._M_start); }
  402647:	49 8b 3c 24          	mov    (%r12),%rdi
  40264b:	48 89 c3             	mov    %rax,%rbx
      { return __n != 0 ? _M_impl.allocate(__n) : 0; }

      void
      _M_deallocate(pointer __p, size_t __n)
      {
	if (__p)
  40264e:	48 85 ff             	test   %rdi,%rdi
  402651:	74 3a                	je     40268d <main+0x8cd>
      }

      // __p is not permitted to be a null pointer.
      void
      deallocate(pointer __p, size_type)
      { ::operator delete(__p); }
  402653:	c5 f8 77             	vzeroupper 
  402656:	e8 d5 f3 ff ff       	callq  401a30 <_ZdlPv@plt>
    string filename = "../../../Data/n" + string(argv[1]) + "_as" + string(argv[2]) + ".data";
    cout << filename << endl;
    int size_out = 0;
    int* inputArr = read_file(size_out, filename.c_str());
    
    vector<int>* input = new vector<int>(inputArr, inputArr + size_out);
  40265b:	4c 89 e7             	mov    %r12,%rdi
  40265e:	e8 cd f3 ff ff       	callq  401a30 <_ZdlPv@plt>
  402663:	49 8d 7e e8          	lea    -0x18(%r14),%rdi
  402667:	48 8d 74 24 4b       	lea    0x4b(%rsp),%rsi
  40266c:	e8 cf f3 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  402671:	48 89 df             	mov    %rbx,%rdi
  402674:	e8 87 f6 ff ff       	callq  401d00 <_Unwind_Resume@plt>

    end_cycles = PAPI_get_real_cyc();
    end_usec = PAPI_get_real_usec();

    /* Stop counting events */
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);
  402679:	bf 01 00 00 00       	mov    $0x1,%edi
  40267e:	e8 8d 18 00 00       	callq  403f10 <_Z12handle_errori>
    /****************/
    string queryOutputFilename = "../../../Output/naiveinteger_query_n" + string(argv[1]) + "_as" + string(argv[2]) + ".output";
    ofstream queryOutput(queryOutputFilename, ios::app);
    
    /* Start counting events */
    if (PAPI_start_counters(Events, NUM_EVENTS) != PAPI_OK) handle_error(1);
  402683:	bf 01 00 00 00       	mov    $0x1,%edi
  402688:	e8 83 18 00 00       	callq  403f10 <_Z12handle_errori>
  40268d:	c5 f8 77             	vzeroupper 
  402690:	eb c9                	jmp    40265b <main+0x89b>
  402692:	48 89 c3             	mov    %rax,%rbx
  402695:	c5 f8 77             	vzeroupper 
  402698:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
  40269f:	00 
  4026a0:	4c 89 ee             	mov    %r13,%rsi
  4026a3:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  4026a7:	e8 94 f3 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  4026ac:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
  4026b3:	00 
  4026b4:	4c 89 ee             	mov    %r13,%rsi
  4026b7:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  4026bb:	e8 80 f3 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  4026c0:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
  4026c7:	00 
  4026c8:	4c 89 ee             	mov    %r13,%rsi
  4026cb:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  4026cf:	e8 6c f3 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
	__x._M_impl._M_finish = _Bit_iterator();
	__x._M_impl._M_end_of_storage = 0;
      }
#endif

      ~_Bvector_base()
  4026d4:	48 8b bc 24 00 01 00 	mov    0x100(%rsp),%rdi
  4026db:	00 
      { return _M_impl.allocate(_S_nword(__n)); }

      void
      _M_deallocate()
      {
	if (_M_impl._M_start._M_p)
  4026dc:	48 85 ff             	test   %rdi,%rdi
  4026df:	74 05                	je     4026e6 <main+0x926>
  4026e1:	e8 4a f3 ff ff       	callq  401a30 <_ZdlPv@plt>
    
    /***************/
    /*  BUILDING  */
    /***************/
    string buildOutputFilename = "../../../Output/naiveinteger_build_n" + string(argv[1]) + "_as" + string(argv[2]) + ".output";
    ofstream buildOutput(buildOutputFilename, ios::app);
  4026e6:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  4026ed:	00 
  4026ee:	e8 bd f4 ff ff       	callq  401bb0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>
  4026f3:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
  4026f8:	4c 89 ee             	mov    %r13,%rsi
  4026fb:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  4026ff:	e8 3c f3 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  402704:	e9 5a ff ff ff       	jmpq   402663 <main+0x8a3>
  402709:	48 89 c3             	mov    %rax,%rbx
  40270c:	c5 f8 77             	vzeroupper 
  40270f:	eb 9b                	jmp    4026ac <main+0x8ec>
  402711:	48 89 c3             	mov    %rax,%rbx
  402714:	c5 f8 77             	vzeroupper 
  402717:	eb a7                	jmp    4026c0 <main+0x900>
    
    Tree tree = Tree(input, amount, alphabetSize, skew);
    
    end_cycles = PAPI_get_real_cyc();
    end_usec = PAPI_get_real_usec();
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);
  402719:	bf 01 00 00 00       	mov    $0x1,%edi
  40271e:	e8 ed 17 00 00       	callq  403f10 <_Z12handle_errori>
  402723:	48 89 c3             	mov    %rax,%rbx
  402726:	c5 f8 77             	vzeroupper 
  402729:	eb a9                	jmp    4026d4 <main+0x914>
    /***************/
    string buildOutputFilename = "../../../Output/naiveinteger_build_n" + string(argv[1]) + "_as" + string(argv[2]) + ".output";
    ofstream buildOutput(buildOutputFilename, ios::app);

    /* Start counting events */
    if (PAPI_start_counters(Events, NUM_EVENTS) != PAPI_OK) handle_error(1);
  40272b:	bf 01 00 00 00       	mov    $0x1,%edi
  402730:	e8 db 17 00 00       	callq  403f10 <_Z12handle_errori>
  402735:	48 89 c3             	mov    %rax,%rbx
  402738:	c5 f8 77             	vzeroupper 
  40273b:	eb a9                	jmp    4026e6 <main+0x926>
  40273d:	48 89 c3             	mov    %rax,%rbx
  402740:	c5 f8 77             	vzeroupper 
  402743:	eb ae                	jmp    4026f3 <main+0x933>
  402745:	48 89 c3             	mov    %rax,%rbx
  402748:	c5 f8 77             	vzeroupper 
  40274b:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
  402752:	00 
  402753:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  40275a:	00 
  40275b:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  40275f:	e8 dc f2 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  402764:	e9 fa fe ff ff       	jmpq   402663 <main+0x8a3>
            << values[0] << "\t" // cycles
            << values[1] << "\t" // lvl1 cache misses
            << values[2] << endl; // branch mispredictions
    
    return 0;
}
  402769:	e8 a2 f4 ff ff       	callq  401c10 <__stack_chk_fail@plt>
  40276e:	4c 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%r15
  402775:	00 
  402776:	48 89 c3             	mov    %rax,%rbx
  402779:	c5 f8 77             	vzeroupper 
  40277c:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
  402783:	00 
  402784:	4c 89 fe             	mov    %r15,%rsi
  402787:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  40278b:	e8 b0 f2 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  402790:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  402797:	00 
  402798:	4c 89 fe             	mov    %r15,%rsi
  40279b:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  40279f:	e8 9c f2 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  4027a4:	48 89 df             	mov    %rbx,%rdi
  4027a7:	e8 54 f5 ff ff       	callq  401d00 <_Unwind_Resume@plt>
  4027ac:	4c 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%r15
  4027b3:	00 
  4027b4:	48 89 c3             	mov    %rax,%rbx
  4027b7:	c5 f8 77             	vzeroupper 
  4027ba:	eb d4                	jmp    402790 <main+0x9d0>
  4027bc:	48 89 c3             	mov    %rax,%rbx
  4027bf:	c5 f8 77             	vzeroupper 
  4027c2:	e9 9c fe ff ff       	jmpq   402663 <main+0x8a3>
  4027c7:	4c 8d ac 24 a0 00 00 	lea    0xa0(%rsp),%r13
  4027ce:	00 
  4027cf:	48 89 c3             	mov    %rax,%rbx
  4027d2:	48 8b 84 24 00 01 00 	mov    0x100(%rsp),%rax
  4027d9:	00 
  4027da:	4c 89 ee             	mov    %r13,%rsi
  4027dd:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  4027e1:	c5 f8 77             	vzeroupper 
  4027e4:	e8 57 f2 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  4027e9:	48 8b 84 24 d0 00 00 	mov    0xd0(%rsp),%rax
  4027f0:	00 
  4027f1:	4c 89 ee             	mov    %r13,%rsi
  4027f4:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  4027f8:	e8 43 f2 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  4027fd:	48 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%rax
  402804:	00 
  402805:	4c 89 fe             	mov    %r15,%rsi
  402808:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  40280c:	e8 2f f2 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  402811:	e9 66 ff ff ff       	jmpq   40277c <main+0x9bc>
  402816:	4c 8d ac 24 a0 00 00 	lea    0xa0(%rsp),%r13
  40281d:	00 
  40281e:	48 89 c3             	mov    %rax,%rbx
  402821:	c5 f8 77             	vzeroupper 
  402824:	eb c3                	jmp    4027e9 <main+0xa29>
  402826:	4c 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%r15
  40282d:	00 
  40282e:	48 89 c3             	mov    %rax,%rbx
  402831:	c5 f8 77             	vzeroupper 
  402834:	eb c7                	jmp    4027fd <main+0xa3d>
    
    /****************/
    /*  QUERYING   */
    /****************/
    string queryOutputFilename = "../../../Output/naiveinteger_query_n" + string(argv[1]) + "_as" + string(argv[2]) + ".output";
    ofstream queryOutput(queryOutputFilename, ios::app);
  402836:	48 8d bc 24 60 03 00 	lea    0x360(%rsp),%rdi
  40283d:	00 
  40283e:	48 89 c3             	mov    %rax,%rbx
  402841:	c5 f8 77             	vzeroupper 
  402844:	e8 67 f3 ff ff       	callq  401bb0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>
  402849:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  40284e:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  402855:	00 
  402856:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  40285a:	e8 e1 f1 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  40285f:	e9 70 fe ff ff       	jmpq   4026d4 <main+0x914>
  402864:	48 89 c3             	mov    %rax,%rbx
  402867:	c5 f8 77             	vzeroupper 
  40286a:	eb dd                	jmp    402849 <main+0xa89>
  40286c:	48 8d 5c 24 70       	lea    0x70(%rsp),%rbx
  402871:	48 89 c5             	mov    %rax,%rbp
  402874:	48 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%rax
  40287b:	00 
  40287c:	48 89 de             	mov    %rbx,%rsi
  40287f:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  402883:	c5 f8 77             	vzeroupper 
  402886:	e8 b5 f1 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  40288b:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
  402892:	00 
  402893:	48 89 de             	mov    %rbx,%rsi
  402896:	48 89 eb             	mov    %rbp,%rbx
  402899:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  40289d:	e8 9e f1 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  4028a2:	e9 f1 fd ff ff       	jmpq   402698 <main+0x8d8>
  4028a7:	48 8d 5c 24 70       	lea    0x70(%rsp),%rbx
  4028ac:	48 89 c5             	mov    %rax,%rbp
  4028af:	c5 f8 77             	vzeroupper 
  4028b2:	eb d7                	jmp    40288b <main+0xacb>
  4028b4:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  4028bb:	00 
  4028bc:	48 89 c3             	mov    %rax,%rbx
  4028bf:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
  4028c6:	00 
  4028c7:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  4028cb:	c5 f8 77             	vzeroupper 
  4028ce:	e8 6d f1 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  4028d3:	48 8b 84 24 00 01 00 	mov    0x100(%rsp),%rax
  4028da:	00 
  4028db:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  4028e2:	00 
  4028e3:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  4028e7:	e8 54 f1 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  4028ec:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  4028f3:	00 
  4028f4:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  4028fb:	00 
  4028fc:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  402900:	e8 3b f1 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  402905:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  40290a:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  402911:	00 
  402912:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
  402916:	e8 25 f1 ff ff       	callq  401a40 <_ZNSs4_Rep10_M_disposeERKSaIcE@plt>
  40291b:	e9 2b fe ff ff       	jmpq   40274b <main+0x98b>
  402920:	48 89 c3             	mov    %rax,%rbx
  402923:	c5 f8 77             	vzeroupper 
  402926:	eb ab                	jmp    4028d3 <main+0xb13>
  402928:	48 89 c3             	mov    %rax,%rbx
  40292b:	c5 f8 77             	vzeroupper 
  40292e:	eb bc                	jmp    4028ec <main+0xb2c>
  402930:	48 89 c3             	mov    %rax,%rbx
  402933:	c5 f8 77             	vzeroupper 
  402936:	eb cd                	jmp    402905 <main+0xb45>
  402938:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40293f:	00 

0000000000402940 <_GLOBAL__sub_I_main>:
            << values[0] << "\t" // cycles
            << values[1] << "\t" // lvl1 cache misses
            << values[2] << endl; // branch mispredictions
    
    return 0;
}
  402940:	48 83 ec 08          	sub    $0x8,%rsp
  402944:	bf e2 54 60 00       	mov    $0x6054e2,%edi
  402949:	e8 42 f1 ff ff       	callq  401a90 <_ZNSt8ios_base4InitC1Ev@plt>
  40294e:	ba f0 51 60 00       	mov    $0x6051f0,%edx
  402953:	be e2 54 60 00       	mov    $0x6054e2,%esi
  402958:	bf 00 1b 40 00       	mov    $0x401b00,%edi
  40295d:	48 83 c4 08          	add    $0x8,%rsp
  402961:	e9 6a f1 ff ff       	jmpq   401ad0 <__cxa_atexit@plt>

0000000000402966 <_start>:
  402966:	31 ed                	xor    %ebp,%ebp
  402968:	49 89 d1             	mov    %rdx,%r9
  40296b:	5e                   	pop    %rsi
  40296c:	48 89 e2             	mov    %rsp,%rdx
  40296f:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  402973:	50                   	push   %rax
  402974:	54                   	push   %rsp
  402975:	49 c7 c0 20 40 40 00 	mov    $0x404020,%r8
  40297c:	48 c7 c1 b0 3f 40 00 	mov    $0x403fb0,%rcx
  402983:	48 c7 c7 c0 1d 40 00 	mov    $0x401dc0,%rdi
  40298a:	e8 11 f1 ff ff       	callq  401aa0 <__libc_start_main@plt>
  40298f:	f4                   	hlt    

0000000000402990 <deregister_tm_clones>:
  402990:	b8 ff 51 60 00       	mov    $0x6051ff,%eax
  402995:	55                   	push   %rbp
  402996:	48 2d f8 51 60 00    	sub    $0x6051f8,%rax
  40299c:	48 83 f8 0e          	cmp    $0xe,%rax
  4029a0:	48 89 e5             	mov    %rsp,%rbp
  4029a3:	77 02                	ja     4029a7 <deregister_tm_clones+0x17>
  4029a5:	5d                   	pop    %rbp
  4029a6:	c3                   	retq   
  4029a7:	b8 00 00 00 00       	mov    $0x0,%eax
  4029ac:	48 85 c0             	test   %rax,%rax
  4029af:	74 f4                	je     4029a5 <deregister_tm_clones+0x15>
  4029b1:	5d                   	pop    %rbp
  4029b2:	bf f8 51 60 00       	mov    $0x6051f8,%edi
  4029b7:	ff e0                	jmpq   *%rax
  4029b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004029c0 <register_tm_clones>:
  4029c0:	b8 f8 51 60 00       	mov    $0x6051f8,%eax
  4029c5:	55                   	push   %rbp
  4029c6:	48 2d f8 51 60 00    	sub    $0x6051f8,%rax
  4029cc:	48 c1 f8 03          	sar    $0x3,%rax
  4029d0:	48 89 e5             	mov    %rsp,%rbp
  4029d3:	48 89 c2             	mov    %rax,%rdx
  4029d6:	48 c1 ea 3f          	shr    $0x3f,%rdx
  4029da:	48 01 d0             	add    %rdx,%rax
  4029dd:	48 d1 f8             	sar    %rax
  4029e0:	75 02                	jne    4029e4 <register_tm_clones+0x24>
  4029e2:	5d                   	pop    %rbp
  4029e3:	c3                   	retq   
  4029e4:	ba 00 00 00 00       	mov    $0x0,%edx
  4029e9:	48 85 d2             	test   %rdx,%rdx
  4029ec:	74 f4                	je     4029e2 <register_tm_clones+0x22>
  4029ee:	5d                   	pop    %rbp
  4029ef:	48 89 c6             	mov    %rax,%rsi
  4029f2:	bf f8 51 60 00       	mov    $0x6051f8,%edi
  4029f7:	ff e2                	jmpq   *%rdx
  4029f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402a00 <__do_global_dtors_aux>:
  402a00:	80 3d d9 2a 20 00 00 	cmpb   $0x0,0x202ad9(%rip)        # 6054e0 <completed.6972>
  402a07:	75 11                	jne    402a1a <__do_global_dtors_aux+0x1a>
  402a09:	55                   	push   %rbp
  402a0a:	48 89 e5             	mov    %rsp,%rbp
  402a0d:	e8 7e ff ff ff       	callq  402990 <deregister_tm_clones>
  402a12:	5d                   	pop    %rbp
  402a13:	c6 05 c6 2a 20 00 01 	movb   $0x1,0x202ac6(%rip)        # 6054e0 <completed.6972>
  402a1a:	f3 c3                	repz retq 
  402a1c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402a20 <frame_dummy>:
  402a20:	48 83 3d b8 23 20 00 	cmpq   $0x0,0x2023b8(%rip)        # 604de0 <__JCR_END__>
  402a27:	00 
  402a28:	74 1e                	je     402a48 <frame_dummy+0x28>
  402a2a:	b8 00 00 00 00       	mov    $0x0,%eax
  402a2f:	48 85 c0             	test   %rax,%rax
  402a32:	74 14                	je     402a48 <frame_dummy+0x28>
  402a34:	55                   	push   %rbp
  402a35:	bf e0 4d 60 00       	mov    $0x604de0,%edi
  402a3a:	48 89 e5             	mov    %rsp,%rbp
  402a3d:	ff d0                	callq  *%rax
  402a3f:	5d                   	pop    %rbp
  402a40:	e9 7b ff ff ff       	jmpq   4029c0 <register_tm_clones>
  402a45:	0f 1f 00             	nopl   (%rax)
  402a48:	e9 73 ff ff ff       	jmpq   4029c0 <register_tm_clones>
  402a4d:	0f 1f 00             	nopl   (%rax)

0000000000402a50 <_ZN6BitmapC1Em>:

#include "Bitmap.h"

Bitmap::Bitmap(size_t size) : vec(size) {};
  402a50:	41 54                	push   %r12
    public:
      _Vector_impl _M_impl;

      pointer
      _M_allocate(size_t __n)
      { return __n != 0 ? _M_impl.allocate(__n) : 0; }
  402a52:	48 85 f6             	test   %rsi,%rsi
  402a55:	55                   	push   %rbp
  402a56:	48 89 fd             	mov    %rdi,%rbp
  402a59:	53                   	push   %rbx
  402a5a:	48 89 f3             	mov    %rsi,%rbx
	_Vector_impl()
	: _Tp_alloc_type(), _M_start(0), _M_finish(0), _M_end_of_storage(0)
	{ }

	_Vector_impl(_Tp_alloc_type const& __a)
	: _Tp_alloc_type(__a), _M_start(0), _M_finish(0), _M_end_of_storage(0)
  402a5d:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
  402a64:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
  402a6b:	00 
  402a6c:	48 c7 47 10 00 00 00 	movq   $0x0,0x10(%rdi)
  402a73:	00 
    public:
      _Vector_impl _M_impl;

      pointer
      _M_allocate(size_t __n)
      { return __n != 0 ? _M_impl.allocate(__n) : 0; }
  402a74:	75 1a                	jne    402a90 <_ZN6BitmapC1Em+0x40>
      void
      _M_create_storage(size_t __n)
      {
	this->_M_impl._M_start = this->_M_allocate(__n);
	this->_M_impl._M_finish = this->_M_impl._M_start;
	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
  402a76:	31 d2                	xor    %edx,%edx
  402a78:	48 c7 47 10 00 00 00 	movq   $0x0,0x10(%rdi)
  402a7f:	00 
      void
      _M_default_initialize(size_type __n)
      {
	std::__uninitialized_default_n_a(this->_M_impl._M_start, __n, 
					 _M_get_Tp_allocator());
	this->_M_impl._M_finish = this->_M_impl._M_end_of_storage;
  402a80:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402a84:	5b                   	pop    %rbx
  402a85:	5d                   	pop    %rbp
  402a86:	41 5c                	pop    %r12
  402a88:	c3                   	retq   
  402a89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
      // NB: __n is permitted to be 0.  The C++ standard says nothing
      // about what the return value is when __n == 0.
      pointer
      allocate(size_type __n, const void* = 0)
      { 
	if (__n > this->max_size())
  402a90:	48 b8 ff ff ff ff ff 	movabs $0x1fffffffffffffff,%rax
  402a97:	ff ff 1f 
  402a9a:	48 39 c6             	cmp    %rax,%rsi
  402a9d:	77 3b                	ja     402ada <_ZN6BitmapC1Em+0x8a>
	  std::__throw_bad_alloc();

	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
  402a9f:	4c 8d 24 f5 00 00 00 	lea    0x0(,%rsi,8),%r12
  402aa6:	00 
  402aa7:	4c 89 e7             	mov    %r12,%rdi
  402aaa:	e8 41 f2 ff ff       	callq  401cf0 <_Znwm@plt>
      void
      _M_create_storage(size_t __n)
      {
	this->_M_impl._M_start = this->_M_allocate(__n);
	this->_M_impl._M_finish = this->_M_impl._M_start;
	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
  402aaf:	4a 8d 14 20          	lea    (%rax,%r12,1),%rdx

    private:
      void
      _M_create_storage(size_t __n)
      {
	this->_M_impl._M_start = this->_M_allocate(__n);
  402ab3:	48 89 45 00          	mov    %rax,0x0(%rbp)
	this->_M_impl._M_finish = this->_M_impl._M_start;
  402ab7:	48 89 45 08          	mov    %rax,0x8(%rbp)
	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
  402abb:	48 89 55 10          	mov    %rdx,0x10(%rbp)
  402abf:	90                   	nop
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (__decltype(__n + 0) __niter = __n;
	   __niter > 0; --__niter, ++__first)
	*__first = __tmp;
  402ac0:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    inline typename
    __gnu_cxx::__enable_if<__is_scalar<_Tp>::__value, _OutputIterator>::__type
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (__decltype(__n + 0) __niter = __n;
  402ac7:	48 83 c0 08          	add    $0x8,%rax
  402acb:	48 83 eb 01          	sub    $0x1,%rbx
  402acf:	75 ef                	jne    402ac0 <_ZN6BitmapC1Em+0x70>
      void
      _M_default_initialize(size_type __n)
      {
	std::__uninitialized_default_n_a(this->_M_impl._M_start, __n, 
					 _M_get_Tp_allocator());
	this->_M_impl._M_finish = this->_M_impl._M_end_of_storage;
  402ad1:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402ad5:	5b                   	pop    %rbx
  402ad6:	5d                   	pop    %rbp
  402ad7:	41 5c                	pop    %r12
  402ad9:	c3                   	retq   
      // about what the return value is when __n == 0.
      pointer
      allocate(size_type __n, const void* = 0)
      { 
	if (__n > this->max_size())
	  std::__throw_bad_alloc();
  402ada:	e8 c1 f1 ff ff       	callq  401ca0 <_ZSt17__throw_bad_allocv@plt>
  402adf:	90                   	nop

0000000000402ae0 <_ZN6Bitmap3setEmi>:

void Bitmap::set(position_t position, int value) {
  402ae0:	f3 c3                	repz retq 
  402ae2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  402ae9:	1f 84 00 00 00 00 00 

0000000000402af0 <_ZN6Bitmap3getEm>:
    position_t wordIndex = position / sizeof(vector_element_t);
    
}
int Bitmap::get(unsigned long int position) {
    
}
  402af0:	f3 c3                	repz retq 
  402af2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  402af9:	1f 84 00 00 00 00 00 

0000000000402b00 <_ZN6Bitmap10getPointerEm>:
unsigned long int* Bitmap::getPointer(unsigned long int wordNumber) {
    
}
  402b00:	f3 c3                	repz retq 
  402b02:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402b09:	00 00 00 
  402b0c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402b10 <_ZN4Node29binaryRankPopcountInstructionEm>:
    }
    
    return rank;
}

unsigned long Node::binaryRankPopcountInstruction(unsigned long pos) {
  402b10:	41 55                	push   %r13
  402b12:	41 54                	push   %r12
  402b14:	55                   	push   %rbp
  402b15:	48 89 f5             	mov    %rsi,%rbp
  402b18:	53                   	push   %rbx
  402b19:	48 89 fb             	mov    %rdi,%rbx
  402b1c:	48 83 ec 08          	sub    $0x8,%rsp

    _Bit_const_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    _Bit_const_iterator(const _Bit_iterator& __x)
    : _Bit_iterator_base(__x._M_p, __x._M_offset) { }
  402b20:	4c 8b 0f             	mov    (%rdi),%r9
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  402b23:	48 8b 47 10          	mov    0x10(%rdi),%rax
	    + __x._M_offset - __y._M_offset);
  402b27:	8b 57 18             	mov    0x18(%rdi),%edx
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  402b2a:	4c 29 c8             	sub    %r9,%rax
	    + __x._M_offset - __y._M_offset);
  402b2d:	4c 8d 24 c2          	lea    (%rdx,%rax,8),%r12
  402b31:	8b 47 08             	mov    0x8(%rdi),%eax
  402b34:	49 29 c4             	sub    %rax,%r12
    if(pos > bitmap.size()) cout << "position " << pos << " larger than bitmapsize " << bitmap.size() << endl;
  402b37:	4c 39 e6             	cmp    %r12,%rsi
  402b3a:	77 64                	ja     402ba0 <_ZN4Node29binaryRankPopcountInstructionEm+0x90>
    unsigned long bitmapwordRank = 0;
    
    unsigned long i;
    unsigned long wordsize = sizeof(*bitmap.begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    unsigned long fullWords = pos / wordsize;
  402b3c:	48 89 e8             	mov    %rbp,%rax
  402b3f:	48 c1 e8 06          	shr    $0x6,%rax
    
    for(i = 0; i < fullWords; i++) {
  402b43:	48 85 c0             	test   %rax,%rax
  402b46:	0f 84 f5 00 00 00    	je     402c41 <_ZN4Node29binaryRankPopcountInstructionEm+0x131>
  402b4c:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
  402b53:	00 
  402b54:	4c 89 ca             	mov    %r9,%rdx
    return rank;
}

unsigned long Node::binaryRankPopcountInstruction(unsigned long pos) {
    if(pos > bitmap.size()) cout << "position " << pos << " larger than bitmapsize " << bitmap.size() << endl;
    unsigned long bitmapwordRank = 0;
  402b57:	31 c0                	xor    %eax,%eax
  402b59:	4d 8d 04 09          	lea    (%r9,%rcx,1),%r8
  402b5d:	0f 1f 00             	nopl   (%rax)
    unsigned long wordsize = sizeof(*bitmap.begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    unsigned long fullWords = pos / wordsize;
    
    for(i = 0; i < fullWords; i++) {
        unsigned long word = *(bitmap.begin()._M_p + i);
        bitmapwordRank += __builtin_popcountl(word);
  402b60:	f3 48 0f b8 3a       	popcnt (%rdx),%rdi
  402b65:	48 83 c2 08          	add    $0x8,%rdx
  402b69:	48 01 f8             	add    %rdi,%rax
    
    unsigned long i;
    unsigned long wordsize = sizeof(*bitmap.begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    unsigned long fullWords = pos / wordsize;
    
    for(i = 0; i < fullWords; i++) {
  402b6c:	4c 39 c2             	cmp    %r8,%rdx
  402b6f:	75 ef                	jne    402b60 <_ZN4Node29binaryRankPopcountInstructionEm+0x50>
  402b71:	48 89 ce             	mov    %rcx,%rsi
        unsigned long word = *(bitmap.begin()._M_p + i);
        bitmapwordRank += __builtin_popcountl(word);
    }
    unsigned long word = *(bitmap.begin()._M_p + i);
    unsigned long shift = (pos % wordsize);
  402b74:	48 89 e9             	mov    %rbp,%rcx
    unsigned long mask = (1UL << shift)-1;
  402b77:	ba 01 00 00 00       	mov    $0x1,%edx
    for(i = 0; i < fullWords; i++) {
        unsigned long word = *(bitmap.begin()._M_p + i);
        bitmapwordRank += __builtin_popcountl(word);
    }
    unsigned long word = *(bitmap.begin()._M_p + i);
    unsigned long shift = (pos % wordsize);
  402b7c:	83 e1 3f             	and    $0x3f,%ecx
    unsigned long mask = (1UL << shift)-1;
  402b7f:	48 d3 e2             	shl    %cl,%rdx
  402b82:	48 83 ea 01          	sub    $0x1,%rdx
    
    unsigned long maskedWord = word & mask;
  402b86:	49 23 14 31          	and    (%r9,%rsi,1),%rdx
    bitmapwordRank += __builtin_popcountl(maskedWord);
    return bitmapwordRank;
}
  402b8a:	48 83 c4 08          	add    $0x8,%rsp
  402b8e:	5b                   	pop    %rbx
    unsigned long word = *(bitmap.begin()._M_p + i);
    unsigned long shift = (pos % wordsize);
    unsigned long mask = (1UL << shift)-1;
    
    unsigned long maskedWord = word & mask;
    bitmapwordRank += __builtin_popcountl(maskedWord);
  402b8f:	f3 48 0f b8 d2       	popcnt %rdx,%rdx
  402b94:	48 01 d0             	add    %rdx,%rax
    return bitmapwordRank;
}
  402b97:	5d                   	pop    %rbp
  402b98:	41 5c                	pop    %r12
  402b9a:	41 5d                	pop    %r13
  402b9c:	c3                   	retq   
  402b9d:	0f 1f 00             	nopl   (%rax)
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  402ba0:	ba 09 00 00 00       	mov    $0x9,%edx
  402ba5:	be 34 40 40 00       	mov    $0x404034,%esi
  402baa:	bf 00 53 60 00       	mov    $0x605300,%edi
  402baf:	e8 0c f0 ff ff       	callq  401bc0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
      operator<<(long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long __n)
      { return _M_insert(__n); }
  402bb4:	48 89 ee             	mov    %rbp,%rsi
  402bb7:	bf 00 53 60 00       	mov    $0x605300,%edi
  402bbc:	e8 bf f0 ff ff       	callq  401c80 <_ZNSo9_M_insertImEERSoT_@plt>
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  402bc1:	ba 18 00 00 00       	mov    $0x18,%edx
  402bc6:	be 3e 40 40 00       	mov    $0x40403e,%esi
      operator<<(long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long __n)
      { return _M_insert(__n); }
  402bcb:	49 89 c5             	mov    %rax,%r13
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  402bce:	48 89 c7             	mov    %rax,%rdi
  402bd1:	e8 ea ef ff ff       	callq  401bc0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
      operator<<(long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long __n)
      { return _M_insert(__n); }
  402bd6:	4c 89 e6             	mov    %r12,%rsi
  402bd9:	4c 89 ef             	mov    %r13,%rdi
  402bdc:	e8 9f f0 ff ff       	callq  401c80 <_ZNSo9_M_insertImEERSoT_@plt>
  402be1:	49 89 c5             	mov    %rax,%r13
   *  for more on this subject.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    endl(basic_ostream<_CharT, _Traits>& __os)
    { return flush(__os.put(__os.widen('\n'))); }
  402be4:	48 8b 00             	mov    (%rax),%rax
  402be7:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  402beb:	4d 8b a4 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%r12
  402bf2:	00 

  template<typename _Facet>
    inline const _Facet&
    __check_facet(const _Facet* __f)
    {
      if (!__f)
  402bf3:	4d 85 e4             	test   %r12,%r12
  402bf6:	74 52                	je     402c4a <_ZN4Node29binaryRankPopcountInstructionEm+0x13a>
       *  @return  The converted character.
      */
      char_type
      widen(char __c) const
      {
	if (_M_widen_ok)
  402bf8:	41 80 7c 24 38 00    	cmpb   $0x0,0x38(%r12)
  402bfe:	74 28                	je     402c28 <_ZN4Node29binaryRankPopcountInstructionEm+0x118>
	  return _M_widen[static_cast<unsigned char>(__c)];
  402c00:	41 0f b6 44 24 43    	movzbl 0x43(%r12),%eax
  402c06:	0f be f0             	movsbl %al,%esi
  402c09:	4c 89 ef             	mov    %r13,%rdi
  402c0c:	e8 1f f1 ff ff       	callq  401d30 <_ZNSo3putEc@plt>
   *  This manipulator simply calls the stream's @c flush() member function.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    flush(basic_ostream<_CharT, _Traits>& __os)
    { return __os.flush(); }
  402c11:	48 89 c7             	mov    %rax,%rdi
  402c14:	e8 e7 ef ff ff       	callq  401c00 <_ZNSo5flushEv@plt>
  402c19:	4c 8b 0b             	mov    (%rbx),%r9
  402c1c:	e9 1b ff ff ff       	jmpq   402b3c <_ZN4Node29binaryRankPopcountInstructionEm+0x2c>
  402c21:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
	this->_M_widen_init();
  402c28:	4c 89 e7             	mov    %r12,%rdi
  402c2b:	e8 30 ee ff ff       	callq  401a60 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
	return this->do_widen(__c);
  402c30:	49 8b 04 24          	mov    (%r12),%rax
  402c34:	be 0a 00 00 00       	mov    $0xa,%esi
  402c39:	4c 89 e7             	mov    %r12,%rdi
  402c3c:	ff 50 30             	callq  *0x30(%rax)
  402c3f:	eb c5                	jmp    402c06 <_ZN4Node29binaryRankPopcountInstructionEm+0xf6>
    
    unsigned long i;
    unsigned long wordsize = sizeof(*bitmap.begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    unsigned long fullWords = pos / wordsize;
    
    for(i = 0; i < fullWords; i++) {
  402c41:	31 f6                	xor    %esi,%esi
    return rank;
}

unsigned long Node::binaryRankPopcountInstruction(unsigned long pos) {
    if(pos > bitmap.size()) cout << "position " << pos << " larger than bitmapsize " << bitmap.size() << endl;
    unsigned long bitmapwordRank = 0;
  402c43:	31 c0                	xor    %eax,%eax
  402c45:	e9 2a ff ff ff       	jmpq   402b74 <_ZN4Node29binaryRankPopcountInstructionEm+0x64>
  402c4a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
	__throw_bad_cast();
  402c50:	e8 8b ed ff ff       	callq  4019e0 <_ZSt16__throw_bad_castv@plt>
  402c55:	90                   	nop
  402c56:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402c5d:	00 00 00 

0000000000402c60 <_ZN4Node4rankEimiij>:
        delete leftString;
    }
}


int Node::rank(int character, unsigned long index, int alphabetMin, int alphabetMax, uint skew){
  402c60:	41 57                	push   %r15
  402c62:	41 56                	push   %r14
  402c64:	41 89 f6             	mov    %esi,%r14d
  402c67:	41 55                	push   %r13
  402c69:	45 89 cd             	mov    %r9d,%r13d
  402c6c:	41 54                	push   %r12
  402c6e:	41 89 cc             	mov    %ecx,%r12d
  402c71:	55                   	push   %rbp
  402c72:	48 89 d5             	mov    %rdx,%rbp
  402c75:	53                   	push   %rbx
  402c76:	48 89 fb             	mov    %rdi,%rbx
  402c79:	48 83 ec 18          	sub    $0x18,%rsp
    if(isLeaf){
  402c7d:	80 7b 28 00          	cmpb   $0x0,0x28(%rbx)
  402c81:	75 42                	jne    402cc5 <_ZN4Node4rankEimiij+0x65>
//        cout << "Rank Leaf" << endl;
        return index;
    }
    
    int alphabetSize = alphabetMax - alphabetMin +1;
  402c83:	44 89 c0             	mov    %r8d,%eax
    int split = (alphabetSize-1)/skew + alphabetMin;
  402c86:	31 d2                	xor    %edx,%edx
    if(isLeaf){
//        cout << "Rank Leaf" << endl;
        return index;
    }
    
    int alphabetSize = alphabetMax - alphabetMin +1;
  402c88:	44 29 e0             	sub    %r12d,%eax
    int split = (alphabetSize-1)/skew + alphabetMin;
  402c8b:	41 f7 f5             	div    %r13d
  402c8e:	46 8d 3c 20          	lea    (%rax,%r12,1),%r15d
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
    bool charBit = character > split;
    unsigned long pos = charBit ? binaryRankPopcountInstruction(index) : index - binaryRankPopcountInstruction(index);
  402c92:	45 39 f7             	cmp    %r14d,%r15d
  402c95:	7d 49                	jge    402ce0 <_ZN4Node4rankEimiij+0x80>
  402c97:	48 89 ee             	mov    %rbp,%rsi
  402c9a:	48 89 df             	mov    %rbx,%rdi
  402c9d:	44 89 44 24 0c       	mov    %r8d,0xc(%rsp)
  402ca2:	e8 69 fe ff ff       	callq  402b10 <_ZN4Node29binaryRankPopcountInstructionEm>
    unsigned long rank = 0;
    if(charBit && right != nullptr) {
  402ca7:	44 8b 44 24 0c       	mov    0xc(%rsp),%r8d
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
    bool charBit = character > split;
    unsigned long pos = charBit ? binaryRankPopcountInstruction(index) : index - binaryRankPopcountInstruction(index);
  402cac:	48 89 c5             	mov    %rax,%rbp
    unsigned long rank = 0;
    if(charBit && right != nullptr) {
  402caf:	48 8b 43 40          	mov    0x40(%rbx),%rax
  402cb3:	48 85 c0             	test   %rax,%rax
  402cb6:	74 36                	je     402cee <_ZN4Node4rankEimiij+0x8e>
    
    int alphabetSize = alphabetMax - alphabetMin +1;
    int split = (alphabetSize-1)/skew + alphabetMin;
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
  402cb8:	45 8d 67 01          	lea    0x1(%r15),%r12d
    
    bool charBit = character > split;
    unsigned long pos = charBit ? binaryRankPopcountInstruction(index) : index - binaryRankPopcountInstruction(index);
    unsigned long rank = 0;
    if(charBit && right != nullptr) {
        rank = right->rank(character, pos, rightAlphabetMin, rightAlphabetMax, skew); //right sub tree
  402cbc:	48 89 c3             	mov    %rax,%rbx
    }
}


int Node::rank(int character, unsigned long index, int alphabetMin, int alphabetMax, uint skew){
    if(isLeaf){
  402cbf:	80 7b 28 00          	cmpb   $0x0,0x28(%rbx)
  402cc3:	74 be                	je     402c83 <_ZN4Node4rankEimiij+0x23>
    }else if(left != nullptr){
        rank = left->rank(character, pos, leftAlphabetMin, leftAlphabetMax, skew); //right sub tree
    }
    
    return rank;
}
  402cc5:	48 83 c4 18          	add    $0x18,%rsp


int Node::rank(int character, unsigned long index, int alphabetMin, int alphabetMax, uint skew){
    if(isLeaf){
//        cout << "Rank Leaf" << endl;
        return index;
  402cc9:	89 e8                	mov    %ebp,%eax
    }else if(left != nullptr){
        rank = left->rank(character, pos, leftAlphabetMin, leftAlphabetMax, skew); //right sub tree
    }
    
    return rank;
}
  402ccb:	5b                   	pop    %rbx
  402ccc:	5d                   	pop    %rbp
  402ccd:	41 5c                	pop    %r12
  402ccf:	41 5d                	pop    %r13
  402cd1:	41 5e                	pop    %r14
  402cd3:	41 5f                	pop    %r15
  402cd5:	c3                   	retq   
  402cd6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402cdd:	00 00 00 
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
    bool charBit = character > split;
    unsigned long pos = charBit ? binaryRankPopcountInstruction(index) : index - binaryRankPopcountInstruction(index);
  402ce0:	48 89 ee             	mov    %rbp,%rsi
  402ce3:	48 89 df             	mov    %rbx,%rdi
  402ce6:	e8 25 fe ff ff       	callq  402b10 <_ZN4Node29binaryRankPopcountInstructionEm>
  402ceb:	48 29 c5             	sub    %rax,%rbp
    unsigned long rank = 0;
    if(charBit && right != nullptr) {
        rank = right->rank(character, pos, rightAlphabetMin, rightAlphabetMax, skew); //right sub tree
    }else if(left != nullptr){
  402cee:	48 8b 5b 38          	mov    0x38(%rbx),%rbx
  402cf2:	48 85 db             	test   %rbx,%rbx
  402cf5:	74 09                	je     402d00 <_ZN4Node4rankEimiij+0xa0>
        rank = left->rank(character, pos, leftAlphabetMin, leftAlphabetMax, skew); //right sub tree
  402cf7:	45 89 f8             	mov    %r15d,%r8d
  402cfa:	eb 81                	jmp    402c7d <_ZN4Node4rankEimiij+0x1d>
  402cfc:	0f 1f 40 00          	nopl   0x0(%rax)
    }
    
    return rank;
}
  402d00:	48 83 c4 18          	add    $0x18,%rsp
  402d04:	31 c0                	xor    %eax,%eax
  402d06:	5b                   	pop    %rbx
  402d07:	5d                   	pop    %rbp
  402d08:	41 5c                	pop    %r12
  402d0a:	41 5d                	pop    %r13
  402d0c:	41 5e                	pop    %r14
  402d0e:	41 5f                	pop    %r15
  402d10:	c3                   	retq   
  402d11:	90                   	nop
  402d12:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  402d19:	1f 84 00 00 00 00 00 

0000000000402d20 <_ZN4Node10binaryRankEm>:
    { this->assign(__l.begin(), __l.end()); }
#endif

    iterator
    begin() _GLIBCXX_NOEXCEPT
    { return this->_M_impl._M_start; }
  402d20:	4c 8b 07             	mov    (%rdi),%r8
    return bitmapwordRank;
}

ulong Node::binaryRank(ulong pos) {
    int i = 1;
    int rank = 0;
  402d23:	31 c0                	xor    %eax,%eax
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  402d25:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    { this->assign(__l.begin(), __l.end()); }
#endif

    iterator
    begin() _GLIBCXX_NOEXCEPT
    { return this->_M_impl._M_start; }
  402d2b:	8b 4f 08             	mov    0x8(%rdi),%ecx
  402d2e:	44 8b 5f 18          	mov    0x18(%rdi),%r11d
  402d32:	4c 8b 4f 10          	mov    0x10(%rdi),%r9
    for(auto it = bitmap.begin(); it != bitmap.end(); it++) {
  402d36:	bf 01 00 00 00       	mov    $0x1,%edi
  402d3b:	eb 26                	jmp    402d63 <_ZN4Node10binaryRankEm+0x43>
  402d3d:	0f 1f 00             	nopl   (%rax)
        if(i > pos) break;
  402d40:	48 39 fe             	cmp    %rdi,%rsi
  402d43:	72 28                	jb     402d6d <_ZN4Node10binaryRankEm+0x4d>
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  402d45:	4c 89 d2             	mov    %r10,%rdx
  402d48:	48 d3 e2             	shl    %cl,%rdx
    : _M_p(__x), _M_mask(__y) { }

    _Bit_reference() _GLIBCXX_NOEXCEPT : _M_p(0), _M_mask(0) { }

    operator bool() const _GLIBCXX_NOEXCEPT
    { return !!(*_M_p & _M_mask); }
  402d4b:	49 23 10             	and    (%r8),%rdx
        bool currentBit = *it;
        if(currentBit) rank++;
  402d4e:	48 83 fa 01          	cmp    $0x1,%rdx
    : _M_p(__x), _M_offset(__y) { }

    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
  402d52:	8d 51 01             	lea    0x1(%rcx),%edx
  402d55:	83 d8 ff             	sbb    $0xffffffff,%eax
  402d58:	83 f9 3f             	cmp    $0x3f,%ecx
  402d5b:	74 13                	je     402d70 <_ZN4Node10binaryRankEm+0x50>
  402d5d:	48 83 c7 01          	add    $0x1,%rdi
	{
	  _M_offset = 0;
  402d61:	89 d1                	mov    %edx,%ecx
      _M_offset = static_cast<unsigned int>(__n);
    }

    bool
    operator==(const _Bit_iterator_base& __i) const
    { return _M_p == __i._M_p && _M_offset == __i._M_offset; }
  402d63:	4d 39 c1             	cmp    %r8,%r9
  402d66:	75 d8                	jne    402d40 <_ZN4Node10binaryRankEm+0x20>
  402d68:	44 39 d9             	cmp    %r11d,%ecx
  402d6b:	75 d3                	jne    402d40 <_ZN4Node10binaryRankEm+0x20>
        i++;
    }
    return rank;
  402d6d:	48 98                	cltq   
}
  402d6f:	c3                   	retq   
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
	  ++_M_p;
  402d70:	49 83 c0 08          	add    $0x8,%r8
    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
  402d74:	31 d2                	xor    %edx,%edx
  402d76:	eb e5                	jmp    402d5d <_ZN4Node10binaryRankEm+0x3d>
  402d78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402d7f:	00 

0000000000402d80 <_ZN4Node12binarySelectEbm>:

    bool parentCharBit = this == parent->right;
    return parent->select(parentCharBit, position+1);
}

uint Node::binarySelect(bool charBit, unsigned long occurance) {
  402d80:	53                   	push   %rbx

    _Bit_const_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    _Bit_const_iterator(const _Bit_iterator& __x)
    : _Bit_iterator_base(__x._M_p, __x._M_offset) { }
  402d81:	4c 8b 07             	mov    (%rdi),%r8
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  402d84:	48 8b 47 10          	mov    0x10(%rdi),%rax
	    + __x._M_offset - __y._M_offset);
  402d88:	8b 4f 18             	mov    0x18(%rdi),%ecx
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  402d8b:	4c 29 c0             	sub    %r8,%rax
	    + __x._M_offset - __y._M_offset);
  402d8e:	4c 8d 14 c1          	lea    (%rcx,%rax,8),%r10
  402d92:	8b 47 08             	mov    0x8(%rdi),%eax
    unsigned long occ = 0;
    for(unsigned long i = 0; i < bitmap.size(); i++) {
  402d95:	49 39 c2             	cmp    %rax,%r10
  402d98:	74 46                	je     402de0 <_ZN4Node12binarySelectEbm+0x60>
  402d9a:	31 c9                	xor    %ecx,%ecx
    bool parentCharBit = this == parent->right;
    return parent->select(parentCharBit, position+1);
}

uint Node::binarySelect(bool charBit, unsigned long occurance) {
    unsigned long occ = 0;
  402d9c:	45 31 db             	xor    %r11d,%r11d
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  402d9f:	41 b9 01 00 00 00    	mov    $0x1,%r9d

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
	    + __x._M_offset - __y._M_offset);
  402da5:	49 29 c2             	sub    %rax,%r10
  402da8:	eb 0f                	jmp    402db9 <_ZN4Node12binarySelectEbm+0x39>
  402daa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    for(unsigned long i = 0; i < bitmap.size(); i++) {
  402db0:	48 83 c1 01          	add    $0x1,%rcx
  402db4:	4c 39 d1             	cmp    %r10,%rcx
  402db7:	73 27                	jae    402de0 <_ZN4Node12binarySelectEbm+0x60>

    reference
    operator[](size_type __n)
    {
      return *iterator(this->_M_impl._M_start._M_p
		       + __n / int(_S_word_bit), __n % int(_S_word_bit));
  402db9:	48 89 c8             	mov    %rcx,%rax
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  402dbc:	4c 89 cf             	mov    %r9,%rdi

    reference
    operator[](size_type __n)
    {
      return *iterator(this->_M_impl._M_start._M_p
		       + __n / int(_S_word_bit), __n % int(_S_word_bit));
  402dbf:	48 c1 e8 06          	shr    $0x6,%rax
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  402dc3:	48 d3 e7             	shl    %cl,%rdi
    : _M_p(__x), _M_mask(__y) { }

    _Bit_reference() _GLIBCXX_NOEXCEPT : _M_p(0), _M_mask(0) { }

    operator bool() const _GLIBCXX_NOEXCEPT
    { return !!(*_M_p & _M_mask); }
  402dc6:	49 85 3c c0          	test   %rdi,(%r8,%rax,8)
  402dca:	0f 95 c0             	setne  %al
        if(bitmap[i] == charBit) { 
  402dcd:	40 38 c6             	cmp    %al,%sil
  402dd0:	75 de                	jne    402db0 <_ZN4Node12binarySelectEbm+0x30>
            if(++occ == occurance) {
  402dd2:	49 83 c3 01          	add    $0x1,%r11
  402dd6:	49 39 d3             	cmp    %rdx,%r11
  402dd9:	75 d5                	jne    402db0 <_ZN4Node12binarySelectEbm+0x30>
                return i;
  402ddb:	89 c8                	mov    %ecx,%eax
            }
        }
    }
    cout << "Occurance too high!" << endl;
}
  402ddd:	5b                   	pop    %rbx
  402dde:	c3                   	retq   
  402ddf:	90                   	nop
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  402de0:	ba 13 00 00 00       	mov    $0x13,%edx
  402de5:	be 57 40 40 00       	mov    $0x404057,%esi
  402dea:	bf 00 53 60 00       	mov    $0x605300,%edi
  402def:	e8 cc ed ff ff       	callq  401bc0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
   *  for more on this subject.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    endl(basic_ostream<_CharT, _Traits>& __os)
    { return flush(__os.put(__os.widen('\n'))); }
  402df4:	48 8b 05 05 25 20 00 	mov    0x202505(%rip),%rax        # 605300 <_ZSt4cout@@GLIBCXX_3.4>
  402dfb:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  402dff:	48 8b 98 f0 53 60 00 	mov    0x6053f0(%rax),%rbx

  template<typename _Facet>
    inline const _Facet&
    __check_facet(const _Facet* __f)
    {
      if (!__f)
  402e06:	48 85 db             	test   %rbx,%rbx
  402e09:	74 3d                	je     402e48 <_ZN4Node12binarySelectEbm+0xc8>
       *  @return  The converted character.
      */
      char_type
      widen(char __c) const
      {
	if (_M_widen_ok)
  402e0b:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
  402e0f:	74 1f                	je     402e30 <_ZN4Node12binarySelectEbm+0xb0>
	  return _M_widen[static_cast<unsigned char>(__c)];
  402e11:	0f b6 43 43          	movzbl 0x43(%rbx),%eax
  402e15:	0f be f0             	movsbl %al,%esi
  402e18:	bf 00 53 60 00       	mov    $0x605300,%edi
  402e1d:	e8 0e ef ff ff       	callq  401d30 <_ZNSo3putEc@plt>
   *  This manipulator simply calls the stream's @c flush() member function.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    flush(basic_ostream<_CharT, _Traits>& __os)
    { return __os.flush(); }
  402e22:	48 89 c7             	mov    %rax,%rdi
  402e25:	e8 d6 ed ff ff       	callq  401c00 <_ZNSo5flushEv@plt>
  402e2a:	5b                   	pop    %rbx
  402e2b:	c3                   	retq   
  402e2c:	0f 1f 40 00          	nopl   0x0(%rax)
	this->_M_widen_init();
  402e30:	48 89 df             	mov    %rbx,%rdi
  402e33:	e8 28 ec ff ff       	callq  401a60 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
	return this->do_widen(__c);
  402e38:	48 8b 03             	mov    (%rbx),%rax
  402e3b:	be 0a 00 00 00       	mov    $0xa,%esi
  402e40:	48 89 df             	mov    %rbx,%rdi
  402e43:	ff 50 30             	callq  *0x30(%rax)
  402e46:	eb cd                	jmp    402e15 <_ZN4Node12binarySelectEbm+0x95>
	__throw_bad_cast();
  402e48:	e8 93 eb ff ff       	callq  4019e0 <_ZSt16__throw_bad_castv@plt>
  402e4d:	90                   	nop
  402e4e:	66 90                	xchg   %ax,%ax

0000000000402e50 <_ZN4Node7getLeafEjjjj>:

Node* Node::getLeaf(uint character, uint alphabetMin, uint alphabetMax, uint skew) {
  402e50:	41 89 d2             	mov    %edx,%r10d
  402e53:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    if(isLeaf){
  402e58:	80 7f 28 00          	cmpb   $0x0,0x28(%rdi)
  402e5c:	75 29                	jne    402e87 <_ZN4Node7getLeafEjjjj+0x37>
        return this;
    }

    uint alphabetSize = alphabetMax - alphabetMin +1;
  402e5e:	89 c8                	mov    %ecx,%eax
    uint split = (alphabetSize-1)/skew + alphabetMin;
  402e60:	31 d2                	xor    %edx,%edx
Node* Node::getLeaf(uint character, uint alphabetMin, uint alphabetMax, uint skew) {
    if(isLeaf){
        return this;
    }

    uint alphabetSize = alphabetMax - alphabetMin +1;
  402e62:	44 29 d0             	sub    %r10d,%eax
    uint split = (alphabetSize-1)/skew + alphabetMin;
  402e65:	41 f7 f0             	div    %r8d
  402e68:	46 8d 0c 10          	lea    (%rax,%r10,1),%r9d
    uint rightAlphabetMax = alphabetMax;

    bool charBit = character > split;

    Node* leaf = nullptr;
    if(charBit && right != nullptr){
  402e6c:	41 39 f1             	cmp    %esi,%r9d
  402e6f:	73 1f                	jae    402e90 <_ZN4Node7getLeafEjjjj+0x40>
  402e71:	48 8b 47 40          	mov    0x40(%rdi),%rax
  402e75:	48 85 c0             	test   %rax,%rax
  402e78:	74 16                	je     402e90 <_ZN4Node7getLeafEjjjj+0x40>

    uint alphabetSize = alphabetMax - alphabetMin +1;
    uint split = (alphabetSize-1)/skew + alphabetMin;
    uint leftAlphabetMin = alphabetMin;
    uint leftAlphabetMax = split;
    uint rightAlphabetMin = split+1;
  402e7a:	45 8d 51 01          	lea    0x1(%r9),%r10d
  402e7e:	48 89 c7             	mov    %rax,%rdi
    }
    cout << "Occurance too high!" << endl;
}

Node* Node::getLeaf(uint character, uint alphabetMin, uint alphabetMax, uint skew) {
    if(isLeaf){
  402e81:	80 7f 28 00          	cmpb   $0x0,0x28(%rdi)
  402e85:	74 d7                	je     402e5e <_ZN4Node7getLeafEjjjj+0xe>
  402e87:	48 89 f8             	mov    %rdi,%rax
    }else if(left != nullptr){
        leaf = left->getLeaf(character, leftAlphabetMin, leftAlphabetMax, skew); //right sub tree
    }

    return leaf;
}
  402e8a:	c3                   	retq   
  402e8b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    bool charBit = character > split;

    Node* leaf = nullptr;
    if(charBit && right != nullptr){
        leaf = right->getLeaf(character, rightAlphabetMin, rightAlphabetMax, skew); //right sub tree
    }else if(left != nullptr){
  402e90:	48 8b 47 38          	mov    0x38(%rdi),%rax
  402e94:	48 85 c0             	test   %rax,%rax
  402e97:	74 0f                	je     402ea8 <_ZN4Node7getLeafEjjjj+0x58>
    if(isLeaf){
        return this;
    }

    uint alphabetSize = alphabetMax - alphabetMin +1;
    uint split = (alphabetSize-1)/skew + alphabetMin;
  402e99:	44 89 c9             	mov    %r9d,%ecx
  402e9c:	48 89 c7             	mov    %rax,%rdi
  402e9f:	eb b7                	jmp    402e58 <_ZN4Node7getLeafEjjjj+0x8>
  402ea1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402ea8:	f3 c3                	repz retq 
  402eaa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000402eb0 <_ZN4Node20popcountBinarySelectEbm>:
        mask <<= 1;
    }
    cout << "Occurance " << occurance << " too high! saw " << occ << endl;
}

ulong Node::popcountBinarySelect(bool charBit, ulong occurance) {
  402eb0:	41 54                	push   %r12
  402eb2:	41 89 f1             	mov    %esi,%r9d
  402eb5:	55                   	push   %rbp
  402eb6:	53                   	push   %rbx

    _Bit_const_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    _Bit_const_iterator(const _Bit_iterator& __x)
    : _Bit_iterator_base(__x._M_p, __x._M_offset) { }
  402eb7:	4c 8b 1f             	mov    (%rdi),%r11
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  402eba:	48 8b 47 10          	mov    0x10(%rdi),%rax
	    + __x._M_offset - __y._M_offset);
  402ebe:	8b 4f 18             	mov    0x18(%rdi),%ecx
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  402ec1:	4c 29 d8             	sub    %r11,%rax
	    + __x._M_offset - __y._M_offset);
  402ec4:	48 8d 0c c1          	lea    (%rcx,%rax,8),%rcx
  402ec8:	8b 47 08             	mov    0x8(%rdi),%eax
  402ecb:	48 29 c1             	sub    %rax,%rcx
    ulong occ = 0; //counter for occurances
    
    ulong i, pos;
    ulong wordsize = sizeof(*bitmap.begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    ulong fullWords = bitmap.size() / wordsize;
  402ece:	48 89 cb             	mov    %rcx,%rbx
  402ed1:	48 c1 eb 06          	shr    $0x6,%rbx
    
    for(i = 0; i < fullWords; i++) {
  402ed5:	48 85 db             	test   %rbx,%rbx
  402ed8:	0f 84 38 02 00 00    	je     403116 <_ZN4Node20popcountBinarySelectEbm+0x266>
  402ede:	31 c0                	xor    %eax,%eax
    }
    cout << "Occurance " << occurance << " too high! saw " << occ << endl;
}

ulong Node::popcountBinarySelect(bool charBit, ulong occurance) {
    ulong occ = 0; //counter for occurances
  402ee0:	45 31 d2             	xor    %r10d,%r10d
    ulong wordsize = sizeof(*bitmap.begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    ulong fullWords = bitmap.size() / wordsize;
    
    for(i = 0; i < fullWords; i++) {
        ulong word = *(bitmap.begin()._M_p + i);
        ulong wordOcc = charBit ? __builtin_popcountl(word) : wordsize - __builtin_popcountl(word);
  402ee3:	bd 40 00 00 00       	mov    $0x40,%ebp
  402ee8:	eb 12                	jmp    402efc <_ZN4Node20popcountBinarySelectEbm+0x4c>
  402eea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    
    ulong i, pos;
    ulong wordsize = sizeof(*bitmap.begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    ulong fullWords = bitmap.size() / wordsize;
    
    for(i = 0; i < fullWords; i++) {
  402ef0:	48 83 c0 01          	add    $0x1,%rax
  402ef4:	48 39 d8             	cmp    %rbx,%rax
  402ef7:	74 77                	je     402f70 <_ZN4Node20popcountBinarySelectEbm+0xc0>
  402ef9:	4d 89 c2             	mov    %r8,%r10
        ulong word = *(bitmap.begin()._M_p + i);
  402efc:	49 8b 3c c3          	mov    (%r11,%rax,8),%rdi
        ulong wordOcc = charBit ? __builtin_popcountl(word) : wordsize - __builtin_popcountl(word);
  402f00:	f3 4c 0f b8 c7       	popcnt %rdi,%r8
  402f05:	45 84 c9             	test   %r9b,%r9b
  402f08:	75 09                	jne    402f13 <_ZN4Node20popcountBinarySelectEbm+0x63>
  402f0a:	49 89 ec             	mov    %rbp,%r12
  402f0d:	4d 29 c4             	sub    %r8,%r12
  402f10:	4d 89 e0             	mov    %r12,%r8
        if(occ + wordOcc >= occurance) {
  402f13:	4d 01 d0             	add    %r10,%r8
  402f16:	49 39 d0             	cmp    %rdx,%r8
  402f19:	72 d5                	jb     402ef0 <_ZN4Node20popcountBinarySelectEbm+0x40>
            pos = i*wordsize;
  402f1b:	48 c1 e0 06          	shl    $0x6,%rax
            return pos + popcountBinarySelectAux(word, charBit, occurance - occ);
  402f1f:	4c 29 d2             	sub    %r10,%rdx




inline ulong popcountBinarySelectAux(ulong word, bool charBit, ulong occurance) {
    unsigned long occ = 0;
  402f22:	31 ed                	xor    %ebp,%ebp
    
    for(i = 0; i < fullWords; i++) {
        ulong word = *(bitmap.begin()._M_p + i);
        ulong wordOcc = charBit ? __builtin_popcountl(word) : wordsize - __builtin_popcountl(word);
        if(occ + wordOcc >= occurance) {
            pos = i*wordsize;
  402f24:	48 89 c3             	mov    %rax,%rbx
            return pos + popcountBinarySelectAux(word, charBit, occurance - occ);
  402f27:	49 89 d4             	mov    %rdx,%r12


inline ulong popcountBinarySelectAux(ulong word, bool charBit, ulong occurance) {
    unsigned long occ = 0;
    ulong mask = 1;
    for(unsigned long i = 0; i < sizeof(word) * CHAR_BIT; i++) {
  402f2a:	31 c0                	xor    %eax,%eax



inline ulong popcountBinarySelectAux(ulong word, bool charBit, ulong occurance) {
    unsigned long occ = 0;
    ulong mask = 1;
  402f2c:	b9 01 00 00 00       	mov    $0x1,%ecx
  402f31:	eb 16                	jmp    402f49 <_ZN4Node20popcountBinarySelectEbm+0x99>
  402f33:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    for(unsigned long i = 0; i < sizeof(word) * CHAR_BIT; i++) {
  402f38:	48 83 c0 01          	add    $0x1,%rax
        bool bit = (word & mask) > 0;
        if(bit == charBit) {
            if(++occ == occurance) return i;
        }
        mask <<= 1;
  402f3c:	48 01 c9             	add    %rcx,%rcx


inline ulong popcountBinarySelectAux(ulong word, bool charBit, ulong occurance) {
    unsigned long occ = 0;
    ulong mask = 1;
    for(unsigned long i = 0; i < sizeof(word) * CHAR_BIT; i++) {
  402f3f:	48 83 f8 40          	cmp    $0x40,%rax
  402f43:	0f 84 a7 00 00 00    	je     402ff0 <_ZN4Node20popcountBinarySelectEbm+0x140>
        bool bit = (word & mask) > 0;
  402f49:	48 85 f9             	test   %rdi,%rcx
  402f4c:	41 0f 95 c0          	setne  %r8b
        if(bit == charBit) {
  402f50:	45 38 c1             	cmp    %r8b,%r9b
  402f53:	75 e3                	jne    402f38 <_ZN4Node20popcountBinarySelectEbm+0x88>
            if(++occ == occurance) return i;
  402f55:	48 83 c5 01          	add    $0x1,%rbp
  402f59:	49 39 ec             	cmp    %rbp,%r12
  402f5c:	75 da                	jne    402f38 <_ZN4Node20popcountBinarySelectEbm+0x88>
    for(i = 0; i < fullWords; i++) {
        ulong word = *(bitmap.begin()._M_p + i);
        ulong wordOcc = charBit ? __builtin_popcountl(word) : wordsize - __builtin_popcountl(word);
        if(occ + wordOcc >= occurance) {
            pos = i*wordsize;
            return pos + popcountBinarySelectAux(word, charBit, occurance - occ);
  402f5e:	48 01 d8             	add    %rbx,%rax
        ulong pos = i*wordsize;
        return pos + popcountBinarySelectAux(maskedWord, charBit, occurance - occ);
    } else {
        occ += wordOcc;
    }
}
  402f61:	5b                   	pop    %rbx
  402f62:	5d                   	pop    %rbp
  402f63:	41 5c                	pop    %r12
  402f65:	c3                   	retq   
  402f66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f6d:	00 00 00 
  402f70:	4c 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%r10
  402f77:	00 
    }
    
    //part of last word if unaligned
    pos = i*wordsize;
    ulong word = *(bitmap.begin()._M_p + i);
    ulong shift = (bitmap.size() % wordsize);
  402f78:	83 e1 3f             	and    $0x3f,%ecx
    ulong mask = (1UL << shift)-1;
  402f7b:	bf 01 00 00 00       	mov    $0x1,%edi
  402f80:	48 d3 e7             	shl    %cl,%rdi
  402f83:	48 8d 4f ff          	lea    -0x1(%rdi),%rcx
    ulong maskedWord = word & mask;
  402f87:	48 89 cf             	mov    %rcx,%rdi
  402f8a:	4b 23 3c 13          	and    (%r11,%r10,1),%rdi
    ulong wordOcc = charBit ? __builtin_popcountl(maskedWord) : __builtin_popcountl(mask) - __builtin_popcountl(maskedWord);
  402f8e:	40 84 f6             	test   %sil,%sil
  402f91:	0f 84 d9 00 00 00    	je     403070 <_ZN4Node20popcountBinarySelectEbm+0x1c0>
  402f97:	f3 48 0f b8 cf       	popcnt %rdi,%rcx
    if(occ + wordOcc >= occurance) {
  402f9c:	4c 01 c1             	add    %r8,%rcx
  402f9f:	48 39 ca             	cmp    %rcx,%rdx
  402fa2:	77 bd                	ja     402f61 <_ZN4Node20popcountBinarySelectEbm+0xb1>
        ulong pos = i*wordsize;
        return pos + popcountBinarySelectAux(maskedWord, charBit, occurance - occ);
  402fa4:	4c 29 c2             	sub    %r8,%rdx
    ulong shift = (bitmap.size() % wordsize);
    ulong mask = (1UL << shift)-1;
    ulong maskedWord = word & mask;
    ulong wordOcc = charBit ? __builtin_popcountl(maskedWord) : __builtin_popcountl(mask) - __builtin_popcountl(maskedWord);
    if(occ + wordOcc >= occurance) {
        ulong pos = i*wordsize;
  402fa7:	48 c1 e0 06          	shl    $0x6,%rax




inline ulong popcountBinarySelectAux(ulong word, bool charBit, ulong occurance) {
    unsigned long occ = 0;
  402fab:	31 ed                	xor    %ebp,%ebp
    ulong mask = (1UL << shift)-1;
    ulong maskedWord = word & mask;
    ulong wordOcc = charBit ? __builtin_popcountl(maskedWord) : __builtin_popcountl(mask) - __builtin_popcountl(maskedWord);
    if(occ + wordOcc >= occurance) {
        ulong pos = i*wordsize;
        return pos + popcountBinarySelectAux(maskedWord, charBit, occurance - occ);
  402fad:	49 89 d4             	mov    %rdx,%r12
    ulong shift = (bitmap.size() % wordsize);
    ulong mask = (1UL << shift)-1;
    ulong maskedWord = word & mask;
    ulong wordOcc = charBit ? __builtin_popcountl(maskedWord) : __builtin_popcountl(mask) - __builtin_popcountl(maskedWord);
    if(occ + wordOcc >= occurance) {
        ulong pos = i*wordsize;
  402fb0:	48 89 c3             	mov    %rax,%rbx


inline ulong popcountBinarySelectAux(ulong word, bool charBit, ulong occurance) {
    unsigned long occ = 0;
    ulong mask = 1;
    for(unsigned long i = 0; i < sizeof(word) * CHAR_BIT; i++) {
  402fb3:	31 d2                	xor    %edx,%edx



inline ulong popcountBinarySelectAux(ulong word, bool charBit, ulong occurance) {
    unsigned long occ = 0;
    ulong mask = 1;
  402fb5:	b9 01 00 00 00       	mov    $0x1,%ecx
  402fba:	eb 15                	jmp    402fd1 <_ZN4Node20popcountBinarySelectEbm+0x121>
  402fbc:	0f 1f 40 00          	nopl   0x0(%rax)
    for(unsigned long i = 0; i < sizeof(word) * CHAR_BIT; i++) {
  402fc0:	48 83 c2 01          	add    $0x1,%rdx
        bool bit = (word & mask) > 0;
        if(bit == charBit) {
            if(++occ == occurance) return i;
        }
        mask <<= 1;
  402fc4:	48 01 c9             	add    %rcx,%rcx


inline ulong popcountBinarySelectAux(ulong word, bool charBit, ulong occurance) {
    unsigned long occ = 0;
    ulong mask = 1;
    for(unsigned long i = 0; i < sizeof(word) * CHAR_BIT; i++) {
  402fc7:	48 83 fa 40          	cmp    $0x40,%rdx
  402fcb:	0f 84 cc 00 00 00    	je     40309d <_ZN4Node20popcountBinarySelectEbm+0x1ed>
        bool bit = (word & mask) > 0;
  402fd1:	48 85 f9             	test   %rdi,%rcx
  402fd4:	0f 95 c0             	setne  %al
        if(bit == charBit) {
  402fd7:	41 38 c1             	cmp    %al,%r9b
  402fda:	75 e4                	jne    402fc0 <_ZN4Node20popcountBinarySelectEbm+0x110>
            if(++occ == occurance) return i;
  402fdc:	48 83 c5 01          	add    $0x1,%rbp
  402fe0:	49 39 ec             	cmp    %rbp,%r12
  402fe3:	75 db                	jne    402fc0 <_ZN4Node20popcountBinarySelectEbm+0x110>
    ulong mask = (1UL << shift)-1;
    ulong maskedWord = word & mask;
    ulong wordOcc = charBit ? __builtin_popcountl(maskedWord) : __builtin_popcountl(mask) - __builtin_popcountl(maskedWord);
    if(occ + wordOcc >= occurance) {
        ulong pos = i*wordsize;
        return pos + popcountBinarySelectAux(maskedWord, charBit, occurance - occ);
  402fe5:	48 8d 04 1a          	lea    (%rdx,%rbx,1),%rax
    } else {
        occ += wordOcc;
    }
}
  402fe9:	5b                   	pop    %rbx
  402fea:	5d                   	pop    %rbp
  402feb:	41 5c                	pop    %r12
  402fed:	c3                   	retq   
  402fee:	66 90                	xchg   %ax,%ax
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  402ff0:	ba 0a 00 00 00       	mov    $0xa,%edx
  402ff5:	be 6b 40 40 00       	mov    $0x40406b,%esi
  402ffa:	bf 00 53 60 00       	mov    $0x605300,%edi
  402fff:	e8 bc eb ff ff       	callq  401bc0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
      operator<<(long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long __n)
      { return _M_insert(__n); }
  403004:	4c 89 e6             	mov    %r12,%rsi
  403007:	bf 00 53 60 00       	mov    $0x605300,%edi
  40300c:	e8 6f ec ff ff       	callq  401c80 <_ZNSo9_M_insertImEERSoT_@plt>
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  403011:	ba 0f 00 00 00       	mov    $0xf,%edx
  403016:	be 76 40 40 00       	mov    $0x404076,%esi
      operator<<(long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long __n)
      { return _M_insert(__n); }
  40301b:	49 89 c4             	mov    %rax,%r12
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  40301e:	48 89 c7             	mov    %rax,%rdi
  403021:	e8 9a eb ff ff       	callq  401bc0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
      operator<<(long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long __n)
      { return _M_insert(__n); }
  403026:	48 89 ee             	mov    %rbp,%rsi
  403029:	4c 89 e7             	mov    %r12,%rdi
  40302c:	e8 4f ec ff ff       	callq  401c80 <_ZNSo9_M_insertImEERSoT_@plt>
  403031:	49 89 c4             	mov    %rax,%r12
   *  for more on this subject.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    endl(basic_ostream<_CharT, _Traits>& __os)
    { return flush(__os.put(__os.widen('\n'))); }
  403034:	48 8b 00             	mov    (%rax),%rax
  403037:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  40303b:	49 8b ac 04 f0 00 00 	mov    0xf0(%r12,%rax,1),%rbp
  403042:	00 

  template<typename _Facet>
    inline const _Facet&
    __check_facet(const _Facet* __f)
    {
      if (!__f)
  403043:	48 85 ed             	test   %rbp,%rbp
  403046:	0f 84 f0 00 00 00    	je     40313c <_ZN4Node20popcountBinarySelectEbm+0x28c>
       *  @return  The converted character.
      */
      char_type
      widen(char __c) const
      {
	if (_M_widen_ok)
  40304c:	80 7d 38 00          	cmpb   $0x0,0x38(%rbp)
  403050:	74 32                	je     403084 <_ZN4Node20popcountBinarySelectEbm+0x1d4>
	  return _M_widen[static_cast<unsigned char>(__c)];
  403052:	0f b6 45 43          	movzbl 0x43(%rbp),%eax
  403056:	0f be f0             	movsbl %al,%esi
  403059:	4c 89 e7             	mov    %r12,%rdi
  40305c:	e8 cf ec ff ff       	callq  401d30 <_ZNSo3putEc@plt>
   *  This manipulator simply calls the stream's @c flush() member function.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    flush(basic_ostream<_CharT, _Traits>& __os)
    { return __os.flush(); }
  403061:	48 89 c7             	mov    %rax,%rdi
  403064:	e8 97 eb ff ff       	callq  401c00 <_ZNSo5flushEv@plt>
  403069:	31 c0                	xor    %eax,%eax
  40306b:	e9 ee fe ff ff       	jmpq   402f5e <_ZN4Node20popcountBinarySelectEbm+0xae>
    pos = i*wordsize;
    ulong word = *(bitmap.begin()._M_p + i);
    ulong shift = (bitmap.size() % wordsize);
    ulong mask = (1UL << shift)-1;
    ulong maskedWord = word & mask;
    ulong wordOcc = charBit ? __builtin_popcountl(maskedWord) : __builtin_popcountl(mask) - __builtin_popcountl(maskedWord);
  403070:	f3 48 0f b8 c9       	popcnt %rcx,%rcx
  403075:	f3 48 0f b8 f7       	popcnt %rdi,%rsi
  40307a:	29 f1                	sub    %esi,%ecx
  40307c:	48 63 c9             	movslq %ecx,%rcx
  40307f:	e9 18 ff ff ff       	jmpq   402f9c <_ZN4Node20popcountBinarySelectEbm+0xec>
	this->_M_widen_init();
  403084:	48 89 ef             	mov    %rbp,%rdi
  403087:	e8 d4 e9 ff ff       	callq  401a60 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
	return this->do_widen(__c);
  40308c:	48 8b 45 00          	mov    0x0(%rbp),%rax
  403090:	be 0a 00 00 00       	mov    $0xa,%esi
  403095:	48 89 ef             	mov    %rbp,%rdi
  403098:	ff 50 30             	callq  *0x30(%rax)
  40309b:	eb b9                	jmp    403056 <_ZN4Node20popcountBinarySelectEbm+0x1a6>
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  40309d:	b2 0a                	mov    $0xa,%dl
  40309f:	be 6b 40 40 00       	mov    $0x40406b,%esi
  4030a4:	bf 00 53 60 00       	mov    $0x605300,%edi
  4030a9:	e8 12 eb ff ff       	callq  401bc0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
      operator<<(long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long __n)
      { return _M_insert(__n); }
  4030ae:	4c 89 e6             	mov    %r12,%rsi
  4030b1:	bf 00 53 60 00       	mov    $0x605300,%edi
  4030b6:	e8 c5 eb ff ff       	callq  401c80 <_ZNSo9_M_insertImEERSoT_@plt>
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  4030bb:	ba 0f 00 00 00       	mov    $0xf,%edx
  4030c0:	be 76 40 40 00       	mov    $0x404076,%esi
      operator<<(long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long __n)
      { return _M_insert(__n); }
  4030c5:	49 89 c4             	mov    %rax,%r12
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  4030c8:	48 89 c7             	mov    %rax,%rdi
  4030cb:	e8 f0 ea ff ff       	callq  401bc0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
      operator<<(long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long __n)
      { return _M_insert(__n); }
  4030d0:	48 89 ee             	mov    %rbp,%rsi
  4030d3:	4c 89 e7             	mov    %r12,%rdi
  4030d6:	e8 a5 eb ff ff       	callq  401c80 <_ZNSo9_M_insertImEERSoT_@plt>
  4030db:	49 89 c4             	mov    %rax,%r12
   *  for more on this subject.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    endl(basic_ostream<_CharT, _Traits>& __os)
    { return flush(__os.put(__os.widen('\n'))); }
  4030de:	48 8b 00             	mov    (%rax),%rax
  4030e1:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  4030e5:	49 8b ac 04 f0 00 00 	mov    0xf0(%r12,%rax,1),%rbp
  4030ec:	00 
  4030ed:	48 85 ed             	test   %rbp,%rbp
  4030f0:	74 4a                	je     40313c <_ZN4Node20popcountBinarySelectEbm+0x28c>
       *  @return  The converted character.
      */
      char_type
      widen(char __c) const
      {
	if (_M_widen_ok)
  4030f2:	80 7d 38 00          	cmpb   $0x0,0x38(%rbp)
  4030f6:	74 2b                	je     403123 <_ZN4Node20popcountBinarySelectEbm+0x273>
	  return _M_widen[static_cast<unsigned char>(__c)];
  4030f8:	0f b6 45 43          	movzbl 0x43(%rbp),%eax
  4030fc:	0f be f0             	movsbl %al,%esi
  4030ff:	4c 89 e7             	mov    %r12,%rdi
  403102:	e8 29 ec ff ff       	callq  401d30 <_ZNSo3putEc@plt>
   *  This manipulator simply calls the stream's @c flush() member function.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    flush(basic_ostream<_CharT, _Traits>& __os)
    { return __os.flush(); }
  403107:	48 89 c7             	mov    %rax,%rdi
  40310a:	e8 f1 ea ff ff       	callq  401c00 <_ZNSo5flushEv@plt>
  40310f:	31 d2                	xor    %edx,%edx
  403111:	e9 cf fe ff ff       	jmpq   402fe5 <_ZN4Node20popcountBinarySelectEbm+0x135>
    
    ulong i, pos;
    ulong wordsize = sizeof(*bitmap.begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    ulong fullWords = bitmap.size() / wordsize;
    
    for(i = 0; i < fullWords; i++) {
  403116:	45 31 d2             	xor    %r10d,%r10d
  403119:	31 c0                	xor    %eax,%eax
    }
    cout << "Occurance " << occurance << " too high! saw " << occ << endl;
}

ulong Node::popcountBinarySelect(bool charBit, ulong occurance) {
    ulong occ = 0; //counter for occurances
  40311b:	45 31 c0             	xor    %r8d,%r8d
  40311e:	e9 55 fe ff ff       	jmpq   402f78 <_ZN4Node20popcountBinarySelectEbm+0xc8>
	this->_M_widen_init();
  403123:	48 89 ef             	mov    %rbp,%rdi
  403126:	e8 35 e9 ff ff       	callq  401a60 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
	return this->do_widen(__c);
  40312b:	48 8b 45 00          	mov    0x0(%rbp),%rax
  40312f:	be 0a 00 00 00       	mov    $0xa,%esi
  403134:	48 89 ef             	mov    %rbp,%rdi
  403137:	ff 50 30             	callq  *0x30(%rax)
  40313a:	eb c0                	jmp    4030fc <_ZN4Node20popcountBinarySelectEbm+0x24c>
	__throw_bad_cast();
  40313c:	e8 9f e8 ff ff       	callq  4019e0 <_ZSt16__throw_bad_castv@plt>
  403141:	90                   	nop
  403142:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  403149:	1f 84 00 00 00 00 00 

0000000000403150 <_ZN4Node6selectEbm>:
    //a leaf has no bitmap
    bool charBit = this == parent->right;
    return parent->select(charBit, occurance);
}

uint Node::select(bool charBit, unsigned long occurance) {
  403150:	53                   	push   %rbx
  403151:	48 89 fb             	mov    %rdi,%rbx
    if(parent == nullptr) {
        //we are root
        return popcountBinarySelect(charBit, occurance);
  403154:	40 0f b6 f6          	movzbl %sil,%esi
    bool charBit = this == parent->right;
    return parent->select(charBit, occurance);
}

uint Node::select(bool charBit, unsigned long occurance) {
    if(parent == nullptr) {
  403158:	48 83 7b 30 00       	cmpq   $0x0,0x30(%rbx)
  40315d:	74 21                	je     403180 <_ZN4Node6selectEbm+0x30>
        //we are root
        return popcountBinarySelect(charBit, occurance);
    }
    int position = popcountBinarySelect(charBit, occurance);
  40315f:	e8 4c fd ff ff       	callq  402eb0 <_ZN4Node20popcountBinarySelectEbm>

    bool parentCharBit = this == parent->right;
  403164:	48 8b 7b 30          	mov    0x30(%rbx),%rdi
  403168:	31 f6                	xor    %esi,%esi
    return parent->select(parentCharBit, position+1);
  40316a:	8d 50 01             	lea    0x1(%rax),%edx
  40316d:	48 63 d2             	movslq %edx,%rdx
        //we are root
        return popcountBinarySelect(charBit, occurance);
    }
    int position = popcountBinarySelect(charBit, occurance);

    bool parentCharBit = this == parent->right;
  403170:	48 39 5f 40          	cmp    %rbx,0x40(%rdi)
    return parent->select(parentCharBit, position+1);
}
  403174:	5b                   	pop    %rbx
        //we are root
        return popcountBinarySelect(charBit, occurance);
    }
    int position = popcountBinarySelect(charBit, occurance);

    bool parentCharBit = this == parent->right;
  403175:	40 0f 94 c6          	sete   %sil
    return parent->select(parentCharBit, position+1);
  403179:	e9 d2 ff ff ff       	jmpq   403150 <_ZN4Node6selectEbm>
  40317e:	66 90                	xchg   %ax,%ax
}

uint Node::select(bool charBit, unsigned long occurance) {
    if(parent == nullptr) {
        //we are root
        return popcountBinarySelect(charBit, occurance);
  403180:	e8 2b fd ff ff       	callq  402eb0 <_ZN4Node20popcountBinarySelectEbm>
    }
    int position = popcountBinarySelect(charBit, occurance);

    bool parentCharBit = this == parent->right;
    return parent->select(parentCharBit, position+1);
}
  403185:	5b                   	pop    %rbx
  403186:	c3                   	retq   
  403187:	90                   	nop
  403188:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40318f:	00 

0000000000403190 <_ZN4Node10leafSelectEjm>:
}


uint Node::leafSelect(uint character, unsigned long occurance) {
    //a leaf has no bitmap
    bool charBit = this == parent->right;
  403190:	48 8b 47 30          	mov    0x30(%rdi),%rax
  403194:	31 f6                	xor    %esi,%esi
  403196:	48 39 78 40          	cmp    %rdi,0x40(%rax)
    return parent->select(charBit, occurance);
  40319a:	48 89 c7             	mov    %rax,%rdi
}


uint Node::leafSelect(uint character, unsigned long occurance) {
    //a leaf has no bitmap
    bool charBit = this == parent->right;
  40319d:	40 0f 94 c6          	sete   %sil
    return parent->select(charBit, occurance);
  4031a1:	e9 aa ff ff ff       	jmpq   403150 <_ZN4Node6selectEbm>
  4031a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4031ad:	00 00 00 

00000000004031b0 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j>:
#include <cmath>
#include <climits>

using namespace std;

Node::Node(vector<int>* input, int alphabetMin, int alphabetMax, Node* parentNode, uint skew)
  4031b0:	41 57                	push   %r15
  4031b2:	89 c8                	mov    %ecx,%eax
  4031b4:	41 56                	push   %r14
  4031b6:	41 55                	push   %r13
  4031b8:	41 54                	push   %r12
  4031ba:	55                   	push   %rbp
  4031bb:	53                   	push   %rbx
  4031bc:	48 89 fb             	mov    %rdi,%rbx
  4031bf:	48 83 ec 48          	sub    $0x48,%rsp
    : isLeaf(false), left(nullptr), right(nullptr), parent(parentNode) {
    
    int alphabetSize = alphabetMax - alphabetMin +1;
    if(alphabetSize == 1) {
  4031c3:	29 d0                	sub    %edx,%eax
  {
    _Bit_type * _M_p;
    unsigned int _M_offset;

    _Bit_iterator_base(_Bit_type * __x, unsigned int __y)
    : _M_p(__x), _M_offset(__y) { }
  4031c5:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
#include <cmath>
#include <climits>

using namespace std;

Node::Node(vector<int>* input, int alphabetMin, int alphabetMax, Node* parentNode, uint skew)
  4031cc:	89 54 24 08          	mov    %edx,0x8(%rsp)
  4031d0:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
  4031d4:	44 89 4c 24 04       	mov    %r9d,0x4(%rsp)
  4031d9:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%rdi)
  4031e0:	48 c7 47 10 00 00 00 	movq   $0x0,0x10(%rdi)
  4031e7:	00 
  4031e8:	c7 47 18 00 00 00 00 	movl   $0x0,0x18(%rdi)
	_Bit_iterator 	_M_start;
	_Bit_iterator 	_M_finish;
	_Bit_type* 	_M_end_of_storage;

	_Bvector_impl()
	: _Bit_alloc_type(), _M_start(), _M_finish(), _M_end_of_storage(0)
  4031ef:	48 c7 47 20 00 00 00 	movq   $0x0,0x20(%rdi)
  4031f6:	00 
    : isLeaf(false), left(nullptr), right(nullptr), parent(parentNode) {
  4031f7:	c6 47 28 00          	movb   $0x0,0x28(%rdi)
  4031fb:	4c 89 47 30          	mov    %r8,0x30(%rdi)
  4031ff:	48 c7 47 38 00 00 00 	movq   $0x0,0x38(%rdi)
  403206:	00 
  403207:	48 c7 47 40 00 00 00 	movq   $0x0,0x40(%rdi)
  40320e:	00 
    
    int alphabetSize = alphabetMax - alphabetMin +1;
    if(alphabetSize == 1) {
  40320f:	0f 84 73 02 00 00    	je     403488 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x2d8>
//        cout << "---------------" << endl;
        isLeaf = true;
        return;
    }
   
    int split = (alphabetSize-1)/skew + alphabetMin;
  403215:	31 d2                	xor    %edx,%edx
  403217:	8b 7c 24 08          	mov    0x8(%rsp),%edi
  40321b:	49 89 f6             	mov    %rsi,%r14
  40321e:	f7 74 24 04          	divl   0x4(%rsp)
  403222:	44 8d 3c 38          	lea    (%rax,%rdi,1),%r15d
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
    vector<int>* leftString = new vector<int>;
  403226:	bf 18 00 00 00       	mov    $0x18,%edi
  40322b:	e8 c0 ea ff ff       	callq  401cf0 <_Znwm@plt>
	pointer _M_start;
	pointer _M_finish;
	pointer _M_end_of_storage;

	_Vector_impl()
	: _Tp_alloc_type(), _M_start(0), _M_finish(0), _M_end_of_storage(0)
  403230:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    vector<int>* rightString = new vector<int>;
  403237:	bf 18 00 00 00       	mov    $0x18,%edi
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
    vector<int>* leftString = new vector<int>;
  40323c:	49 89 c4             	mov    %rax,%r12
  40323f:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  403246:	00 
  403247:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  40324e:	00 
    vector<int>* rightString = new vector<int>;
  40324f:	e8 9c ea ff ff       	callq  401cf0 <_Znwm@plt>
  403254:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  40325b:	49 89 c5             	mov    %rax,%r13
  40325e:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  403265:	00 
  403266:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  40326d:	00 
      typedef typename __traits_type::pointer   	pointer;

      _GLIBCXX_CONSTEXPR __normal_iterator() : _M_current(_Iterator()) { }

      explicit
      __normal_iterator(const _Iterator& __i) : _M_current(__i) { }
  40326e:	49 8b 2e             	mov    (%r14),%rbp
    
    for(auto it = input->begin(); it != input->end(); it++) {
  403271:	49 3b 6e 08          	cmp    0x8(%r14),%rbp
  403275:	75 60                	jne    4032d7 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x127>
  403277:	e9 bd 00 00 00       	jmpq   403339 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x189>
  40327c:	0f 1f 40 00          	nopl   0x0(%rax)
    data() _GLIBCXX_NOEXCEPT { }

    void
    push_back(bool __x)
    {
      if (this->_M_impl._M_finish._M_p != this->_M_impl._M_end_of_storage)
  403280:	48 3b 73 20          	cmp    0x20(%rbx),%rsi
  403284:	0f 84 76 01 00 00    	je     403400 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x250>
    }

    iterator
    operator++(int)
    {
      iterator __tmp = *this;
  40328a:	8b 4b 18             	mov    0x18(%rbx),%ecx
    : _M_p(__x), _M_offset(__y) { }

    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
  40328d:	8d 41 01             	lea    0x1(%rcx),%eax
  403290:	83 f9 3f             	cmp    $0x3f,%ecx
  403293:	0f 84 4f 01 00 00    	je     4033e8 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x238>
  403299:	89 43 18             	mov    %eax,0x18(%rbx)
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  40329c:	48 c7 c0 fe ff ff ff 	mov    $0xfffffffffffffffe,%rax
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
	*_M_p |= _M_mask;
      else
	*_M_p &= ~_M_mask;
  4032a3:	48 d3 c0             	rol    %cl,%rax
  4032a6:	48 21 06             	and    %rax,(%rsi)
       *  available.
       */
      void
      push_back(const value_type& __x)
      {
	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
  4032a9:	49 8b 44 24 08       	mov    0x8(%r12),%rax
  4032ae:	49 3b 44 24 10       	cmp    0x10(%r12),%rax
  4032b3:	0f 84 77 01 00 00    	je     403430 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x280>

#if __cplusplus >= 201103L
      template<typename _Up, typename... _Args>
        void
        construct(_Up* __p, _Args&&... __args)
	{ ::new((void *)__p) _Up(std::forward<_Args>(__args)...); }
  4032b9:	48 85 c0             	test   %rax,%rax
  4032bc:	8b 54 24 1c          	mov    0x1c(%rsp),%edx
  4032c0:	74 02                	je     4032c4 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x114>
  4032c2:	89 10                	mov    %edx,(%rax)
	  {
	    _Alloc_traits::construct(this->_M_impl, this->_M_impl._M_finish,
	                             __x);
	    ++this->_M_impl._M_finish;
  4032c4:	48 83 c0 04          	add    $0x4,%rax
  4032c8:	49 89 44 24 08       	mov    %rax,0x8(%r12)
	return *this;
      }

      __normal_iterator
      operator++(int)
      { return __normal_iterator(_M_current++); }
  4032cd:	48 83 c5 04          	add    $0x4,%rbp
  4032d1:	49 3b 6e 08          	cmp    0x8(%r14),%rbp
  4032d5:	74 62                	je     403339 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x189>
        int currentChar = *it;
  4032d7:	8b 45 00             	mov    0x0(%rbp),%eax
    data() _GLIBCXX_NOEXCEPT { }

    void
    push_back(bool __x)
    {
      if (this->_M_impl._M_finish._M_p != this->_M_impl._M_end_of_storage)
  4032da:	48 8b 73 10          	mov    0x10(%rbx),%rsi
        if(currentChar <= split) {
  4032de:	41 39 c7             	cmp    %eax,%r15d
    
    vector<int>* leftString = new vector<int>;
    vector<int>* rightString = new vector<int>;
    
    for(auto it = input->begin(); it != input->end(); it++) {
        int currentChar = *it;
  4032e1:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
        if(currentChar <= split) {
  4032e5:	7d 99                	jge    403280 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0xd0>
  4032e7:	48 3b 73 20          	cmp    0x20(%rbx),%rsi
  4032eb:	0f 84 6f 01 00 00    	je     403460 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x2b0>
    }

    iterator
    operator++(int)
    {
      iterator __tmp = *this;
  4032f1:	8b 4b 18             	mov    0x18(%rbx),%ecx
    : _M_p(__x), _M_offset(__y) { }

    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
  4032f4:	8d 41 01             	lea    0x1(%rcx),%eax
  4032f7:	83 f9 3f             	cmp    $0x3f,%ecx
  4032fa:	0f 84 d0 00 00 00    	je     4033d0 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x220>
  403300:	89 43 18             	mov    %eax,0x18(%rbx)
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  403303:	b8 01 00 00 00       	mov    $0x1,%eax
  403308:	48 d3 e0             	shl    %cl,%rax

    _Bit_reference&
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
	*_M_p |= _M_mask;
  40330b:	48 09 06             	or     %rax,(%rsi)
       *  available.
       */
      void
      push_back(const value_type& __x)
      {
	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
  40330e:	49 8b 45 08          	mov    0x8(%r13),%rax
  403312:	49 3b 45 10          	cmp    0x10(%r13),%rax
  403316:	0f 84 2c 01 00 00    	je     403448 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x298>
  40331c:	48 85 c0             	test   %rax,%rax
  40331f:	8b 54 24 1c          	mov    0x1c(%rsp),%edx
  403323:	74 02                	je     403327 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x177>
  403325:	89 10                	mov    %edx,(%rax)
	  {
	    _Alloc_traits::construct(this->_M_impl, this->_M_impl._M_finish,
	                             __x);
	    ++this->_M_impl._M_finish;
  403327:	48 83 c0 04          	add    $0x4,%rax
  40332b:	48 83 c5 04          	add    $0x4,%rbp
  40332f:	49 89 45 08          	mov    %rax,0x8(%r13)
    int rightAlphabetMax = alphabetMax;
    
    vector<int>* leftString = new vector<int>;
    vector<int>* rightString = new vector<int>;
    
    for(auto it = input->begin(); it != input->end(); it++) {
  403333:	49 3b 6e 08          	cmp    0x8(%r14),%rbp
  403337:	75 9e                	jne    4032d7 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x127>
    }

#if __cplusplus >= 201103L
    void
    shrink_to_fit()
    { _M_shrink_to_fit(); }
  403339:	48 89 df             	mov    %rbx,%rdi
  40333c:	e8 7f 06 00 00       	callq  4039c0 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv>
       *  pointed-to memory is not touched in any way.  Managing the pointer is
       *  the user's responsibility.
       */
      void
      clear() _GLIBCXX_NOEXCEPT
      { _M_erase_at_end(this->_M_impl._M_start); }
  403341:	49 8b 3e             	mov    (%r14),%rdi
      { return __n != 0 ? _M_impl.allocate(__n) : 0; }

      void
      _M_deallocate(pointer __p, size_t __n)
      {
	if (__p)
  403344:	48 85 ff             	test   %rdi,%rdi
      // _M_assign_aux.
      void
      _M_erase_at_end(pointer __pos)
      {
	std::_Destroy(__pos, this->_M_impl._M_finish, _M_get_Tp_allocator());
	this->_M_impl._M_finish = __pos;
  403347:	49 89 7e 08          	mov    %rdi,0x8(%r14)
      { return __n != 0 ? _M_impl.allocate(__n) : 0; }

      void
      _M_deallocate(pointer __p, size_t __n)
      {
	if (__p)
  40334b:	74 05                	je     403352 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x1a2>
      }

      // __p is not permitted to be a null pointer.
      void
      deallocate(pointer __p, size_type)
      { ::operator delete(__p); }
  40334d:	e8 de e6 ff ff       	callq  401a30 <_ZdlPv@plt>
//    cout << "left string:\t" << leftstr.str() << endl;
//    cout << "right string:\t" << rightstr.str() << endl;
//    cout << "---------------" << endl;
    
    input->clear();
    delete input;
  403352:	4c 89 f7             	mov    %r14,%rdi
  403355:	e8 d6 e6 ff ff       	callq  401a30 <_ZdlPv@plt>
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
    vector<int>* leftString = new vector<int>;
    vector<int>* rightString = new vector<int>;
  40335a:	49 8b 7d 00          	mov    0x0(%r13),%rdi

      // [23.2.4.2] capacity
      /**  Returns the number of elements in the %vector.  */
      size_type
      size() const _GLIBCXX_NOEXCEPT
      { return size_type(this->_M_impl._M_finish - this->_M_impl._M_start); }
  40335e:	49 8b 45 08          	mov    0x8(%r13),%rax
  403362:	48 29 f8             	sub    %rdi,%rax
  403365:	48 c1 f8 02          	sar    $0x2,%rax
//    cout << "right string:\t" << rightstr.str() << endl;
//    cout << "---------------" << endl;
    
    input->clear();
    delete input;
    if(rightString->size() > 0) {
  403369:	48 85 c0             	test   %rax,%rax
  40336c:	0f 85 29 01 00 00    	jne    40349b <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x2eb>
      { return __n != 0 ? _M_impl.allocate(__n) : 0; }

      void
      _M_deallocate(pointer __p, size_t __n)
      {
	if (__p)
  403372:	48 85 ff             	test   %rdi,%rdi
      // _M_assign_aux.
      void
      _M_erase_at_end(pointer __pos)
      {
	std::_Destroy(__pos, this->_M_impl._M_finish, _M_get_Tp_allocator());
	this->_M_impl._M_finish = __pos;
  403375:	49 89 7d 08          	mov    %rdi,0x8(%r13)
      { return __n != 0 ? _M_impl.allocate(__n) : 0; }

      void
      _M_deallocate(pointer __p, size_t __n)
      {
	if (__p)
  403379:	74 05                	je     403380 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x1d0>
  40337b:	e8 b0 e6 ff ff       	callq  401a30 <_ZdlPv@plt>
        right = new Node(rightString, rightAlphabetMin, rightAlphabetMax, this, skew);
    } else {
        rightString->clear();
        delete rightString;
  403380:	4c 89 ef             	mov    %r13,%rdi
  403383:	e8 a8 e6 ff ff       	callq  401a30 <_ZdlPv@plt>
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
    vector<int>* leftString = new vector<int>;
  403388:	49 8b 3c 24          	mov    (%r12),%rdi

      // [23.2.4.2] capacity
      /**  Returns the number of elements in the %vector.  */
      size_type
      size() const _GLIBCXX_NOEXCEPT
      { return size_type(this->_M_impl._M_finish - this->_M_impl._M_start); }
  40338c:	49 8b 44 24 08       	mov    0x8(%r12),%rax
  403391:	48 29 f8             	sub    %rdi,%rax
  403394:	48 c1 f8 02          	sar    $0x2,%rax
        right = new Node(rightString, rightAlphabetMin, rightAlphabetMax, this, skew);
    } else {
        rightString->clear();
        delete rightString;
    }
    if(leftString->size() > 0) {
  403398:	48 85 c0             	test   %rax,%rax
  40339b:	0f 85 2b 01 00 00    	jne    4034cc <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x31c>
      { return __n != 0 ? _M_impl.allocate(__n) : 0; }

      void
      _M_deallocate(pointer __p, size_t __n)
      {
	if (__p)
  4033a1:	48 85 ff             	test   %rdi,%rdi
      // _M_assign_aux.
      void
      _M_erase_at_end(pointer __pos)
      {
	std::_Destroy(__pos, this->_M_impl._M_finish, _M_get_Tp_allocator());
	this->_M_impl._M_finish = __pos;
  4033a4:	49 89 7c 24 08       	mov    %rdi,0x8(%r12)
      { return __n != 0 ? _M_impl.allocate(__n) : 0; }

      void
      _M_deallocate(pointer __p, size_t __n)
      {
	if (__p)
  4033a9:	74 05                	je     4033b0 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x200>
  4033ab:	e8 80 e6 ff ff       	callq  401a30 <_ZdlPv@plt>
        left = new Node(leftString, leftAlphabetMin, leftAlphabetMax, this, skew);
    } else {
        leftString->clear();
        delete leftString;
  4033b0:	4c 89 e7             	mov    %r12,%rdi
  4033b3:	e8 78 e6 ff ff       	callq  401a30 <_ZdlPv@plt>
    }
}
  4033b8:	48 83 c4 48          	add    $0x48,%rsp
  4033bc:	5b                   	pop    %rbx
  4033bd:	5d                   	pop    %rbp
  4033be:	41 5c                	pop    %r12
  4033c0:	41 5d                	pop    %r13
  4033c2:	41 5e                	pop    %r14
  4033c4:	41 5f                	pop    %r15
  4033c6:	c3                   	retq   
  4033c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4033ce:	00 00 
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
	  ++_M_p;
  4033d0:	48 8d 46 08          	lea    0x8(%rsi),%rax
    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
  4033d4:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%rbx)
	  ++_M_p;
  4033db:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4033df:	e9 1f ff ff ff       	jmpq   403303 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x153>
  4033e4:	0f 1f 40 00          	nopl   0x0(%rax)
  4033e8:	48 8d 46 08          	lea    0x8(%rsi),%rax
    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
  4033ec:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%rbx)
	  ++_M_p;
  4033f3:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4033f7:	e9 a0 fe ff ff       	jmpq   40329c <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0xec>
  4033fc:	0f 1f 40 00          	nopl   0x0(%rax)
    begin() const _GLIBCXX_NOEXCEPT
    { return this->_M_impl._M_start; }

    iterator
    end() _GLIBCXX_NOEXCEPT
    { return this->_M_impl._M_finish; }
  403400:	8b 43 18             	mov    0x18(%rbx),%eax
    push_back(bool __x)
    {
      if (this->_M_impl._M_finish._M_p != this->_M_impl._M_end_of_storage)
        *this->_M_impl._M_finish++ = __x;
      else
        _M_insert_aux(end(), __x);
  403403:	31 c9                	xor    %ecx,%ecx
  403405:	48 89 df             	mov    %rbx,%rdi
  403408:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
  40340d:	89 44 24 28          	mov    %eax,0x28(%rsp)
  403411:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  403416:	e8 25 01 00 00       	callq  403540 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb>
       *  available.
       */
      void
      push_back(const value_type& __x)
      {
	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
  40341b:	49 8b 44 24 08       	mov    0x8(%r12),%rax
  403420:	49 3b 44 24 10       	cmp    0x10(%r12),%rax
  403425:	0f 85 8e fe ff ff    	jne    4032b9 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x109>
  40342b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
	                             __x);
	    ++this->_M_impl._M_finish;
	  }
	else
#if __cplusplus >= 201103L
	  _M_emplace_back_aux(__x);
  403430:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
  403435:	4c 89 e7             	mov    %r12,%rdi
  403438:	e8 a3 04 00 00       	callq  4038e0 <_ZNSt6vectorIiSaIiEE19_M_emplace_back_auxIIRKiEEEvDpOT_>
  40343d:	e9 8b fe ff ff       	jmpq   4032cd <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x11d>
  403442:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  403448:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
  40344d:	4c 89 ef             	mov    %r13,%rdi
  403450:	e8 8b 04 00 00       	callq  4038e0 <_ZNSt6vectorIiSaIiEE19_M_emplace_back_auxIIRKiEEEvDpOT_>
  403455:	e9 73 fe ff ff       	jmpq   4032cd <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x11d>
  40345a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    begin() const _GLIBCXX_NOEXCEPT
    { return this->_M_impl._M_start; }

    iterator
    end() _GLIBCXX_NOEXCEPT
    { return this->_M_impl._M_finish; }
  403460:	8b 43 18             	mov    0x18(%rbx),%eax
    push_back(bool __x)
    {
      if (this->_M_impl._M_finish._M_p != this->_M_impl._M_end_of_storage)
        *this->_M_impl._M_finish++ = __x;
      else
        _M_insert_aux(end(), __x);
  403463:	b9 01 00 00 00       	mov    $0x1,%ecx
  403468:	48 89 df             	mov    %rbx,%rdi
  40346b:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
  403470:	89 44 24 38          	mov    %eax,0x38(%rsp)
  403474:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
  403479:	e8 c2 00 00 00       	callq  403540 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb>
  40347e:	e9 8b fe ff ff       	jmpq   40330e <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x15e>
  403483:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    
    int alphabetSize = alphabetMax - alphabetMin +1;
    if(alphabetSize == 1) {
//        cout << "LEAF:\t\t" << (*input)[0] << endl;
//        cout << "---------------" << endl;
        isLeaf = true;
  403488:	c6 47 28 01          	movb   $0x1,0x28(%rdi)
        left = new Node(leftString, leftAlphabetMin, leftAlphabetMax, this, skew);
    } else {
        leftString->clear();
        delete leftString;
    }
}
  40348c:	48 83 c4 48          	add    $0x48,%rsp
  403490:	5b                   	pop    %rbx
  403491:	5d                   	pop    %rbp
  403492:	41 5c                	pop    %r12
  403494:	41 5d                	pop    %r13
  403496:	41 5e                	pop    %r14
  403498:	41 5f                	pop    %r15
  40349a:	c3                   	retq   
//    cout << "---------------" << endl;
    
    input->clear();
    delete input;
    if(rightString->size() > 0) {
        right = new Node(rightString, rightAlphabetMin, rightAlphabetMax, this, skew);
  40349b:	bf 48 00 00 00       	mov    $0x48,%edi
  4034a0:	e8 4b e8 ff ff       	callq  401cf0 <_Znwm@plt>
  4034a5:	44 8b 4c 24 04       	mov    0x4(%rsp),%r9d
    }
   
    int split = (alphabetSize-1)/skew + alphabetMin;
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
  4034aa:	41 8d 57 01          	lea    0x1(%r15),%edx
//    cout << "---------------" << endl;
    
    input->clear();
    delete input;
    if(rightString->size() > 0) {
        right = new Node(rightString, rightAlphabetMin, rightAlphabetMax, this, skew);
  4034ae:	49 89 d8             	mov    %rbx,%r8
  4034b1:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
  4034b5:	4c 89 ee             	mov    %r13,%rsi
  4034b8:	48 89 c7             	mov    %rax,%rdi
  4034bb:	48 89 c5             	mov    %rax,%rbp
  4034be:	e8 ed fc ff ff       	callq  4031b0 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j>
  4034c3:	48 89 6b 40          	mov    %rbp,0x40(%rbx)
  4034c7:	e9 bc fe ff ff       	jmpq   403388 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x1d8>
    } else {
        rightString->clear();
        delete rightString;
    }
    if(leftString->size() > 0) {
        left = new Node(leftString, leftAlphabetMin, leftAlphabetMax, this, skew);
  4034cc:	bf 48 00 00 00       	mov    $0x48,%edi
  4034d1:	e8 1a e8 ff ff       	callq  401cf0 <_Znwm@plt>
  4034d6:	44 8b 4c 24 04       	mov    0x4(%rsp),%r9d
  4034db:	49 89 d8             	mov    %rbx,%r8
  4034de:	44 89 f9             	mov    %r15d,%ecx
  4034e1:	8b 54 24 08          	mov    0x8(%rsp),%edx
  4034e5:	4c 89 e6             	mov    %r12,%rsi
  4034e8:	48 89 c7             	mov    %rax,%rdi
  4034eb:	48 89 c5             	mov    %rax,%rbp
  4034ee:	e8 bd fc ff ff       	callq  4031b0 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j>
  4034f3:	48 89 6b 38          	mov    %rbp,0x38(%rbx)
    } else {
        leftString->clear();
        delete leftString;
    }
}
  4034f7:	48 83 c4 48          	add    $0x48,%rsp
  4034fb:	5b                   	pop    %rbx
  4034fc:	5d                   	pop    %rbp
  4034fd:	41 5c                	pop    %r12
  4034ff:	41 5d                	pop    %r13
  403501:	41 5e                	pop    %r14
  403503:	41 5f                	pop    %r15
  403505:	c3                   	retq   
  403506:	49 89 c4             	mov    %rax,%r12
    } else {
        rightString->clear();
        delete rightString;
    }
    if(leftString->size() > 0) {
        left = new Node(leftString, leftAlphabetMin, leftAlphabetMax, this, skew);
  403509:	48 89 ef             	mov    %rbp,%rdi
  40350c:	c5 f8 77             	vzeroupper 
  40350f:	e8 1c e5 ff ff       	callq  401a30 <_ZdlPv@plt>
  403514:	4c 89 e5             	mov    %r12,%rbp
	__x._M_impl._M_finish = _Bit_iterator();
	__x._M_impl._M_end_of_storage = 0;
      }
#endif

      ~_Bvector_base()
  403517:	48 8b 3b             	mov    (%rbx),%rdi
      { return _M_impl.allocate(_S_nword(__n)); }

      void
      _M_deallocate()
      {
	if (_M_impl._M_start._M_p)
  40351a:	48 85 ff             	test   %rdi,%rdi
  40351d:	74 05                	je     403524 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x374>
  40351f:	e8 0c e5 ff ff       	callq  401a30 <_ZdlPv@plt>
  403524:	48 89 ef             	mov    %rbp,%rdi
  403527:	e8 d4 e7 ff ff       	callq  401d00 <_Unwind_Resume@plt>
  40352c:	48 89 c5             	mov    %rax,%rbp
  40352f:	c5 f8 77             	vzeroupper 
  403532:	eb e3                	jmp    403517 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x367>
  403534:	eb d0                	jmp    403506 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j+0x356>
  403536:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40353d:	00 00 00 

0000000000403540 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb>:
	  }
      }

  template<typename _Alloc>
    void
    vector<bool, _Alloc>::
  403540:	41 57                	push   %r15
  403542:	41 56                	push   %r14
  403544:	41 55                	push   %r13
  403546:	41 89 cd             	mov    %ecx,%r13d
  403549:	41 54                	push   %r12
  40354b:	41 89 d4             	mov    %edx,%r12d
  40354e:	55                   	push   %rbp
  40354f:	48 89 fd             	mov    %rdi,%rbp
  403552:	53                   	push   %rbx
  403553:	48 89 f3             	mov    %rsi,%rbx
  403556:	48 83 ec 38          	sub    $0x38,%rsp
    _M_insert_aux(iterator __position, bool __x)
    {
      if (this->_M_impl._M_finish._M_p != this->_M_impl._M_end_of_storage)
  40355a:	4c 8b 5f 10          	mov    0x10(%rdi),%r11
	  }
      }

  template<typename _Alloc>
    void
    vector<bool, _Alloc>::
  40355e:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
  403563:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
    _M_insert_aux(iterator __position, bool __x)
    {
      if (this->_M_impl._M_finish._M_p != this->_M_impl._M_end_of_storage)
  403568:	4c 3b 5f 20          	cmp    0x20(%rdi),%r11
  40356c:	0f 84 14 01 00 00    	je     403686 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x146>
    }

    iterator
    operator+(difference_type __i) const
    {
      iterator __tmp = *this;
  403572:	44 8b 77 18          	mov    0x18(%rdi),%r14d
      template<typename _BI1, typename _BI2>
        static _BI2
        __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
        {
	  typename iterator_traits<_BI1>::difference_type __n;
	  for (__n = __last - __first; __n > 0; --__n)
  403576:	4d 89 d9             	mov    %r11,%r9
  403579:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    }

    void
    _M_incr(ptrdiff_t __i)
    {
      difference_type __n = __i + _M_offset;
  40357f:	44 89 f0             	mov    %r14d,%eax
  403582:	48 8d 50 01          	lea    0x1(%rax),%rdx
      _M_p += __n / int(_S_word_bit);
  403586:	48 89 d1             	mov    %rdx,%rcx
      if (__n < 0)
	{
	  __n += int(_S_word_bit);
	  --_M_p;
	}
      _M_offset = static_cast<unsigned int>(__n);
  403589:	83 e2 3f             	and    $0x3f,%edx

    void
    _M_incr(ptrdiff_t __i)
    {
      difference_type __n = __i + _M_offset;
      _M_p += __n / int(_S_word_bit);
  40358c:	48 c1 f9 06          	sar    $0x6,%rcx
  403590:	49 8d 3c cb          	lea    (%r11,%rcx,8),%rdi
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  403594:	4c 89 d9             	mov    %r11,%rcx
  403597:	48 29 f1             	sub    %rsi,%rcx
	    + __x._M_offset - __y._M_offset);
  40359a:	48 8d 34 c8          	lea    (%rax,%rcx,8),%rsi
  40359e:	44 89 e0             	mov    %r12d,%eax
  4035a1:	48 29 c6             	sub    %rax,%rsi
  4035a4:	44 89 f0             	mov    %r14d,%eax
  4035a7:	48 85 f6             	test   %rsi,%rsi
  4035aa:	7f 32                	jg     4035de <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x9e>
  4035ac:	eb 72                	jmp    403620 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0xe0>
  4035ae:	66 90                	xchg   %ax,%ax
    }

    void
    _M_bump_down()
    {
      if (_M_offset-- == 0)
  4035b0:	83 e8 01             	sub    $0x1,%eax
  4035b3:	4d 89 d0             	mov    %r10,%r8
  4035b6:	89 c1                	mov    %eax,%ecx
  4035b8:	49 d3 e0             	shl    %cl,%r8
  4035bb:	85 d2                	test   %edx,%edx
  4035bd:	74 3a                	je     4035f9 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0xb9>
  4035bf:	83 ea 01             	sub    $0x1,%edx
  4035c2:	4d 89 d7             	mov    %r10,%r15
  4035c5:	89 d1                	mov    %edx,%ecx
  4035c7:	49 d3 e7             	shl    %cl,%r15
    { return !!(*_M_p & _M_mask); }

    _Bit_reference&
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
  4035ca:	4d 85 01             	test   %r8,(%r9)
  4035cd:	4c 89 f9             	mov    %r15,%rcx
  4035d0:	75 3f                	jne    403611 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0xd1>
	*_M_p |= _M_mask;
      else
	*_M_p &= ~_M_mask;
  4035d2:	48 f7 d1             	not    %rcx
  4035d5:	48 21 0f             	and    %rcx,(%rdi)
  4035d8:	48 83 ee 01          	sub    $0x1,%rsi
  4035dc:	74 42                	je     403620 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0xe0>
    }

    void
    _M_bump_down()
    {
      if (_M_offset-- == 0)
  4035de:	85 c0                	test   %eax,%eax
  4035e0:	75 ce                	jne    4035b0 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x70>
	{
	  _M_offset = int(_S_word_bit) - 1;
	  --_M_p;
  4035e2:	49 83 e9 08          	sub    $0x8,%r9
    }

    void
    _M_bump_down()
    {
      if (_M_offset-- == 0)
  4035e6:	85 d2                	test   %edx,%edx
	{
	  _M_offset = int(_S_word_bit) - 1;
  4035e8:	b8 3f 00 00 00       	mov    $0x3f,%eax
	  --_M_p;
  4035ed:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
  4035f4:	00 00 80 
    }

    void
    _M_bump_down()
    {
      if (_M_offset-- == 0)
  4035f7:	75 c6                	jne    4035bf <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x7f>
	{
	  _M_offset = int(_S_word_bit) - 1;
	  --_M_p;
  4035f9:	48 83 ef 08          	sub    $0x8,%rdi
    { return !!(*_M_p & _M_mask); }

    _Bit_reference&
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
  4035fd:	4d 85 01             	test   %r8,(%r9)
    void
    _M_bump_down()
    {
      if (_M_offset-- == 0)
	{
	  _M_offset = int(_S_word_bit) - 1;
  403600:	ba 3f 00 00 00       	mov    $0x3f,%edx
	  --_M_p;
  403605:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  40360c:	00 00 80 
    { return !!(*_M_p & _M_mask); }

    _Bit_reference&
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
  40360f:	74 c1                	je     4035d2 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x92>
	*_M_p |= _M_mask;
  403611:	48 09 0f             	or     %rcx,(%rdi)
  403614:	48 83 ee 01          	sub    $0x1,%rsi
  403618:	75 c4                	jne    4035de <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x9e>
  40361a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  403620:	b8 01 00 00 00       	mov    $0x1,%eax
  403625:	44 89 e1             	mov    %r12d,%ecx
  403628:	48 d3 e0             	shl    %cl,%rax
    { return !!(*_M_p & _M_mask); }

    _Bit_reference&
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
  40362b:	45 84 ed             	test   %r13b,%r13b
  40362e:	75 28                	jne    403658 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x118>
	*_M_p |= _M_mask;
      else
	*_M_p &= ~_M_mask;
  403630:	48 f7 d0             	not    %rax
  403633:	48 21 03             	and    %rax,(%rbx)
    : _M_p(__x), _M_offset(__y) { }

    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
  403636:	41 8d 46 01          	lea    0x1(%r14),%eax
  40363a:	41 83 fe 3f          	cmp    $0x3f,%r14d
  40363e:	89 45 18             	mov    %eax,0x18(%rbp)
  403641:	74 25                	je     403668 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x128>
	  this->_M_impl._M_finish = std::copy(__position, end(), __i);
	  this->_M_deallocate();
	  this->_M_impl._M_end_of_storage = __q + _S_nword(__len);
	  this->_M_impl._M_start = iterator(__q, 0);
	}
    }
  403643:	48 83 c4 38          	add    $0x38,%rsp
  403647:	5b                   	pop    %rbx
  403648:	5d                   	pop    %rbp
  403649:	41 5c                	pop    %r12
  40364b:	41 5d                	pop    %r13
  40364d:	41 5e                	pop    %r14
  40364f:	41 5f                	pop    %r15
  403651:	c3                   	retq   
  403652:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

    _Bit_reference&
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
	*_M_p |= _M_mask;
  403658:	48 09 03             	or     %rax,(%rbx)
    : _M_p(__x), _M_offset(__y) { }

    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
  40365b:	41 8d 46 01          	lea    0x1(%r14),%eax
  40365f:	41 83 fe 3f          	cmp    $0x3f,%r14d
  403663:	89 45 18             	mov    %eax,0x18(%rbp)
  403666:	75 db                	jne    403643 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x103>
	{
	  _M_offset = 0;
	  ++_M_p;
  403668:	49 83 c3 08          	add    $0x8,%r11
    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
  40366c:	c7 45 18 00 00 00 00 	movl   $0x0,0x18(%rbp)
	  ++_M_p;
  403673:	4c 89 5d 10          	mov    %r11,0x10(%rbp)
  403677:	48 83 c4 38          	add    $0x38,%rsp
  40367b:	5b                   	pop    %rbx
  40367c:	5d                   	pop    %rbp
  40367d:	41 5c                	pop    %r12
  40367f:	41 5d                	pop    %r13
  403681:	41 5e                	pop    %r14
  403683:	41 5f                	pop    %r15
  403685:	c3                   	retq   
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  403686:	4c 2b 1f             	sub    (%rdi),%r11
	    + __x._M_offset - __y._M_offset);
  403689:	8b 47 18             	mov    0x18(%rdi),%eax
  40368c:	8b 57 08             	mov    0x8(%rdi),%edx
  40368f:	4a 8d 04 d8          	lea    (%rax,%r11,8),%rax
  403693:	48 29 d0             	sub    %rdx,%rax
    _M_insert_aux(iterator __position, bool __x);

    size_type
    _M_check_len(size_type __n, const char* __s) const
    {
      if (max_size() - size() < __n)
  403696:	48 ba c0 ff ff ff ff 	movabs $0x7fffffffffffffc0,%rdx
  40369d:	ff ff 7f 
  4036a0:	48 39 d0             	cmp    %rdx,%rax
  4036a3:	0f 84 fe 01 00 00    	je     4038a7 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x367>
    max(const _Tp& __a, const _Tp& __b)
    {
      // concept requirements
      __glibcxx_function_requires(_LessThanComparableConcept<_Tp>)
      //return  __a < __b ? __b : __a;
      if (__a < __b)
  4036a9:	48 c7 44 24 08 08 00 	movq   $0x8,0x8(%rsp)
  4036b0:	00 00 
  4036b2:	48 85 c0             	test   %rax,%rax
  4036b5:	49 89 f6             	mov    %rsi,%r14
  4036b8:	74 1c                	je     4036d6 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x196>
	__throw_length_error(__N(__s));

      const size_type __len = size() + std::max(size(), __n);
  4036ba:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
      return (__len < size() || __len > max_size()) ? max_size() : __len;
  4036be:	48 39 c8             	cmp    %rcx,%rax
  4036c1:	0f 86 ea 01 00 00    	jbe    4038b1 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x371>
  4036c7:	48 b8 f8 ff ff ff ff 	movabs $0xffffffffffffff8,%rax
  4036ce:	ff ff 0f 
  4036d1:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
      allocate(size_type __n, const void* = 0)
      { 
	if (__n > this->max_size())
	  std::__throw_bad_alloc();

	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
  4036d6:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  4036db:	e8 10 e6 ff ff       	callq  401cf0 <_Znwm@plt>
    {
      template<typename _Tp>
        static _Tp*
        __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
        {
	  const ptrdiff_t _Num = __last - __first;
  4036e0:	48 89 d9             	mov    %rbx,%rcx
	  if (_Num)
  4036e3:	45 31 c0             	xor    %r8d,%r8d
  4036e6:	49 89 c7             	mov    %rax,%r15
    { this->assign(__l.begin(), __l.end()); }
#endif

    iterator
    begin() _GLIBCXX_NOEXCEPT
    { return this->_M_impl._M_start; }
  4036e9:	48 8b 45 00          	mov    0x0(%rbp),%rax
    {
      template<typename _Tp>
        static _Tp*
        __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
        {
	  const ptrdiff_t _Num = __last - __first;
  4036ed:	48 29 c1             	sub    %rax,%rcx
	  if (_Num)
  4036f0:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    {
      template<typename _Tp>
        static _Tp*
        __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
        {
	  const ptrdiff_t _Num = __last - __first;
  4036f5:	48 c1 f9 03          	sar    $0x3,%rcx
	  if (_Num)
  4036f9:	48 85 c9             	test   %rcx,%rcx
  4036fc:	0f 85 0d 01 00 00    	jne    40380f <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x2cf>
	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
	  return __result + _Num;
  403702:	4b 8d 04 07          	lea    (%r15,%r8,1),%rax

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
	    + __x._M_offset - __y._M_offset);
  403706:	44 89 e6             	mov    %r12d,%esi
      template<typename _II, typename _OI>
        static _OI
        __copy_m(_II __first, _II __last, _OI __result)
        { 
	  typedef typename iterator_traits<_II>::difference_type _Distance;
	  for(_Distance __n = __last - __first; __n > 0; --__n)
  403709:	48 85 f6             	test   %rsi,%rsi
  40370c:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
  403711:	0f 84 7d 01 00 00    	je     403894 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x354>
  403717:	49 89 f0             	mov    %rsi,%r8
  40371a:	49 89 da             	mov    %rbx,%r10
  40371d:	31 d2                	xor    %edx,%edx
  40371f:	31 f6                	xor    %esi,%esi
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  403721:	41 b9 01 00 00 00    	mov    $0x1,%r9d
  403727:	eb 33                	jmp    40375c <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x21c>
  403729:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
	*_M_p |= _M_mask;
      else
	*_M_p &= ~_M_mask;
  403730:	48 89 f9             	mov    %rdi,%rcx
  403733:	48 f7 d1             	not    %rcx
  403736:	48 21 08             	and    %rcx,(%rax)
    : _M_p(__x), _M_offset(__y) { }

    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
  403739:	8d 7e 01             	lea    0x1(%rsi),%edi
  40373c:	83 fe 3f             	cmp    $0x3f,%esi
  40373f:	74 48                	je     403789 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x249>
  403741:	8d 4a 01             	lea    0x1(%rdx),%ecx
  403744:	83 fa 3f             	cmp    $0x3f,%edx
  403747:	74 2d                	je     403776 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x236>
  403749:	8d 72 02             	lea    0x2(%rdx),%esi
  40374c:	4d 89 cb             	mov    %r9,%r11
  40374f:	89 ca                	mov    %ecx,%edx
  403751:	49 d3 e3             	shl    %cl,%r11
  403754:	49 83 e8 01          	sub    $0x1,%r8
  403758:	74 37                	je     403791 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x251>
  40375a:	89 fe                	mov    %edi,%esi
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  40375c:	89 d1                	mov    %edx,%ecx
  40375e:	4c 89 cf             	mov    %r9,%rdi
    _Bit_const_iterator(const _Bit_iterator& __x)
    : _Bit_iterator_base(__x._M_p, __x._M_offset) { }

    const_reference
    operator*() const
    { return _Bit_reference(_M_p, 1UL << _M_offset); }
  403761:	4d 89 cb             	mov    %r9,%r11
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  403764:	48 d3 e7             	shl    %cl,%rdi
    _Bit_const_iterator(const _Bit_iterator& __x)
    : _Bit_iterator_base(__x._M_p, __x._M_offset) { }

    const_reference
    operator*() const
    { return _Bit_reference(_M_p, 1UL << _M_offset); }
  403767:	89 f1                	mov    %esi,%ecx
  403769:	49 d3 e3             	shl    %cl,%r11
    { return !!(*_M_p & _M_mask); }

    _Bit_reference&
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
  40376c:	4d 85 1a             	test   %r11,(%r10)
  40376f:	74 bf                	je     403730 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x1f0>
	*_M_p |= _M_mask;
  403771:	48 09 38             	or     %rdi,(%rax)
  403774:	eb c3                	jmp    403739 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x1f9>
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
	  ++_M_p;
  403776:	48 83 c0 08          	add    $0x8,%rax
  40377a:	41 bb 01 00 00 00    	mov    $0x1,%r11d
  403780:	be 01 00 00 00       	mov    $0x1,%esi
    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
  403785:	31 d2                	xor    %edx,%edx
  403787:	eb cb                	jmp    403754 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x214>
	  ++_M_p;
  403789:	49 83 c2 08          	add    $0x8,%r10
    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
  40378d:	31 ff                	xor    %edi,%edi
  40378f:	eb b0                	jmp    403741 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x201>
    : _M_p(__x), _M_offset(__y) { }

    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
  403791:	83 fa 3f             	cmp    $0x3f,%edx
  403794:	48 89 c7             	mov    %rax,%rdi
  403797:	0f 84 ec 00 00 00    	je     403889 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x349>
    { return !!(*_M_p & _M_mask); }

    _Bit_reference&
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
  40379d:	45 84 ed             	test   %r13b,%r13b
  4037a0:	0f 85 97 00 00 00    	jne    40383d <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x2fd>
	*_M_p |= _M_mask;
      else
	*_M_p &= ~_M_mask;
  4037a6:	49 f7 d3             	not    %r11
  4037a9:	4c 21 18             	and    %r11,(%rax)
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  4037ac:	48 8b 45 10          	mov    0x10(%rbp),%rax
	    + __x._M_offset - __y._M_offset);
  4037b0:	8b 55 18             	mov    0x18(%rbp),%edx
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  4037b3:	48 29 d8             	sub    %rbx,%rax
	    + __x._M_offset - __y._M_offset);
  4037b6:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
  4037ba:	48 2b 44 24 18       	sub    0x18(%rsp),%rax
  4037bf:	48 85 c0             	test   %rax,%rax
  4037c2:	0f 8e 8d 00 00 00    	jle    403855 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x315>
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  4037c8:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  4037ce:	eb 24                	jmp    4037f4 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x2b4>
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
	*_M_p |= _M_mask;
      else
	*_M_p &= ~_M_mask;
  4037d0:	48 f7 d2             	not    %rdx
  4037d3:	48 21 17             	and    %rdx,(%rdi)
    : _M_p(__x), _M_offset(__y) { }

    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
  4037d6:	41 8d 4c 24 01       	lea    0x1(%r12),%ecx
  4037db:	41 83 fc 3f          	cmp    $0x3f,%r12d
  4037df:	74 6c                	je     40384d <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x30d>
  4037e1:	8d 56 01             	lea    0x1(%rsi),%edx
  4037e4:	83 fe 3f             	cmp    $0x3f,%esi
  4037e7:	74 5c                	je     403845 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x305>
  4037e9:	48 83 e8 01          	sub    $0x1,%rax
  4037ed:	74 68                	je     403857 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x317>
  4037ef:	89 d6                	mov    %edx,%esi
  4037f1:	41 89 cc             	mov    %ecx,%r12d
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  4037f4:	89 f1                	mov    %esi,%ecx
  4037f6:	4c 89 c2             	mov    %r8,%rdx
  4037f9:	4c 89 c3             	mov    %r8,%rbx
  4037fc:	48 d3 e2             	shl    %cl,%rdx
  4037ff:	44 89 e1             	mov    %r12d,%ecx
  403802:	48 d3 e3             	shl    %cl,%rbx
    { return !!(*_M_p & _M_mask); }

    _Bit_reference&
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
  403805:	49 85 1e             	test   %rbx,(%r14)
  403808:	74 c6                	je     4037d0 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x290>
	*_M_p |= _M_mask;
  40380a:	48 09 17             	or     %rdx,(%rdi)
  40380d:	eb c7                	jmp    4037d6 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x296>
        static _Tp*
        __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
        {
	  const ptrdiff_t _Num = __last - __first;
	  if (_Num)
	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
  40380f:	4c 8d 04 cd 00 00 00 	lea    0x0(,%rcx,8),%r8
  403816:	00 
  403817:	48 89 c6             	mov    %rax,%rsi
  40381a:	4c 89 ff             	mov    %r15,%rdi
  40381d:	4c 89 c2             	mov    %r8,%rdx
  403820:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  403825:	e8 a6 e3 ff ff       	callq  401bd0 <memmove@plt>
  40382a:	48 8b 45 00          	mov    0x0(%rbp),%rax
  40382e:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
  403833:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  403838:	e9 c5 fe ff ff       	jmpq   403702 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x1c2>
  40383d:	4c 09 18             	or     %r11,(%rax)
  403840:	e9 67 ff ff ff       	jmpq   4037ac <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x26c>
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
	  ++_M_p;
  403845:	48 83 c7 08          	add    $0x8,%rdi
    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
  403849:	31 d2                	xor    %edx,%edx
  40384b:	eb 9c                	jmp    4037e9 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x2a9>
	  ++_M_p;
  40384d:	49 83 c6 08          	add    $0x8,%r14
    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
  403851:	31 c9                	xor    %ecx,%ecx
  403853:	eb 8c                	jmp    4037e1 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x2a1>
      template<typename _II, typename _OI>
        static _OI
        __copy_m(_II __first, _II __last, _OI __result)
        { 
	  typedef typename iterator_traits<_II>::difference_type _Distance;
	  for(_Distance __n = __last - __first; __n > 0; --__n)
  403855:	89 f2                	mov    %esi,%edx
	    _M_check_len(size_type(1), "vector<bool>::_M_insert_aux");
	  _Bit_type * __q = this->_M_allocate(__len);
	  iterator __i = _M_copy_aligned(begin(), __position,
					 iterator(__q, 0));
	  *__i++ = __x;
	  this->_M_impl._M_finish = std::copy(__position, end(), __i);
  403857:	48 89 7d 10          	mov    %rdi,0x10(%rbp)
      { return _M_impl.allocate(_S_nword(__n)); }

      void
      _M_deallocate()
      {
	if (_M_impl._M_start._M_p)
  40385b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  403860:	89 55 18             	mov    %edx,0x18(%rbp)
  403863:	48 85 ff             	test   %rdi,%rdi
  403866:	74 05                	je     40386d <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x32d>
      }

      // __p is not permitted to be a null pointer.
      void
      deallocate(pointer __p, size_type)
      { ::operator delete(__p); }
  403868:	e8 c3 e1 ff ff       	callq  401a30 <_ZdlPv@plt>
	  this->_M_deallocate();
	  this->_M_impl._M_end_of_storage = __q + _S_nword(__len);
  40386d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
	  this->_M_impl._M_start = iterator(__q, 0);
  403872:	4c 89 7d 00          	mov    %r15,0x0(%rbp)
  403876:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%rbp)
	  iterator __i = _M_copy_aligned(begin(), __position,
					 iterator(__q, 0));
	  *__i++ = __x;
	  this->_M_impl._M_finish = std::copy(__position, end(), __i);
	  this->_M_deallocate();
	  this->_M_impl._M_end_of_storage = __q + _S_nword(__len);
  40387d:	4c 01 f8             	add    %r15,%rax
  403880:	48 89 45 20          	mov    %rax,0x20(%rbp)
  403884:	e9 ba fd ff ff       	jmpq   403643 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x103>
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
	  ++_M_p;
  403889:	48 8d 78 08          	lea    0x8(%rax),%rdi
    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
  40388d:	31 f6                	xor    %esi,%esi
  40388f:	e9 09 ff ff ff       	jmpq   40379d <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x25d>
  403894:	48 89 c7             	mov    %rax,%rdi
  403897:	41 bb 01 00 00 00    	mov    $0x1,%r11d
  40389d:	be 01 00 00 00       	mov    $0x1,%esi
  4038a2:	e9 f6 fe ff ff       	jmpq   40379d <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x25d>

    size_type
    _M_check_len(size_type __n, const char* __s) const
    {
      if (max_size() - size() < __n)
	__throw_length_error(__N(__s));
  4038a7:	bf 86 40 40 00       	mov    $0x404086,%edi
  4038ac:	e8 1f e1 ff ff       	callq  4019d0 <_ZSt20__throw_length_errorPKc@plt>
  4038b1:	48 39 d1             	cmp    %rdx,%rcx
  4038b4:	48 89 d0             	mov    %rdx,%rax
  4038b7:	48 0f 46 c1          	cmovbe %rcx,%rax
  4038bb:	48 83 c0 3f          	add    $0x3f,%rax
  4038bf:	48 c1 e8 06          	shr    $0x6,%rax
  4038c3:	48 c1 e0 03          	shl    $0x3,%rax
  4038c7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4038cc:	e9 05 fe ff ff       	jmpq   4036d6 <_ZNSt6vectorIbSaIbEE13_M_insert_auxESt13_Bit_iteratorb+0x196>
  4038d1:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4038d8:	00 00 00 
  4038db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004038e0 <_ZNSt6vectorIiSaIiEE19_M_emplace_back_auxIIRKiEEEvDpOT_>:

#if __cplusplus >= 201103L
  template<typename _Tp, typename _Alloc>
    template<typename... _Args>
      void
      vector<_Tp, _Alloc>::
  4038e0:	41 55                	push   %r13
  4038e2:	41 54                	push   %r12
    max(const _Tp& __a, const _Tp& __b)
    {
      // concept requirements
      __glibcxx_function_requires(_LessThanComparableConcept<_Tp>)
      //return  __a < __b ? __b : __a;
      if (__a < __b)
  4038e4:	41 bc 04 00 00 00    	mov    $0x4,%r12d
  4038ea:	55                   	push   %rbp
  4038eb:	53                   	push   %rbx
  4038ec:	48 89 fb             	mov    %rdi,%rbx
  4038ef:	48 83 ec 18          	sub    $0x18,%rsp

      // [23.2.4.2] capacity
      /**  Returns the number of elements in the %vector.  */
      size_type
      size() const _GLIBCXX_NOEXCEPT
      { return size_type(this->_M_impl._M_finish - this->_M_impl._M_start); }
  4038f3:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  4038f7:	48 2b 17             	sub    (%rdi),%rdx
  4038fa:	48 c1 fa 02          	sar    $0x2,%rdx
  4038fe:	48 85 d2             	test   %rdx,%rdx
  403901:	75 7d                	jne    403980 <_ZNSt6vectorIiSaIiEE19_M_emplace_back_auxIIRKiEEEvDpOT_+0xa0>
      allocate(size_type __n, const void* = 0)
      { 
	if (__n > this->max_size())
	  std::__throw_bad_alloc();

	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
  403903:	4c 89 e7             	mov    %r12,%rdi
  403906:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  40390b:	e8 e0 e3 ff ff       	callq  401cf0 <_Znwm@plt>
  403910:	48 8b 0b             	mov    (%rbx),%rcx
  403913:	48 89 c5             	mov    %rax,%rbp
  403916:	48 8b 43 08          	mov    0x8(%rbx),%rax

#if __cplusplus >= 201103L
      template<typename _Up, typename... _Args>
        void
        construct(_Up* __p, _Args&&... __args)
	{ ::new((void *)__p) _Up(std::forward<_Args>(__args)...); }
  40391a:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  40391f:	49 89 ed             	mov    %rbp,%r13
  403922:	48 29 c8             	sub    %rcx,%rax
  403925:	48 c1 f8 02          	sar    $0x2,%rax
  403929:	8b 36                	mov    (%rsi),%esi
	pointer __new_start(this->_M_allocate(__len));
	pointer __new_finish(__new_start);
	__try
	  {
	    _Alloc_traits::construct(this->_M_impl, __new_start + size(),
				     std::forward<_Args>(__args)...);
  40392b:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  403932:	00 
  403933:	49 01 d5             	add    %rdx,%r13
  403936:	74 04                	je     40393c <_ZNSt6vectorIiSaIiEE19_M_emplace_back_auxIIRKiEEEvDpOT_+0x5c>
  403938:	41 89 75 00          	mov    %esi,0x0(%r13)
      template<typename _Tp>
        static _Tp*
        __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
        {
	  const ptrdiff_t _Num = __last - __first;
	  if (_Num)
  40393c:	48 85 c0             	test   %rax,%rax
  40393f:	48 89 cf             	mov    %rcx,%rdi
  403942:	74 0e                	je     403952 <_ZNSt6vectorIiSaIiEE19_M_emplace_back_auxIIRKiEEEvDpOT_+0x72>
	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
  403944:	48 89 ef             	mov    %rbp,%rdi
  403947:	48 89 ce             	mov    %rcx,%rsi
  40394a:	e8 81 e2 ff ff       	callq  401bd0 <memmove@plt>
  40394f:	48 8b 3b             	mov    (%rbx),%rdi
	    __new_finish
	      = std::__uninitialized_move_if_noexcept_a
	      (this->_M_impl._M_start, this->_M_impl._M_finish,
	       __new_start, _M_get_Tp_allocator());

	    ++__new_finish;
  403952:	49 83 c5 04          	add    $0x4,%r13
      { return __n != 0 ? _M_impl.allocate(__n) : 0; }

      void
      _M_deallocate(pointer __p, size_t __n)
      {
	if (__p)
  403956:	48 85 ff             	test   %rdi,%rdi
  403959:	74 05                	je     403960 <_ZNSt6vectorIiSaIiEE19_M_emplace_back_auxIIRKiEEEvDpOT_+0x80>
      }

      // __p is not permitted to be a null pointer.
      void
      deallocate(pointer __p, size_type)
      { ::operator delete(__p); }
  40395b:	e8 d0 e0 ff ff       	callq  401a30 <_ZdlPv@plt>
	std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
		      _M_get_Tp_allocator());
	_M_deallocate(this->_M_impl._M_start,
		      this->_M_impl._M_end_of_storage
		      - this->_M_impl._M_start);
	this->_M_impl._M_start = __new_start;
  403960:	48 89 2b             	mov    %rbp,(%rbx)
	this->_M_impl._M_finish = __new_finish;
	this->_M_impl._M_end_of_storage = __new_start + __len;
  403963:	4c 01 e5             	add    %r12,%rbp
		      _M_get_Tp_allocator());
	_M_deallocate(this->_M_impl._M_start,
		      this->_M_impl._M_end_of_storage
		      - this->_M_impl._M_start);
	this->_M_impl._M_start = __new_start;
	this->_M_impl._M_finish = __new_finish;
  403966:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
	this->_M_impl._M_end_of_storage = __new_start + __len;
  40396a:	48 89 6b 10          	mov    %rbp,0x10(%rbx)
      }
  40396e:	48 83 c4 18          	add    $0x18,%rsp
  403972:	5b                   	pop    %rbx
  403973:	5d                   	pop    %rbp
  403974:	41 5c                	pop    %r12
  403976:	41 5d                	pop    %r13
  403978:	c3                   	retq   
  403979:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
      _M_check_len(size_type __n, const char* __s) const
      {
	if (max_size() - size() < __n)
	  __throw_length_error(__N(__s));

	const size_type __len = size() + std::max(size(), __n);
  403980:	48 8d 04 12          	lea    (%rdx,%rdx,1),%rax
	return (__len < size() || __len > max_size()) ? max_size() : __len;
  403984:	48 39 c2             	cmp    %rax,%rdx
  403987:	76 0c                	jbe    403995 <_ZNSt6vectorIiSaIiEE19_M_emplace_back_auxIIRKiEEEvDpOT_+0xb5>
  403989:	49 c7 c4 fc ff ff ff 	mov    $0xfffffffffffffffc,%r12
  403990:	e9 6e ff ff ff       	jmpq   403903 <_ZNSt6vectorIiSaIiEE19_M_emplace_back_auxIIRKiEEEvDpOT_+0x23>
  403995:	48 b9 ff ff ff ff ff 	movabs $0x3fffffffffffffff,%rcx
  40399c:	ff ff 3f 
  40399f:	48 c1 e2 03          	shl    $0x3,%rdx
  4039a3:	49 c7 c4 fc ff ff ff 	mov    $0xfffffffffffffffc,%r12
  4039aa:	48 39 c8             	cmp    %rcx,%rax
  4039ad:	4c 0f 46 e2          	cmovbe %rdx,%r12
  4039b1:	e9 4d ff ff ff       	jmpq   403903 <_ZNSt6vectorIiSaIiEE19_M_emplace_back_auxIIRKiEEEvDpOT_+0x23>
  4039b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4039bd:	00 00 00 

00000000004039c0 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv>:
    }

#if __cplusplus >= 201103L
  template<typename _Alloc>
    bool
    vector<bool, _Alloc>::
  4039c0:	41 57                	push   %r15
  4039c2:	41 56                	push   %r14
  4039c4:	41 55                	push   %r13
  4039c6:	41 54                	push   %r12
  4039c8:	55                   	push   %rbp
  4039c9:	53                   	push   %rbx
  4039ca:	48 89 fb             	mov    %rdi,%rbx
  4039cd:	48 83 ec 08          	sub    $0x8,%rsp
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  4039d1:	48 8b 0f             	mov    (%rdi),%rcx
  4039d4:	48 8b 47 10          	mov    0x10(%rdi),%rax
	    + __x._M_offset - __y._M_offset);
  4039d8:	8b 57 18             	mov    0x18(%rdi),%edx
  4039db:	8b 77 08             	mov    0x8(%rdi),%esi
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  4039de:	48 29 c8             	sub    %rcx,%rax
	    + __x._M_offset - __y._M_offset);
  4039e1:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  4039e5:	48 8b 57 20          	mov    0x20(%rdi),%rdx
	    + __x._M_offset - __y._M_offset);
  4039e9:	48 89 c5             	mov    %rax,%rbp
  4039ec:	48 29 f5             	sub    %rsi,%rbp
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
  4039ef:	48 29 ca             	sub    %rcx,%rdx
  4039f2:	48 c1 e2 03          	shl    $0x3,%rdx
    _M_shrink_to_fit()
    {
      if (capacity() - size() < int(_S_word_bit))
  4039f6:	48 29 c2             	sub    %rax,%rdx
	return false;
  4039f9:	31 c0                	xor    %eax,%eax
  template<typename _Alloc>
    bool
    vector<bool, _Alloc>::
    _M_shrink_to_fit()
    {
      if (capacity() - size() < int(_S_word_bit))
  4039fb:	48 83 fa 3f          	cmp    $0x3f,%rdx
  4039ff:	77 0f                	ja     403a10 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0x50>
	  _M_reallocate(size());
	  return true;
	}
      __catch(...)
	{ return false; }
    }
  403a01:	48 83 c4 08          	add    $0x8,%rsp
  403a05:	5b                   	pop    %rbx
  403a06:	5d                   	pop    %rbp
  403a07:	41 5c                	pop    %r12
  403a09:	41 5d                	pop    %r13
  403a0b:	41 5e                	pop    %r14
  403a0d:	41 5f                	pop    %r15
  403a0f:	c3                   	retq   
			     _M_impl._M_end_of_storage - _M_impl._M_start._M_p);
      }

      static size_t
      _S_nword(size_t __n)
      { return (__n + int(_S_word_bit) - 1) / int(_S_word_bit); }
  403a10:	48 83 c5 3f          	add    $0x3f,%rbp
  403a14:	48 c1 ed 06          	shr    $0x6,%rbp
      allocate(size_type __n, const void* = 0)
      { 
	if (__n > this->max_size())
	  std::__throw_bad_alloc();

	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
  403a18:	48 c1 e5 03          	shl    $0x3,%rbp
  403a1c:	48 89 ef             	mov    %rbp,%rdi
  403a1f:	e8 cc e2 ff ff       	callq  401cf0 <_Znwm@plt>
    begin() const _GLIBCXX_NOEXCEPT
    { return this->_M_impl._M_start; }

    iterator
    end() _GLIBCXX_NOEXCEPT
    { return this->_M_impl._M_finish; }
  403a24:	4c 8b 63 10          	mov    0x10(%rbx),%r12
  403a28:	49 89 c5             	mov    %rax,%r13
      template<typename _Tp>
        static _Tp*
        __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
        {
	  const ptrdiff_t _Num = __last - __first;
	  if (_Num)
  403a2b:	45 31 f6             	xor    %r14d,%r14d
    { this->assign(__l.begin(), __l.end()); }
#endif

    iterator
    begin() _GLIBCXX_NOEXCEPT
    { return this->_M_impl._M_start; }
  403a2e:	48 8b 3b             	mov    (%rbx),%rdi
    begin() const _GLIBCXX_NOEXCEPT
    { return this->_M_impl._M_start; }

    iterator
    end() _GLIBCXX_NOEXCEPT
    { return this->_M_impl._M_finish; }
  403a31:	44 8b 7b 18          	mov    0x18(%rbx),%r15d
    {
      template<typename _Tp>
        static _Tp*
        __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
        {
	  const ptrdiff_t _Num = __last - __first;
  403a35:	4c 89 e0             	mov    %r12,%rax
  403a38:	48 29 f8             	sub    %rdi,%rax
  403a3b:	48 c1 f8 03          	sar    $0x3,%rax
	  if (_Num)
  403a3f:	48 85 c0             	test   %rax,%rax
  403a42:	74 19                	je     403a5d <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0x9d>
	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
  403a44:	4c 8d 34 c5 00 00 00 	lea    0x0(,%rax,8),%r14
  403a4b:	00 
  403a4c:	48 89 fe             	mov    %rdi,%rsi
  403a4f:	4c 89 ef             	mov    %r13,%rdi
  403a52:	4c 89 f2             	mov    %r14,%rdx
  403a55:	e8 76 e1 ff ff       	callq  401bd0 <memmove@plt>
  403a5a:	48 8b 3b             	mov    (%rbx),%rdi
	  return __result + _Num;
  403a5d:	4f 8d 54 35 00       	lea    0x0(%r13,%r14,1),%r10

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
	    + __x._M_offset - __y._M_offset);
  403a62:	45 89 f9             	mov    %r15d,%r9d
      template<typename _II, typename _OI>
        static _OI
        __copy_m(_II __first, _II __last, _OI __result)
        { 
	  typedef typename iterator_traits<_II>::difference_type _Distance;
	  for(_Distance __n = __last - __first; __n > 0; --__n)
  403a65:	4d 85 c9             	test   %r9,%r9
  403a68:	0f 84 b8 00 00 00    	je     403b26 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0x166>
  403a6e:	45 31 c0             	xor    %r8d,%r8d
  403a71:	31 d2                	xor    %edx,%edx
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  403a73:	b8 01 00 00 00       	mov    $0x1,%eax
  403a78:	eb 2c                	jmp    403aa6 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0xe6>
  403a7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
	*_M_p |= _M_mask;
      else
	*_M_p &= ~_M_mask;
  403a80:	4c 89 d9             	mov    %r11,%rcx
  403a83:	48 f7 d1             	not    %rcx
  403a86:	49 21 0a             	and    %rcx,(%r10)
    : _M_p(__x), _M_offset(__y) { }

    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
  403a89:	8d 4a 01             	lea    0x1(%rdx),%ecx
  403a8c:	83 fa 3f             	cmp    $0x3f,%edx
  403a8f:	74 37                	je     403ac8 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0x108>
  403a91:	41 8d 50 01          	lea    0x1(%r8),%edx
  403a95:	41 83 f8 3f          	cmp    $0x3f,%r8d
  403a99:	74 45                	je     403ae0 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0x120>
  403a9b:	49 83 e9 01          	sub    $0x1,%r9
  403a9f:	74 4f                	je     403af0 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0x130>
  403aa1:	41 89 d0             	mov    %edx,%r8d
  403aa4:	89 ca                	mov    %ecx,%edx
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  403aa6:	44 89 c1             	mov    %r8d,%ecx
  403aa9:	49 89 c3             	mov    %rax,%r11
    _Bit_const_iterator(const _Bit_iterator& __x)
    : _Bit_iterator_base(__x._M_p, __x._M_offset) { }

    const_reference
    operator*() const
    { return _Bit_reference(_M_p, 1UL << _M_offset); }
  403aac:	48 89 c6             	mov    %rax,%rsi
    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }
  403aaf:	49 d3 e3             	shl    %cl,%r11
    _Bit_const_iterator(const _Bit_iterator& __x)
    : _Bit_iterator_base(__x._M_p, __x._M_offset) { }

    const_reference
    operator*() const
    { return _Bit_reference(_M_p, 1UL << _M_offset); }
  403ab2:	89 d1                	mov    %edx,%ecx
  403ab4:	48 d3 e6             	shl    %cl,%rsi
    { return !!(*_M_p & _M_mask); }

    _Bit_reference&
    operator=(bool __x) _GLIBCXX_NOEXCEPT
    {
      if (__x)
  403ab7:	49 85 34 24          	test   %rsi,(%r12)
  403abb:	74 c3                	je     403a80 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0xc0>
	*_M_p |= _M_mask;
  403abd:	4d 09 1a             	or     %r11,(%r10)
    : _M_p(__x), _M_offset(__y) { }

    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
  403ac0:	8d 4a 01             	lea    0x1(%rdx),%ecx
  403ac3:	83 fa 3f             	cmp    $0x3f,%edx
  403ac6:	75 c9                	jne    403a91 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0xd1>
  403ac8:	41 8d 50 01          	lea    0x1(%r8),%edx
	{
	  _M_offset = 0;
	  ++_M_p;
  403acc:	49 83 c4 08          	add    $0x8,%r12
    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
  403ad0:	31 c9                	xor    %ecx,%ecx
    : _M_p(__x), _M_offset(__y) { }

    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
  403ad2:	41 83 f8 3f          	cmp    $0x3f,%r8d
  403ad6:	75 c3                	jne    403a9b <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0xdb>
  403ad8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  403adf:	00 
	{
	  _M_offset = 0;
	  ++_M_p;
  403ae0:	49 83 c2 08          	add    $0x8,%r10
    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
	{
	  _M_offset = 0;
  403ae4:	31 d2                	xor    %edx,%edx
  403ae6:	49 83 e9 01          	sub    $0x1,%r9
  403aea:	75 b5                	jne    403aa1 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0xe1>
  403aec:	0f 1f 40 00          	nopl   0x0(%rax)
      { return _M_impl.allocate(_S_nword(__n)); }

      void
      _M_deallocate()
      {
	if (_M_impl._M_start._M_p)
  403af0:	48 85 ff             	test   %rdi,%rdi
    void
    vector<bool, _Alloc>::
    _M_reallocate(size_type __n)
    {
      _Bit_type* __q = this->_M_allocate(__n);
      this->_M_impl._M_finish = _M_copy_aligned(begin(), end(),
  403af3:	4c 89 53 10          	mov    %r10,0x10(%rbx)
  403af7:	89 53 18             	mov    %edx,0x18(%rbx)
  403afa:	74 05                	je     403b01 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0x141>
      }

      // __p is not permitted to be a null pointer.
      void
      deallocate(pointer __p, size_type)
      { ::operator delete(__p); }
  403afc:	e8 2f df ff ff       	callq  401a30 <_ZdlPv@plt>
						iterator(__q, 0));
      this->_M_deallocate();
      this->_M_impl._M_start = iterator(__q, 0);
      this->_M_impl._M_end_of_storage = __q + _S_nword(__n);
  403b01:	4c 01 ed             	add    %r13,%rbp
    {
      _Bit_type* __q = this->_M_allocate(__n);
      this->_M_impl._M_finish = _M_copy_aligned(begin(), end(),
						iterator(__q, 0));
      this->_M_deallocate();
      this->_M_impl._M_start = iterator(__q, 0);
  403b04:	4c 89 2b             	mov    %r13,(%rbx)
      if (capacity() - size() < int(_S_word_bit))
	return false;
      __try
	{
	  _M_reallocate(size());
	  return true;
  403b07:	b8 01 00 00 00       	mov    $0x1,%eax
      _Bit_type* __q = this->_M_allocate(__n);
      this->_M_impl._M_finish = _M_copy_aligned(begin(), end(),
						iterator(__q, 0));
      this->_M_deallocate();
      this->_M_impl._M_start = iterator(__q, 0);
      this->_M_impl._M_end_of_storage = __q + _S_nword(__n);
  403b0c:	48 89 6b 20          	mov    %rbp,0x20(%rbx)
    {
      _Bit_type* __q = this->_M_allocate(__n);
      this->_M_impl._M_finish = _M_copy_aligned(begin(), end(),
						iterator(__q, 0));
      this->_M_deallocate();
      this->_M_impl._M_start = iterator(__q, 0);
  403b10:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%rbx)
	  _M_reallocate(size());
	  return true;
	}
      __catch(...)
	{ return false; }
    }
  403b17:	48 83 c4 08          	add    $0x8,%rsp
  403b1b:	5b                   	pop    %rbx
  403b1c:	5d                   	pop    %rbp
  403b1d:	41 5c                	pop    %r12
  403b1f:	41 5d                	pop    %r13
  403b21:	41 5e                	pop    %r14
  403b23:	41 5f                	pop    %r15
  403b25:	c3                   	retq   
  403b26:	31 d2                	xor    %edx,%edx
  403b28:	eb c6                	jmp    403af0 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0x130>
      __try
	{
	  _M_reallocate(size());
	  return true;
	}
      __catch(...)
  403b2a:	48 89 c7             	mov    %rax,%rdi
  403b2d:	c5 f8 77             	vzeroupper 
  403b30:	e8 9b e1 ff ff       	callq  401cd0 <__cxa_begin_catch@plt>
  403b35:	e8 56 e1 ff ff       	callq  401c90 <__cxa_end_catch@plt>
	{ return false; }
  403b3a:	31 c0                	xor    %eax,%eax
  403b3c:	e9 c0 fe ff ff       	jmpq   403a01 <_ZNSt6vectorIbSaIbEE16_M_shrink_to_fitEv+0x41>
  403b41:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  403b48:	00 00 00 
  403b4b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000403b50 <_ZN4TreeC1EPSt6vectorIiSaIiEEiij>:

#include "Tree.h"

using namespace std;

Tree::Tree(vector<int>* input, int amount, int alphabetSize, uint skew)
  403b50:	41 54                	push   %r12
    : root(Node(input, 0, alphabetSize-1, nullptr, skew)),
        alphabetMin(0), alphabetMax(alphabetSize-1),
        inputSize(amount)
  403b52:	45 89 c1             	mov    %r8d,%r9d

#include "Tree.h"

using namespace std;

Tree::Tree(vector<int>* input, int amount, int alphabetSize, uint skew)
  403b55:	4c 63 e2             	movslq %edx,%r12
  403b58:	55                   	push   %rbp
    : root(Node(input, 0, alphabetSize-1, nullptr, skew)),
        alphabetMin(0), alphabetMax(alphabetSize-1),
        inputSize(amount)
  403b59:	8d 69 ff             	lea    -0x1(%rcx),%ebp
  403b5c:	45 31 c0             	xor    %r8d,%r8d

#include "Tree.h"

using namespace std;

Tree::Tree(vector<int>* input, int amount, int alphabetSize, uint skew)
  403b5f:	53                   	push   %rbx
    : root(Node(input, 0, alphabetSize-1, nullptr, skew)),
        alphabetMin(0), alphabetMax(alphabetSize-1),
        inputSize(amount)
  403b60:	89 e9                	mov    %ebp,%ecx

#include "Tree.h"

using namespace std;

Tree::Tree(vector<int>* input, int amount, int alphabetSize, uint skew)
  403b62:	48 89 fb             	mov    %rdi,%rbx
    : root(Node(input, 0, alphabetSize-1, nullptr, skew)),
        alphabetMin(0), alphabetMax(alphabetSize-1),
        inputSize(amount)
  403b65:	48 63 ed             	movslq %ebp,%rbp
  403b68:	31 d2                	xor    %edx,%edx
  403b6a:	e8 41 f6 ff ff       	callq  4031b0 <_ZN4NodeC1EPSt6vectorIiSaIiEEiiPS_j>
  403b6f:	48 89 6b 50          	mov    %rbp,0x50(%rbx)
  403b73:	4c 89 63 58          	mov    %r12,0x58(%rbx)
  403b77:	48 c7 43 48 00 00 00 	movq   $0x0,0x48(%rbx)
  403b7e:	00 
{
}
  403b7f:	5b                   	pop    %rbx
  403b80:	5d                   	pop    %rbp
  403b81:	41 5c                	pop    %r12
  403b83:	c3                   	retq   
  403b84:	66 66 66 2e 0f 1f 84 	data32 data32 nopw %cs:0x0(%rax,%rax,1)
  403b8b:	00 00 00 00 00 

0000000000403b90 <_ZN4Tree4rankEimj>:

int Tree::rank(int character, unsigned long index, uint skew) {
    if(index > inputSize) index = inputSize;
  403b90:	48 8b 47 58          	mov    0x58(%rdi),%rax
        alphabetMin(0), alphabetMax(alphabetSize-1),
        inputSize(amount)
{
}

int Tree::rank(int character, unsigned long index, uint skew) {
  403b94:	41 89 c9             	mov    %ecx,%r9d
    if(index > inputSize) index = inputSize;
    return root.rank(character, index, alphabetMin, alphabetMax, skew);
  403b97:	44 8b 47 50          	mov    0x50(%rdi),%r8d
  403b9b:	8b 4f 48             	mov    0x48(%rdi),%ecx
  403b9e:	48 39 c2             	cmp    %rax,%rdx
  403ba1:	48 0f 47 d0          	cmova  %rax,%rdx
  403ba5:	e9 b6 f0 ff ff       	jmpq   402c60 <_ZN4Node4rankEimiij>
  403baa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000403bb0 <_ZN4Tree6selectEimj>:
}

int Tree::select(int character, unsigned long occurance, uint skew) {
  403bb0:	55                   	push   %rbp
  403bb1:	41 89 c8             	mov    %ecx,%r8d
  403bb4:	48 89 d5             	mov    %rdx,%rbp
  403bb7:	53                   	push   %rbx
  403bb8:	89 f3                	mov    %esi,%ebx
  403bba:	48 83 ec 08          	sub    $0x8,%rsp
    Node* leaf = root.getLeaf(character, alphabetMin, alphabetMax, skew);
  403bbe:	8b 57 48             	mov    0x48(%rdi),%edx
  403bc1:	8b 4f 50             	mov    0x50(%rdi),%ecx
  403bc4:	e8 87 f2 ff ff       	callq  402e50 <_ZN4Node7getLeafEjjjj>
    return leaf->leafSelect(character, occurance);
  403bc9:	48 83 c4 08          	add    $0x8,%rsp
    return root.rank(character, index, alphabetMin, alphabetMax, skew);
}

int Tree::select(int character, unsigned long occurance, uint skew) {
    Node* leaf = root.getLeaf(character, alphabetMin, alphabetMax, skew);
    return leaf->leafSelect(character, occurance);
  403bcd:	89 de                	mov    %ebx,%esi
  403bcf:	5b                   	pop    %rbx
    return root.rank(character, index, alphabetMin, alphabetMax, skew);
}

int Tree::select(int character, unsigned long occurance, uint skew) {
    Node* leaf = root.getLeaf(character, alphabetMin, alphabetMax, skew);
    return leaf->leafSelect(character, occurance);
  403bd0:	48 89 ea             	mov    %rbp,%rdx
  403bd3:	48 89 c7             	mov    %rax,%rdi
  403bd6:	5d                   	pop    %rbp
    return root.rank(character, index, alphabetMin, alphabetMax, skew);
}

int Tree::select(int character, unsigned long occurance, uint skew) {
    Node* leaf = root.getLeaf(character, alphabetMin, alphabetMax, skew);
    return leaf->leafSelect(character, occurance);
  403bd7:	e9 b4 f5 ff ff       	jmpq   403190 <_ZN4Node10leafSelectEjm>
  403bdc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000403be0 <_Z9read_fileRiPKc>:
 * @param [in] filename name of file to be read
 * 
 * @returns a pointer to a newly created array containing the data, remember to delete[] this
 * 
 */
inline int* read_file(int& size_out, const char* filename) {
  403be0:	41 56                	push   %r14
  403be2:	41 55                	push   %r13
  403be4:	49 89 fd             	mov    %rdi,%r13
  403be7:	41 54                	push   %r12
  403be9:	49 89 f4             	mov    %rsi,%r12
  403bec:	55                   	push   %rbp
  403bed:	53                   	push   %rbx
  403bee:	48 81 ec 10 02 00 00 	sub    $0x210,%rsp
  403bf5:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403bfc:	00 00 
  403bfe:	48 89 84 24 08 02 00 	mov    %rax,0x208(%rsp)
  403c05:	00 
  403c06:	31 c0                	xor    %eax,%eax
       *  The default constructor does nothing and is not normally
       *  accessible to users.
      */
      basic_ios()
      : ios_base(), _M_tie(0), _M_fill(char_type()), _M_fill_init(false), 
	_M_streambuf(0), _M_ctype(0), _M_num_put(0), _M_num_get(0)
  403c08:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  403c0f:	00 
  403c10:	e8 db dd ff ff       	callq  4019f0 <_ZNSt8ios_baseC2Ev@plt>
      seekg(off_type, ios_base::seekdir);
      //@}

    protected:
      basic_istream()
      : _M_gcount(streamsize(0))
  403c15:	48 8b 1d 0c 18 20 00 	mov    0x20180c(%rip),%rbx        # 605428 <_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE@@GLIBCXX_3.4+0x8>
      { this->init(0); }
  403c1c:	31 f6                	xor    %esi,%esi
  403c1e:	c6 84 24 e0 01 00 00 	movb   $0x0,0x1e0(%rsp)
  403c25:	00 
      seekg(off_type, ios_base::seekdir);
      //@}

    protected:
      basic_istream()
      : _M_gcount(streamsize(0))
  403c26:	48 8b 2d 03 18 20 00 	mov    0x201803(%rip),%rbp        # 605430 <_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE@@GLIBCXX_3.4+0x10>
  403c2d:	48 c7 84 24 00 01 00 	movq   $0x605210,0x100(%rsp)
  403c34:	00 10 52 60 00 
  403c39:	48 c7 84 24 d8 01 00 	movq   $0x0,0x1d8(%rsp)
  403c40:	00 00 00 00 00 
  403c45:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
  403c49:	48 89 1c 24          	mov    %rbx,(%rsp)
  403c4d:	c6 84 24 e1 01 00 00 	movb   $0x0,0x1e1(%rsp)
  403c54:	00 
  403c55:	48 c7 84 24 e8 01 00 	movq   $0x0,0x1e8(%rsp)
  403c5c:	00 00 00 00 00 
  403c61:	48 c7 84 24 f0 01 00 	movq   $0x0,0x1f0(%rsp)
  403c68:	00 00 00 00 00 
  403c6d:	48 c7 84 24 f8 01 00 	movq   $0x0,0x1f8(%rsp)
  403c74:	00 00 00 00 00 
  403c79:	48 c7 84 24 00 02 00 	movq   $0x0,0x200(%rsp)
  403c80:	00 00 00 00 00 
  403c85:	48 89 2c 04          	mov    %rbp,(%rsp,%rax,1)
  403c89:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  403c90:	00 00 
      { this->init(0); }
  403c92:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
  403c96:	48 8d 3c 04          	lea    (%rsp,%rax,1),%rdi
  403c9a:	e8 41 df ff ff       	callq  401be0 <_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@plt>
       *  Tip:  When using std::string to hold the filename, you must use
       *  .c_str() before passing it to this constructor.
       */
      explicit
      basic_ifstream(const char* __s, ios_base::openmode __mode = ios_base::in)
      : __istream_type(), _M_filebuf()
  403c9f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  403ca4:	48 c7 04 24 b8 52 60 	movq   $0x6052b8,(%rsp)
  403cab:	00 
  403cac:	48 c7 84 24 00 01 00 	movq   $0x6052e0,0x100(%rsp)
  403cb3:	00 e0 52 60 00 
  403cb8:	e8 b3 df ff ff       	callq  401c70 <_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev@plt>
      {
	this->init(&_M_filebuf);
  403cbd:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  403cc2:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  403cc9:	00 
  403cca:	e8 11 df ff ff       	callq  401be0 <_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@plt>
       *  .c_str() before passing it to this constructor.
       */
      void
      open(const char* __s, ios_base::openmode __mode = ios_base::in)
      {
	if (!_M_filebuf.open(__s, __mode | ios_base::in))
  403ccf:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  403cd4:	ba 0e 00 00 00       	mov    $0xe,%edx
  403cd9:	4c 89 e6             	mov    %r12,%rsi
  403cdc:	e8 ff dd ff ff       	callq  401ae0 <_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode@plt>
  403ce1:	48 85 c0             	test   %rax,%rax
	  this->setstate(ios_base::failbit);
  403ce4:	48 8b 04 24          	mov    (%rsp),%rax
  403ce8:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  403cec:	48 8d 3c 04          	lea    (%rsp,%rax,1),%rdi
       *  .c_str() before passing it to this constructor.
       */
      void
      open(const char* __s, ios_base::openmode __mode = ios_base::in)
      {
	if (!_M_filebuf.open(__s, __mode | ios_base::in))
  403cf0:	0f 84 8a 01 00 00    	je     403e80 <_Z9read_fileRiPKc+0x2a0>
	  this->setstate(ios_base::failbit);
	else
	  // _GLIBCXX_RESOLVE_LIB_DEFECTS
	  // 409. Closing an fstream should clear error state
	  this->clear();
  403cf6:	31 f6                	xor    %esi,%esi
  403cf8:	e8 63 df ff ff       	callq  401c60 <_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@plt>
      /**
       *  @brief  Returns true if the external file is open.
       */
      bool
      is_open() const throw()
      { return _M_file.is_open(); }
  403cfd:	48 8d 7c 24 78       	lea    0x78(%rsp),%rdi
  403d02:	e8 19 e0 ff ff       	callq  401d20 <_ZNKSt12__basic_fileIcE7is_openEv@plt>
    streampos size;
    int * arr = nullptr;
//    vector<int>* arr = new vector<int>(size/sizeof(int));
    ifstream file(filename, ios::in|ios::binary|ios::ate);
    if(file.is_open())
  403d07:	84 c0                	test   %al,%al
  403d09:	0f 84 f1 00 00 00    	je     403e00 <_Z9read_fileRiPKc+0x220>
    {
        size = file.tellg();
  403d0f:	48 89 e7             	mov    %rsp,%rdi
  403d12:	e8 69 dd ff ff       	callq  401a80 <_ZNSi5tellgEv@plt>
  403d17:	49 89 c6             	mov    %rax,%r14
//        cout << "Size: " << size << endl;
//        cout << "sizeof(int): " << sizeof(int) << endl;
//        cout << "Elements: " << size/sizeof(int) << endl;
        size_out = size/sizeof(int);
  403d1a:	48 c1 e8 02          	shr    $0x2,%rax
        arr = new int[size/sizeof(int)];
  403d1e:	48 b9 00 00 00 00 00 	movabs $0x1fc0000000000000,%rcx
  403d25:	00 c0 1f 
  403d28:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  403d2f:	00 
  403d30:	48 39 c8             	cmp    %rcx,%rax
    {
        size = file.tellg();
//        cout << "Size: " << size << endl;
//        cout << "sizeof(int): " << sizeof(int) << endl;
//        cout << "Elements: " << size/sizeof(int) << endl;
        size_out = size/sizeof(int);
  403d33:	41 89 45 00          	mov    %eax,0x0(%r13)
        arr = new int[size/sizeof(int)];
  403d37:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
  403d3e:	48 0f 46 fa          	cmovbe %rdx,%rdi
  403d42:	e8 c9 dc ff ff       	callq  401a10 <_Znam@plt>
        file.seekg(0, ios::beg);
  403d47:	31 d2                	xor    %edx,%edx
  403d49:	31 f6                	xor    %esi,%esi
  403d4b:	48 89 e7             	mov    %rsp,%rdi
        size = file.tellg();
//        cout << "Size: " << size << endl;
//        cout << "sizeof(int): " << sizeof(int) << endl;
//        cout << "Elements: " << size/sizeof(int) << endl;
        size_out = size/sizeof(int);
        arr = new int[size/sizeof(int)];
  403d4e:	49 89 c4             	mov    %rax,%r12
        file.seekg(0, ios::beg);
  403d51:	e8 6a dd ff ff       	callq  401ac0 <_ZNSi5seekgElSt12_Ios_Seekdir@plt>
        file.read((char*) arr, size);
  403d56:	4c 89 f2             	mov    %r14,%rdx
  403d59:	4c 89 e6             	mov    %r12,%rsi
  403d5c:	48 89 e7             	mov    %rsp,%rdi
  403d5f:	e8 8c dd ff ff       	callq  401af0 <_ZNSi4readEPcl@plt>
      /**
       *  @brief  The destructor closes the file first.
       */
      virtual
      ~basic_filebuf()
      { this->close(); }
  403d64:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
       *
       *  The file is closed by the filebuf object, not the formatting
       *  stream.
       */
      ~basic_ifstream()
      { }
  403d69:	48 c7 04 24 b8 52 60 	movq   $0x6052b8,(%rsp)
  403d70:	00 
  403d71:	48 c7 84 24 00 01 00 	movq   $0x6052e0,0x100(%rsp)
  403d78:	00 e0 52 60 00 
      /**
       *  @brief  The destructor closes the file first.
       */
      virtual
      ~basic_filebuf()
      { this->close(); }
  403d7d:	48 c7 44 24 10 30 52 	movq   $0x605230,0x10(%rsp)
  403d84:	60 00 
  403d86:	e8 c5 df ff ff       	callq  401d50 <_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv@plt>
  403d8b:	48 8d 7c 24 78       	lea    0x78(%rsp),%rdi
  403d90:	e8 9b de ff ff       	callq  401c30 <_ZNSt12__basic_fileIcED1Ev@plt>

  public:
      /// Destructor deallocates no buffer space.
      virtual 
      ~basic_streambuf() 
      { }
  403d95:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
  403d9a:	48 c7 44 24 10 50 54 	movq   $0x605450,0x10(%rsp)
  403da1:	60 00 
  403da3:	e8 68 df ff ff       	callq  401d10 <_ZNSt6localeD1Ev@plt>
       *
       *  This does very little apart from providing a virtual base dtor.
      */
      virtual
      ~basic_istream()
      { _M_gcount = streamsize(0); }
  403da8:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
  403dac:	48 89 1c 24          	mov    %rbx,(%rsp)
       *
       *  The destructor does nothing.  More specifically, it does not
       *  destroy the streambuf held by rdbuf().
      */
      virtual
      ~basic_ios() { }
  403db0:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  403db7:	00 
  403db8:	48 89 2c 04          	mov    %rbp,(%rsp,%rax,1)
  403dbc:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  403dc3:	00 00 
  403dc5:	48 c7 84 24 00 01 00 	movq   $0x605210,0x100(%rsp)
  403dcc:	00 10 52 60 00 
  403dd1:	e8 4a de ff ff       	callq  401c20 <_ZNSt8ios_baseD2Ev@plt>
    else 
    {
        cout << "IO ERROR" << endl;
    }
    return arr;
}
  403dd6:	4c 89 e0             	mov    %r12,%rax
  403dd9:	48 8b 8c 24 08 02 00 	mov    0x208(%rsp),%rcx
  403de0:	00 
  403de1:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  403de8:	00 00 
  403dea:	0f 85 bb 00 00 00    	jne    403eab <_Z9read_fileRiPKc+0x2cb>
  403df0:	48 81 c4 10 02 00 00 	add    $0x210,%rsp
  403df7:	5b                   	pop    %rbx
  403df8:	5d                   	pop    %rbp
  403df9:	41 5c                	pop    %r12
  403dfb:	41 5d                	pop    %r13
  403dfd:	41 5e                	pop    %r14
  403dff:	c3                   	retq   
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  403e00:	ba 08 00 00 00       	mov    $0x8,%edx
  403e05:	be a2 40 40 00       	mov    $0x4040a2,%esi
  403e0a:	bf 00 53 60 00       	mov    $0x605300,%edi
  403e0f:	e8 ac dd ff ff       	callq  401bc0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
   *  for more on this subject.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    endl(basic_ostream<_CharT, _Traits>& __os)
    { return flush(__os.put(__os.widen('\n'))); }
  403e14:	48 8b 05 e5 14 20 00 	mov    0x2014e5(%rip),%rax        # 605300 <_ZSt4cout@@GLIBCXX_3.4>
  403e1b:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  403e1f:	4c 8b a0 f0 53 60 00 	mov    0x6053f0(%rax),%r12

  template<typename _Facet>
    inline const _Facet&
    __check_facet(const _Facet* __f)
    {
      if (!__f)
  403e26:	4d 85 e4             	test   %r12,%r12
  403e29:	74 65                	je     403e90 <_Z9read_fileRiPKc+0x2b0>
       *  @return  The converted character.
      */
      char_type
      widen(char __c) const
      {
	if (_M_widen_ok)
  403e2b:	41 80 7c 24 38 00    	cmpb   $0x0,0x38(%r12)
  403e31:	74 2d                	je     403e60 <_Z9read_fileRiPKc+0x280>
	  return _M_widen[static_cast<unsigned char>(__c)];
  403e33:	41 0f b6 44 24 43    	movzbl 0x43(%r12),%eax
  403e39:	0f be f0             	movsbl %al,%esi
  403e3c:	bf 00 53 60 00       	mov    $0x605300,%edi
  403e41:	e8 ea de ff ff       	callq  401d30 <_ZNSo3putEc@plt>
   *  This manipulator simply calls the stream's @c flush() member function.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    flush(basic_ostream<_CharT, _Traits>& __os)
    { return __os.flush(); }
  403e46:	48 89 c7             	mov    %rax,%rdi
  403e49:	e8 b2 dd ff ff       	callq  401c00 <_ZNSo5flushEv@plt>
 * @returns a pointer to a newly created array containing the data, remember to delete[] this
 * 
 */
inline int* read_file(int& size_out, const char* filename) {
    streampos size;
    int * arr = nullptr;
  403e4e:	45 31 e4             	xor    %r12d,%r12d
  403e51:	e9 0e ff ff ff       	jmpq   403d64 <_Z9read_fileRiPKc+0x184>
  403e56:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  403e5d:	00 00 00 
	this->_M_widen_init();
  403e60:	4c 89 e7             	mov    %r12,%rdi
  403e63:	e8 f8 db ff ff       	callq  401a60 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
	return this->do_widen(__c);
  403e68:	49 8b 04 24          	mov    (%r12),%rax
  403e6c:	be 0a 00 00 00       	mov    $0xa,%esi
  403e71:	4c 89 e7             	mov    %r12,%rdi
  403e74:	ff 50 30             	callq  *0x30(%rax)
  403e77:	eb c0                	jmp    403e39 <_Z9read_fileRiPKc+0x259>
  403e79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  403e80:	8b 77 20             	mov    0x20(%rdi),%esi
  403e83:	83 ce 04             	or     $0x4,%esi
       *
       *  See std::ios_base::iostate for the possible bit values.
      */
      void
      setstate(iostate __state)
      { this->clear(this->rdstate() | __state); }
  403e86:	e8 d5 dd ff ff       	callq  401c60 <_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@plt>
  403e8b:	e9 6d fe ff ff       	jmpq   403cfd <_Z9read_fileRiPKc+0x11d>
  template<typename _Facet>
    inline const _Facet&
    __check_facet(const _Facet* __f)
    {
      if (!__f)
	__throw_bad_cast();
  403e90:	e8 4b db ff ff       	callq  4019e0 <_ZSt16__throw_bad_castv@plt>
  403e95:	48 89 c3             	mov    %rax,%rbx
    }
    else 
    {
        cout << "IO ERROR" << endl;
    }
    return arr;
  403e98:	48 89 e7             	mov    %rsp,%rdi
  403e9b:	c5 f8 77             	vzeroupper 
  403e9e:	e8 dd dc ff ff       	callq  401b80 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@plt>
  403ea3:	48 89 df             	mov    %rbx,%rdi
  403ea6:	e8 55 de ff ff       	callq  401d00 <_Unwind_Resume@plt>
}
  403eab:	e8 60 dd ff ff       	callq  401c10 <__stack_chk_fail@plt>
  403eb0:	48 89 c3             	mov    %rax,%rbx
  403eb3:	c5 f8 77             	vzeroupper 
       *
       *  The destructor does nothing.  More specifically, it does not
       *  destroy the streambuf held by rdbuf().
      */
      virtual
      ~basic_ios() { }
  403eb6:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  403ebd:	00 
  403ebe:	48 c7 84 24 00 01 00 	movq   $0x605210,0x100(%rsp)
  403ec5:	00 10 52 60 00 
  403eca:	e8 51 dd ff ff       	callq  401c20 <_ZNSt8ios_baseD2Ev@plt>
  403ecf:	48 89 df             	mov    %rbx,%rdi
  403ed2:	e8 29 de ff ff       	callq  401d00 <_Unwind_Resume@plt>
       *  Tip:  When using std::string to hold the filename, you must use
       *  .c_str() before passing it to this constructor.
       */
      explicit
      basic_ifstream(const char* __s, ios_base::openmode __mode = ios_base::in)
      : __istream_type(), _M_filebuf()
  403ed7:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  403edc:	49 89 c4             	mov    %rax,%r12
  403edf:	c5 f8 77             	vzeroupper 
  403ee2:	e8 c9 dd ff ff       	callq  401cb0 <_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev@plt>
  403ee7:	4c 89 e0             	mov    %r12,%rax
  403eea:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
  403eee:	48 89 1c 24          	mov    %rbx,(%rsp)
  403ef2:	48 89 c3             	mov    %rax,%rbx
  403ef5:	48 89 2c 14          	mov    %rbp,(%rsp,%rdx,1)
  403ef9:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  403f00:	00 00 
  403f02:	eb b2                	jmp    403eb6 <_Z9read_fileRiPKc+0x2d6>
  403f04:	c5 f8 77             	vzeroupper 
  403f07:	eb e1                	jmp    403eea <_Z9read_fileRiPKc+0x30a>
  403f09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000403f10 <_Z12handle_errori>:

#define NUM_EVENTS 3

using namespace std;

inline void handle_error (int retval) {
  403f10:	53                   	push   %rbx
  403f11:	89 fb                	mov    %edi,%ebx
    printf("PAPI error %d: %s\n", retval, PAPI_strerror(retval));
  403f13:	e8 88 dc ff ff       	callq  401ba0 <PAPI_strerror@plt>
}

__fortify_function int
printf (const char *__restrict __fmt, ...)
{
  return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
  403f18:	bf 01 00 00 00       	mov    $0x1,%edi
  403f1d:	89 da                	mov    %ebx,%edx
  403f1f:	48 89 c1             	mov    %rax,%rcx
  403f22:	be ab 40 40 00       	mov    $0x4040ab,%esi
  403f27:	31 c0                	xor    %eax,%eax
  403f29:	e8 42 db ff ff       	callq  401a70 <__printf_chk@plt>
    exit(1);
  403f2e:	bf 01 00 00 00       	mov    $0x1,%edi
  403f33:	e8 18 db ff ff       	callq  401a50 <exit@plt>
  403f38:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  403f3f:	00 

0000000000403f40 <_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EOS6_S7_>:
	      basic_string<_CharT, _Traits, _Alloc>&& __rhs)
    { return std::move(__rhs.insert(0, __lhs)); }

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(basic_string<_CharT, _Traits, _Alloc>&& __lhs,
  403f40:	53                   	push   %rbx
  403f41:	49 89 d0             	mov    %rdx,%r8
  403f44:	48 89 fb             	mov    %rdi,%rbx
      // Data Members (private):
      mutable _Alloc_hider	_M_dataplus;

      _CharT*
      _M_data() const
      { return  _M_dataplus._M_p; }
  403f47:	48 8b 06             	mov    (%rsi),%rax
	      basic_string<_CharT, _Traits, _Alloc>&& __rhs)
    { return std::move(__rhs.insert(0, __lhs)); }

  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(basic_string<_CharT, _Traits, _Alloc>&& __lhs,
  403f4a:	48 89 f7             	mov    %rsi,%rdi
      // Data Members (private):
      mutable _Alloc_hider	_M_dataplus;

      _CharT*
      _M_data() const
      { return  _M_dataplus._M_p; }
  403f4d:	48 8b 12             	mov    (%rdx),%rdx
      // Capacity:
      ///  Returns the number of characters in the string, not including any
      ///  null-termination.
      size_type
      size() const _GLIBCXX_NOEXCEPT
      { return _M_rep()->_M_length; }
  403f50:	48 8b 48 e8          	mov    -0x18(%rax),%rcx
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(basic_string<_CharT, _Traits, _Alloc>&& __lhs,
	      basic_string<_CharT, _Traits, _Alloc>&& __rhs)
    {
      const auto __size = __lhs.size() + __rhs.size();
  403f54:	48 89 ce             	mov    %rcx,%rsi
  403f57:	48 03 72 e8          	add    -0x18(%rdx),%rsi
      const bool __cond = (__size > __lhs.capacity()
			   && __size <= __rhs.capacity());
  403f5b:	48 3b 70 f0          	cmp    -0x10(%rax),%rsi
  403f5f:	76 06                	jbe    403f67 <_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EOS6_S7_+0x27>
  403f61:	48 3b 72 f0          	cmp    -0x10(%rdx),%rsi
  403f65:	76 21                	jbe    403f88 <_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EOS6_S7_+0x48>
      return __cond ? std::move(__rhs.insert(0, __lhs))
	            : std::move(__lhs.append(__rhs));
  403f67:	4c 89 c6             	mov    %r8,%rsi
  403f6a:	e8 d1 dd ff ff       	callq  401d40 <_ZNSs6appendERKSs@plt>
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  403f6f:	48 8b 10             	mov    (%rax),%rdx
  403f72:	48 89 13             	mov    %rdx,(%rbx)
      _M_data() const
      { return  _M_dataplus._M_p; }

      _CharT*
      _M_data(_CharT* __p)
      { return (_M_dataplus._M_p = __p); }
  403f75:	48 c7 00 d8 54 60 00 	movq   $0x6054d8,(%rax)
      const auto __size = __lhs.size() + __rhs.size();
      const bool __cond = (__size > __lhs.capacity()
			   && __size <= __rhs.capacity());
      return __cond ? std::move(__rhs.insert(0, __lhs))
	            : std::move(__lhs.append(__rhs));
    }
  403f7c:	48 89 d8             	mov    %rbx,%rax
  403f7f:	5b                   	pop    %rbx
  403f80:	c3                   	retq   
  403f81:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
      basic_string&
      insert(size_type __pos1, const basic_string& __str,
	     size_type __pos2, size_type __n)
      { return this->insert(__pos1, __str._M_data()
			    + __str._M_check(__pos2, "basic_string::insert"),
			    __str._M_limit(__pos2, __n)); }
  403f88:	48 89 c2             	mov    %rax,%rdx
  403f8b:	31 f6                	xor    %esi,%esi
  403f8d:	4c 89 c7             	mov    %r8,%rdi
  403f90:	e8 bb db ff ff       	callq  401b50 <_ZNSs6insertEmPKcm@plt>
	_CharT*
	_M_clone(const _Alloc&, size_type __res = 0);
      };

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : _Alloc
  403f95:	48 8b 10             	mov    (%rax),%rdx
  403f98:	48 89 13             	mov    %rdx,(%rbx)
      _M_data() const
      { return  _M_dataplus._M_p; }

      _CharT*
      _M_data(_CharT* __p)
      { return (_M_dataplus._M_p = __p); }
  403f9b:	48 c7 00 d8 54 60 00 	movq   $0x6054d8,(%rax)
      const auto __size = __lhs.size() + __rhs.size();
      const bool __cond = (__size > __lhs.capacity()
			   && __size <= __rhs.capacity());
      return __cond ? std::move(__rhs.insert(0, __lhs))
	            : std::move(__lhs.append(__rhs));
    }
  403fa2:	48 89 d8             	mov    %rbx,%rax
  403fa5:	5b                   	pop    %rbx
  403fa6:	c3                   	retq   
  403fa7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  403fae:	00 00 

0000000000403fb0 <__libc_csu_init>:
  403fb0:	41 57                	push   %r15
  403fb2:	41 89 ff             	mov    %edi,%r15d
  403fb5:	41 56                	push   %r14
  403fb7:	49 89 f6             	mov    %rsi,%r14
  403fba:	41 55                	push   %r13
  403fbc:	49 89 d5             	mov    %rdx,%r13
  403fbf:	41 54                	push   %r12
  403fc1:	4c 8d 25 f8 0d 20 00 	lea    0x200df8(%rip),%r12        # 604dc0 <__frame_dummy_init_array_entry>
  403fc8:	55                   	push   %rbp
  403fc9:	48 8d 2d 08 0e 20 00 	lea    0x200e08(%rip),%rbp        # 604dd8 <__init_array_end>
  403fd0:	53                   	push   %rbx
  403fd1:	4c 29 e5             	sub    %r12,%rbp
  403fd4:	31 db                	xor    %ebx,%ebx
  403fd6:	48 c1 fd 03          	sar    $0x3,%rbp
  403fda:	48 83 ec 08          	sub    $0x8,%rsp
  403fde:	e8 bd d9 ff ff       	callq  4019a0 <_init>
  403fe3:	48 85 ed             	test   %rbp,%rbp
  403fe6:	74 1e                	je     404006 <__libc_csu_init+0x56>
  403fe8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  403fef:	00 
  403ff0:	4c 89 ea             	mov    %r13,%rdx
  403ff3:	4c 89 f6             	mov    %r14,%rsi
  403ff6:	44 89 ff             	mov    %r15d,%edi
  403ff9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  403ffd:	48 83 c3 01          	add    $0x1,%rbx
  404001:	48 39 eb             	cmp    %rbp,%rbx
  404004:	75 ea                	jne    403ff0 <__libc_csu_init+0x40>
  404006:	48 83 c4 08          	add    $0x8,%rsp
  40400a:	5b                   	pop    %rbx
  40400b:	5d                   	pop    %rbp
  40400c:	41 5c                	pop    %r12
  40400e:	41 5d                	pop    %r13
  404010:	41 5e                	pop    %r14
  404012:	41 5f                	pop    %r15
  404014:	c3                   	retq   
  404015:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
  40401c:	00 00 00 00 

0000000000404020 <__libc_csu_fini>:
  404020:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000404024 <_fini>:
  404024:	48 83 ec 08          	sub    $0x8,%rsp
  404028:	48 83 c4 08          	add    $0x8,%rsp
  40402c:	c3                   	retq   
