global _start

section .data
	align 16

quad1:
	dq	0xccddccddad007fff
quad2:
	dq	0xaabbaabbad007fff
quad3:
	dq	0x00ff00ffad007fff

mydword:
	dd	0xcafebabe
myaddress:
	dq	0x00adbeefc0de00ce

%include "header.inc"

	movq		mm0, [quad1]
	movq		mm1, [quad3]
	movq		mm2, [quad2]
	movq		mm3, [quad3]

	punpckhbw	mm0, [myaddress]
	punpckhbw	mm0, mm1
	punpckhbw	mm1, [quad2]
	punpckhbw	mm2, [quad1]
	punpckhbw	mm3, [quad1]

%include "footer.inc"
