	.file	"pid1sh.c"
                                        # Start of file scope inline assembly
	.globl	_start
_start:
	movq	(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	main

                                        # End of file scope inline assembly
	.text
	.globl	memcpy                          # -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 # @memcpy
.Lmemcpy$local:
	.type	.Lmemcpy$local,@function
# %bb.0:                                # %entry
	movq	%rdi, %rax
	xorl	%ecx, %ecx
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rcx, %rdx
	je	.LBB0_3
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movb	(%rsi,%rcx), %dil
	movb	%dil, (%rax,%rcx)
	incq	%rcx
	jmp	.LBB0_1
.LBB0_3:                                # %for.end
	retq
.Lfunc_end0:
	.size	memcpy, .Lfunc_end0-memcpy
	.size	.Lmemcpy$local, .Lfunc_end0-memcpy
                                        # -- End function
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
.Lmain$local:
	.type	.Lmain$local,@function
# %bb.0:                                # %entry
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$2072, %rsp                     # imm = 0x818
	movslq	%edi, %rax
	leaq	8(%rsi,%rax,8), %rax
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	leaq	256(%rsp), %r10
	pushq	$16
	popq	%r8
	movl	$21505, %esi                    # imm = 0x5401
	xorl	%edi, %edi
	movq	%r10, %rdx
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	andb	$-12, 12(%r10)
	movl	$21506, %esi                    # imm = 0x5402
	xorl	%edi, %edi
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	leaq	.L.str(%rip), %rsi
	pushq	$10
	popq	%rdx
	pushq	$1
	popq	%r8
	movq	%r8, %rdi
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	leaq	7(%rsp), %r12
	pushq	$3
	popq	%rbp
	leaq	.L.str.7(%rip), %rbx
	leaq	.L.str.6(%rip), %r14
	pushq	$7
	popq	%r13
.LBB1_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #     Child Loop BB1_21 Depth 2
                                        #     Child Loop BB1_71 Depth 2
	xorl	%eax, %eax
	xorl	%ecx, %ecx
.LBB1_2:                                # %while.body.i
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rcx, %r15
	movq	%rax, %r9
	xorl	%edi, %edi
	movq	%r12, %rsi
	movq	%r8, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	testq	%rax, %rax
	jle	.LBB1_73
# %bb.3:                                # %if.end.i
                                        #   in Loop: Header=BB1_2 Depth=2
	movzbl	7(%rsp), %edx
	cmpl	$3, %edx
	movq	%r9, %rax
	movq	%r15, %rcx
	je	.LBB1_2
# %bb.4:                                # %if.end.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpl	$9, %edx
	movq	%r9, %rax
	movq	%r15, %rcx
	je	.LBB1_2
# %bb.5:                                # %if.end.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpl	$27, %edx
	je	.LBB1_9
# %bb.6:                                # %if.end.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpl	$127, %edx
	jne	.LBB1_18
# %bb.7:                                # %if.then7.i
                                        #   in Loop: Header=BB1_2 Depth=2
	xorl	%eax, %eax
	cmpq	%r15, %r9
	sete	%al
	subq	%rax, %r15
	testq	%r9, %r9
	movl	$0, %eax
	movq	%r15, %rcx
	je	.LBB1_2
# %bb.8:                                # %if.end15.i
                                        #   in Loop: Header=BB1_2 Depth=2
	movb	$32, 255(%rsp,%r9)
	decq	%r9
	movq	%r8, %rdi
	movq	%r14, %rsi
	movq	%r13, %rdx
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
.LBB1_15:                               # %while.body.i
                                        #   in Loop: Header=BB1_2 Depth=2
	movq	%r9, %rax
	movq	%r15, %rcx
	jmp	.LBB1_2
.LBB1_9:                                # %if.then32.i
                                        #   in Loop: Header=BB1_2 Depth=2
	xorl	%edi, %edi
	movq	%r12, %rsi
	movq	%r8, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	cmpb	$91, 7(%rsp)
	jne	.LBB1_66
# %bb.10:                               # %if.then42.i
                                        #   in Loop: Header=BB1_2 Depth=2
	xorl	%edi, %edi
	movq	%r12, %rsi
	movq	%r8, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	movzbl	7(%rsp), %edx
	leal	-65(%rdx), %eax
	cmpl	$2, %eax
	movq	%r9, %rax
	movq	%r15, %rcx
	jb	.LBB1_2
# %bb.11:                               # %if.then42.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpl	$67, %edx
	je	.LBB1_16
# %bb.12:                               # %if.then42.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpl	$68, %edx
	jne	.LBB1_66
# %bb.13:                               # %if.then52.i
                                        #   in Loop: Header=BB1_2 Depth=2
	testq	%r9, %r9
	movl	$0, %eax
	movq	%r15, %rcx
	je	.LBB1_2
# %bb.14:                               # %if.end56.i
                                        #   in Loop: Header=BB1_2 Depth=2
	decq	%r9
	movq	%r8, %rdi
	movq	%rbx, %rsi
	movq	%rbp, %rdx
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB1_15
.LBB1_18:                               # %if.end96.i
                                        #   in Loop: Header=BB1_2 Depth=2
	movq	%r8, %rdi
	movq	%r12, %rsi
	movq	%r8, %rdx
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	movzbl	7(%rsp), %eax
	cmpl	$35, %eax
	je	.LBB1_20
# %bb.19:                               # %if.end96.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpl	$10, %eax
	je	.LBB1_20
# %bb.64:                               # %if.end384.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpb	$31, %al
	jle	.LBB1_65
# %bb.74:                               # %if.end395.i
                                        #   in Loop: Header=BB1_2 Depth=2
	movb	%al, 256(%rsp,%r9)
	xorl	%ecx, %ecx
	cmpq	%r15, %r9
	sete	%cl
	addq	%r15, %rcx
	incq	%r9
	movq	%r9, %rax
	jmp	.LBB1_2
.LBB1_16:                               # %if.then68.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpq	%r15, %r9
	movq	%r9, %rax
	movq	%r9, %rcx
	je	.LBB1_2
# %bb.17:                               # %if.end72.i
                                        #   in Loop: Header=BB1_2 Depth=2
	incq	%r9
	movq	%r8, %rdi
	leaq	.L.str.8(%rip), %rsi
	movq	%rbp, %rdx
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB1_15
.LBB1_20:                               # %if.then109.i
                                        #   in Loop: Header=BB1_1 Depth=1
	xorl	%ecx, %ecx
	cmpb	$32, 255(%rsp,%r15)
	sete	%cl
	subq	%rcx, %r15
	je	.LBB1_68
.LBB1_21:                               # %while.cond121.i
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$10, %al
	je	.LBB1_23
# %bb.22:                               # %while.body125.i
                                        #   in Loop: Header=BB1_21 Depth=2
	xorl	%edi, %edi
	movq	%r12, %rsi
	movq	%r8, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	movq	%r8, %rdi
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	movb	7(%rsp), %al
	jmp	.LBB1_21
.LBB1_23:                               # %while.end.i
                                        #   in Loop: Header=BB1_1 Depth=1
	movzbl	256(%rsp), %ecx
	movl	%ecx, %esi
	xorb	$99, %sil
	movb	257(%rsp), %dl
	movb	258(%rsp), %al
	movl	%edx, %edi
	xorb	$100, %dil
	orb	%sil, %dil
	movl	%eax, %esi
	xorb	$32, %sil
	orb	%dil, %sil
	jne	.LBB1_30
# %bb.24:                               # %if.then151.i
                                        #   in Loop: Header=BB1_1 Depth=1
	leaq	259(%rsp), %rdi
	pushq	$80
	popq	%rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB1_25
.LBB1_65:                               # %if.then388.i
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%r8, %rdi
	leaq	.L.str.12(%rip), %rsi
	movq	%r8, %rdx
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
.LBB1_66:                               # %process_line.exit.thread
                                        #   in Loop: Header=BB1_1 Depth=1
	leaq	.L.str.1(%rip), %rsi
	jmp	.LBB1_70
.LBB1_30:                               # %if.end156.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpq	$4, %r15
	je	.LBB1_33
# %bb.31:                               # %if.end156.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpq	$1, %r15
	jne	.LBB1_43
# %bb.32:                               # %land.lhs.true159.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$113, %ecx
	je	.LBB1_38
	jmp	.LBB1_43
.LBB1_33:                               # %land.lhs.true167.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$112, %ecx
	je	.LBB1_39
# %bb.34:                               # %land.lhs.true167.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$101, %ecx
	jne	.LBB1_43
# %bb.35:                               # %land.lhs.true172.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpb	$120, %dl
	jne	.LBB1_43
# %bb.36:                               # %land.lhs.true172.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpb	$105, %al
	jne	.LBB1_43
# %bb.37:                               # %land.lhs.true172.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpb	$116, 259(%rsp)
	je	.LBB1_38
	jmp	.LBB1_43
.LBB1_39:                               # %land.lhs.true200.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpb	$111, %dl
	jne	.LBB1_43
# %bb.40:                               # %land.lhs.true200.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpb	$111, %al
	jne	.LBB1_43
# %bb.41:                               # %land.lhs.true200.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpb	$102, 259(%rsp)
	jne	.LBB1_43
# %bb.42:                               # %land.lhs.true215.i
                                        #   in Loop: Header=BB1_1 Depth=1
	pushq	$39
	popq	%rax
	#APP
	syscall

	#NO_APP
	cmpq	$1, %rax
	je	.LBB1_66
.LBB1_43:                               # %if.end222.i
                                        #   in Loop: Header=BB1_1 Depth=1
	andq	$0, 128(%rsp)
	pushq	$57
	popq	%rax
	#APP
	syscall

	#NO_APP
	movq	%rax, %r9
	testl	%r9d, %r9d
	je	.LBB1_44
# %bb.60:                               # %if.end318.i
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	$2, 128(%rsp)
	pushq	$2
	popq	%rdi
	leaq	128(%rsp), %rsi
	xorl	%edx, %edx
	movq	%r10, %r15
	pushq	$8
	popq	%r10
	pushq	$14
	popq	%rax
	#APP
	syscall

	#NO_APP
	movl	$21505, %esi                    # imm = 0x5401
	xorl	%edi, %edi
	leaq	1264(%rsp), %rdx
	pushq	$16
	popq	%r10
	movq	%r10, %rax
	#APP
	syscall

	#NO_APP
	orb	$11, 1276(%rsp)
	movl	$21506, %esi                    # imm = 0x5402
	xorl	%edi, %edi
	movq	%r10, %rax
	#APP
	syscall

	#NO_APP
	movq	%r8, %rdi
	leaq	.L.str.10(%rip), %rsi
	pushq	$5
	popq	%rdx
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	movslq	%r9d, %rdi
	leaq	16(%rsp), %rsi
	xorl	%edx, %edx
	xorl	%r10d, %r10d
	pushq	$61
	popq	%rax
	#APP
	syscall

	#NO_APP
	movq	%r15, %r10
	testq	%rax, %rax
	pushq	$-3
	popq	%rax
	jle	.LBB1_25
# %bb.61:                               # %if.end355.i
                                        #   in Loop: Header=BB1_1 Depth=1
	andb	$-12, 1276(%rsp)
	movl	$21506, %esi                    # imm = 0x5402
	xorl	%edi, %edi
	leaq	1264(%rsp), %rdx
	pushq	$16
	popq	%rax
	#APP
	syscall

	#NO_APP
	movq	%r8, %rdi
	leaq	.L.str.11(%rip), %rsi
	pushq	$5
	popq	%rdx
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	movl	16(%rsp), %eax
	testb	$127, %al
	je	.LBB1_63
# %bb.62:                               # %if.then371.i
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%r8, %rdi
	leaq	.L.str.12(%rip), %rsi
	movq	%r8, %rdx
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	pushq	$-1
	popq	%rax
	jmp	.LBB1_25
.LBB1_63:                               # %if.end378.i
                                        #   in Loop: Header=BB1_1 Depth=1
	movzbl	%ah, %eax
.LBB1_25:                               # %process_line.exit
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpq	$-3, %rax
	leaq	.L.str.1(%rip), %rsi
	je	.LBB1_70
# %bb.26:                               # %process_line.exit
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpq	$60, %rax
	je	.LBB1_67
# %bb.27:                               # %process_line.exit
                                        #   in Loop: Header=BB1_1 Depth=1
	testq	%rax, %rax
	je	.LBB1_68
# %bb.28:                               # %process_line.exit
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpq	$-1, %rax
	jne	.LBB1_69
# %bb.29:                               # %sw.bb1
                                        #   in Loop: Header=BB1_1 Depth=1
	leaq	.L.str.2(%rip), %rsi
	jmp	.LBB1_70
.LBB1_68:                               # %sw.bb3
                                        #   in Loop: Header=BB1_1 Depth=1
	leaq	.L.str.4(%rip), %rsi
.LBB1_70:                               # %sw.epilog
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%r8, %rdi
	pushq	$14
	popq	%rdx
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	movq	%r10, %rax
.LBB1_71:                               # %while.cond11
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$0, (%rax)
	je	.LBB1_1
# %bb.72:                               # %while.body12
                                        #   in Loop: Header=BB1_71 Depth=2
	movb	$0, (%rax)
	incq	%rax
	jmp	.LBB1_71
.LBB1_67:                               # %sw.bb2
                                        #   in Loop: Header=BB1_1 Depth=1
	leaq	.L.str.3(%rip), %rsi
	jmp	.LBB1_70
.LBB1_69:                               # %sw.default
                                        #   in Loop: Header=BB1_1 Depth=1
	leaq	.L.str.5(%rip), %rsi
	jmp	.LBB1_70
.LBB1_73:                               # %if.then.i
	pushq	$60
	popq	%rax
	xorl	%edi, %edi
	#APP
	syscall

	#NO_APP
.LBB1_44:                               # %if.then229.i
	pushq	$2
	popq	%rdi
	leaq	128(%rsp), %rsi
	pushq	$8
	popq	%r10
	pushq	$14
	popq	%rax
	xorl	%edx, %edx
	#APP
	syscall

	#NO_APP
	cmpq	$2, %r15
	movq	%r8, %rbx
	cmovgeq	%r15, %rbx
.LBB1_45:                               # %while.cond236.i
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%r8, %r15
	jle	.LBB1_48
# %bb.46:                               # %land.lhs.true240.i
                                        #   in Loop: Header=BB1_45 Depth=1
	movzbl	256(%rsp,%r8), %eax
	testb	$-33, %al
	je	.LBB1_49
# %bb.47:                               # %while.body245.i
                                        #   in Loop: Header=BB1_45 Depth=1
	incq	%r8
	jmp	.LBB1_45
.LBB1_48:                               # %while.end247.isplit
	leaq	255(%rsp,%r8), %rax
	jmp	.LBB1_50
.LBB1_49:                               # %land.lhs.true240.i.while.end247.i_crit_edge
	leaq	256(%rsp,%r8), %rax
	movq	%r8, %rbx
.LBB1_50:                               # %while.end247.i
	leaq	256(%rsp), %rcx
	movq	%rcx, 1264(%rsp)
	movb	$0, 256(%rsp,%rbx)
	pushq	$1
	popq	%rdx
	movl	%ebx, %esi
.LBB1_51:                               # %while.cond251.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_53 Depth 2
	movslq	%esi, %rdi
	cmpq	%rdi, %r15
	jle	.LBB1_56
# %bb.52:                               # %while.cond256.i.preheader
                                        #   in Loop: Header=BB1_51 Depth=1
	incl	%esi
	movslq	%esi, %r8
	leaq	256(%rsp,%r8), %r8
.LBB1_53:                               # %while.cond256.i
                                        #   Parent Loop BB1_51 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incq	%rax
	movzbl	(%rax), %r9d
	testb	$-33, %r9b
	je	.LBB1_55
# %bb.54:                               # %while.body269.i
                                        #   in Loop: Header=BB1_53 Depth=2
	incl	%esi
	incq	%r8
	jmp	.LBB1_53
.LBB1_55:                               # %while.end271.i
                                        #   in Loop: Header=BB1_51 Depth=1
	leaq	1(%rdi,%rcx), %rdi
	movq	%rdi, 1264(%rsp,%rdx,8)
	movb	$0, (%r8)
	incq	%rdx
	jmp	.LBB1_51
.LBB1_56:                               # %while.end281.i
	movl	%edx, %eax
	andq	$0, 1264(%rsp,%rax,8)
	cmpb	$47, 256(%rsp)
	jne	.LBB1_57
# %bb.58:                               # %if.else.i
	leaq	256(%rsp), %rdi
	leaq	1264(%rsp), %rsi
	pushq	$59
	popq	%rax
	movq	8(%rsp), %rdx                   # 8-byte Reload
	#APP
	syscall

	#NO_APP
	jmp	.LBB1_59
.LBB1_57:                               # %if.then289.i
	leaq	21(%rsp), %rdi
	movb	$47, -1(%rdi)
	movl	$1852400175, -5(%rdi)           # imm = 0x6E69622F
	leaq	256(%rsp), %rsi
	movq	%rbx, %rdx
	callq	memcpy@PLT
	addl	$5, %ebx
	movb	$0, 16(%rsp,%rbx)
	leaq	16(%rsp), %rdi
	leaq	1264(%rsp), %rsi
	pushq	$59
	popq	%rax
	movq	8(%rsp), %rdx                   # 8-byte Reload
	#APP
	syscall

	#NO_APP
.LBB1_59:                               # %if.end313.i
	pushq	$60
	popq	%rax
	movq	%rax, %rdi
	#APP
	syscall

	#NO_APP
.LBB1_38:                               # %if.then187.i
	pushq	$60
	popq	%rax
	xorl	%edi, %edi
	#APP
	syscall

	#NO_APP
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.size	.Lmain$local, .Lfunc_end1-main
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	" \342\235\257 \033[5 q"
	.size	.L.str, 11

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"\033[35m\342\230\240>\033[0m "
	.size	.L.str.1, 15

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"\033[34m!\342\235\257\033[0m "
	.size	.L.str.2, 15

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"\033[33m?\342\235\257\033[0m "
	.size	.L.str.3, 15

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"\033[32m \342\235\257\033[0m "
	.size	.L.str.4, 15

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"\033[31mx\342\235\257\033[0m "
	.size	.L.str.5, 15

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"\033[D \033[D"
	.size	.L.str.6, 8

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"\033[D"
	.size	.L.str.7, 4

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"\033[C"
	.size	.L.str.8, 4

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"/bin/"
	.size	.L.str.9, 6

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"\033[0 q"
	.size	.L.str.10, 6

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"\033[5 q"
	.size	.L.str.11, 6

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"\n"
	.size	.L.str.12, 2

	.section	".note.GNU-stack","",@progbits
