	.file	"pid1sh.c"
                                        # Start of file scope inline assembly
	.globl	_start
_start:
	movq	(%rsp), %rdi
	leaq	8(%rsp), %rsi
	jmp	main

                                        # End of file scope inline assembly
	.text
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
# %bb.0:                                # %entry
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$1208, %rsp                     # imm = 0x4B8
	movq	%rsi, 16(%rsp)                  # 8-byte Spill
	movl	%edi, 12(%rsp)                  # 4-byte Spill
	leaq	80(%rsp), %rdx
	pushq	$16
	popq	%r8
	movl	$21505, %esi                    # imm = 0x5401
	xorl	%edi, %edi
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	andb	$-11, 12(%rdx)
	movl	$21506, %esi                    # imm = 0x5402
	xorl	%edi, %edi
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	leaq	208(%rsp), %rsi
	movq	$2, (%rsi)
	pushq	$2
	popq	%r9
	pushq	$8
	popq	%r10
	pushq	$14
	popq	%rax
	movq	%r9, %rdi
	xorl	%edx, %edx
	#APP
	syscall

	#NO_APP
	pushq	$10
	popq	%rdx
	pushq	$1
	popq	%rbp
	movl	$.L.str, %esi
	movq	%rbp, %rdi
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	leaq	11(%rsp), %rbx
.LBB0_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
                                        #       Child Loop BB0_10 Depth 3
                                        #         Child Loop BB0_13 Depth 4
                                        #     Child Loop BB0_35 Depth 2
                                        #     Child Loop BB0_57 Depth 2
                                        #     Child Loop BB0_70 Depth 2
	xorl	%r8d, %r8d
	xorl	%eax, %eax
.LBB0_2:                                # %while.body.i
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_10 Depth 3
                                        #         Child Loop BB0_13 Depth 4
	movq	%rax, %r14
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	%rbp, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	testq	%rax, %rax
	jle	.LBB0_74
# %bb.3:                                # %if.end.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movq	%r8, %r10
	movzbl	11(%rsp), %ecx
	cmpl	$3, %ecx
	movq	%r14, %rax
	je	.LBB0_2
# %bb.4:                                # %if.end.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$9, %ecx
	je	.LBB0_9
# %bb.5:                                # %if.end.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$27, %ecx
	je	.LBB0_19
# %bb.6:                                # %if.end.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$127, %ecx
	jne	.LBB0_25
# %bb.7:                                # %if.then3.i
                                        #   in Loop: Header=BB0_2 Depth=2
	testq	%r10, %r10
	movl	$0, %r8d
	movq	%r14, %rax
	je	.LBB0_2
# %bb.8:                                # %if.end7.i
                                        #   in Loop: Header=BB0_2 Depth=2
	leaq	-1(%r10), %r8
	cmpq	%r14, %r10
	cmoveq	%r8, %r14
	movb	$32, 207(%rsp,%r10)
	movl	$.L.str.6, %esi
	movq	%rbp, %rdi
	pushq	$7
	popq	%rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	movq	%r14, %rax
	jmp	.LBB0_2
.LBB0_9:                                # %if.then24.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movq	%r10, 24(%rsp)                  # 8-byte Spill
	movq	%r14, 32(%rsp)                  # 8-byte Spill
	movl	$.L.str.7, %edi
	movl	$65536, %esi                    # imm = 0x10000
	movq	%r9, %rax
	#APP
	syscall

	#NO_APP
	movq	%rax, %r8
	movl	$.L.str.8, %esi
	movq	%rbp, %rdi
	movq	%r9, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	movl	$.L.str.14, %esi
	movq	%rbp, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	movslq	%r8d, %r15
	xorl	%r13d, %r13d
.LBB0_10:                               # %for.cond.i.i
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_13 Depth 4
	cmpl	$60, %r13d
	je	.LBB0_18
# %bb.11:                               # %for.body.i.i
                                        #   in Loop: Header=BB0_10 Depth=3
	movq	%r15, %rdi
	leaq	80(%rsp), %rsi
	pushq	$40
	popq	%rdx
	pushq	$78
	popq	%rax
	#APP
	syscall

	#NO_APP
	movq	%rax, %r14
	decl	%eax
	cmpl	$39, %eax
	ja	.LBB0_18
# %bb.12:                               # %while.cond.i.i.preheader
                                        #   in Loop: Header=BB0_10 Depth=3
	xorl	%eax, %eax
.LBB0_13:                               # %while.cond.i.i
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        #       Parent Loop BB0_10 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	cmpl	%r14d, %eax
	jge	.LBB0_17
# %bb.14:                               # %while.body.i.i
                                        #   in Loop: Header=BB0_13 Depth=4
	movl	%eax, %ecx
	leaq	98(%rsp,%rcx), %rbx
	movzwl	-2(%rbx), %r12d
	addl	%eax, %r12d
	cmpb	$46, (%rbx)
	movl	%r12d, %eax
	je	.LBB0_13
# %bb.15:                               # %land.lhs.true.i.i
                                        #   in Loop: Header=BB0_13 Depth=4
	movl	$269, %eax                      # imm = 0x10D
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%rbp, %rdx
	#APP
	syscall

	#NO_APP
	testq	%rax, %rax
	movl	%r12d, %eax
	jne	.LBB0_13
# %bb.16:                               # %while.cond.i.preheader
                                        #   in Loop: Header=BB0_13 Depth=4
	movq	%rbx, %rdi
	callq	strlen
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	movl	$.L.str.14, %esi
	movq	%rbp, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	movl	%r12d, %eax
	jmp	.LBB0_13
.LBB0_17:                               # %for.inc.i.i
                                        #   in Loop: Header=BB0_10 Depth=3
	incl	%r13d
	jmp	.LBB0_10
.LBB0_18:                               # %tab_completion.exit.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$.L.str.9, %esi
	movq	%rbp, %rdi
	pushq	$2
	popq	%r9
	movq	%r9, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	movq	%r15, %rdi
	pushq	$3
	popq	%rax
	#APP
	syscall

	#NO_APP
	movq	24(%rsp), %r8                   # 8-byte Reload
	movq	32(%rsp), %rax                  # 8-byte Reload
	leaq	11(%rsp), %rbx
	jmp	.LBB0_2
.LBB0_19:                               # %if.then52.i
                                        #   in Loop: Header=BB0_2 Depth=2
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	%rbp, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	cmpb	$91, 11(%rsp)
	jne	.LBB0_67
# %bb.20:                               # %if.then62.i
                                        #   in Loop: Header=BB0_2 Depth=2
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	%rbp, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	movzbl	11(%rsp), %ecx
	leal	-65(%rcx), %eax
	cmpl	$2, %eax
	movq	%r10, %r8
	movq	%r14, %rax
	jb	.LBB0_2
# %bb.21:                               # %if.then62.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$67, %ecx
	je	.LBB0_29
# %bb.22:                               # %if.then62.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$68, %ecx
	jne	.LBB0_67
# %bb.23:                               # %if.then72.i
                                        #   in Loop: Header=BB0_2 Depth=2
	testq	%r10, %r10
	movl	$0, %r8d
	movq	%r14, %rax
	je	.LBB0_2
# %bb.24:                               # %if.end76.i
                                        #   in Loop: Header=BB0_2 Depth=2
	decq	%r10
	movl	$.L.str.10, %esi
	movq	%rbp, %rdi
	pushq	$3
	popq	%rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB0_31
.LBB0_25:                               # %if.end116.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	movq	%rbp, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	movzbl	11(%rsp), %eax
	cmpl	$35, %eax
	je	.LBB0_32
# %bb.26:                               # %if.end116.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$10, %eax
	je	.LBB0_32
# %bb.27:                               # %if.end320.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpb	$31, %al
	jle	.LBB0_39
# %bb.28:                               # %if.end331.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movb	%al, 208(%rsp,%r10)
	xorl	%eax, %eax
	cmpq	%r14, %r10
	sete	%al
	addq	%r14, %rax
	incq	%r10
	movq	%r10, %r8
	jmp	.LBB0_2
.LBB0_29:                               # %if.then88.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpq	%r14, %r10
	movq	%r10, %r8
	movq	%r10, %rax
	je	.LBB0_2
# %bb.30:                               # %if.end92.i
                                        #   in Loop: Header=BB0_2 Depth=2
	incq	%r10
	movl	$.L.str.11, %esi
	movq	%rbp, %rdi
	pushq	$3
	popq	%rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
.LBB0_31:                               # %while.body.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movq	%r10, %r8
	movq	%r14, %rax
	jmp	.LBB0_2
.LBB0_32:                               # %if.then129.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$32, 207(%rsp,%r14)
	jne	.LBB0_35
# %bb.33:                               # %if.then134.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movb	$0, 207(%rsp,%r14)
	decq	%r14
	jmp	.LBB0_35
.LBB0_34:                               # %while.body142.i
                                        #   in Loop: Header=BB0_35 Depth=2
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	%rbp, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	movq	%rbp, %rdi
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	movb	11(%rsp), %al
.LBB0_35:                               # %while.cond138.i
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$10, %al
	jne	.LBB0_34
# %bb.36:                               # %while.end.i
                                        #   in Loop: Header=BB0_1 Depth=1
	testq	%r14, %r14
	je	.LBB0_68
# %bb.37:                               # %if.end158.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movzbl	208(%rsp), %ecx
	movl	%ecx, %esi
	xorb	$99, %sil
	movb	209(%rsp), %dl
	movb	210(%rsp), %al
	movl	%edx, %edi
	xorb	$100, %dil
	orb	%sil, %dil
	movl	%eax, %esi
	xorb	$32, %sil
	orb	%dil, %sil
	jne	.LBB0_40
# %bb.38:                               # %if.then172.i
                                        #   in Loop: Header=BB0_1 Depth=1
	leaq	211(%rsp), %rdi
	pushq	$80
	popq	%rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB0_62
.LBB0_39:                               # %if.then324.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.14, %esi
	movq	%rbp, %rdi
	movq	%rbp, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB0_67
.LBB0_40:                               # %if.end177.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$4, %r14
	je	.LBB0_43
# %bb.41:                               # %if.end177.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$1, %r14
	jne	.LBB0_52
# %bb.42:                               # %land.lhs.true180.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpl	$113, %ecx
	je	.LBB0_74
	jmp	.LBB0_52
.LBB0_43:                               # %land.lhs.true188.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpl	$112, %ecx
	je	.LBB0_48
# %bb.44:                               # %land.lhs.true188.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpl	$101, %ecx
	jne	.LBB0_52
# %bb.45:                               # %land.lhs.true193.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$120, %dl
	jne	.LBB0_52
# %bb.46:                               # %land.lhs.true193.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$105, %al
	jne	.LBB0_52
# %bb.47:                               # %land.lhs.true193.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$116, 211(%rsp)
	jne	.LBB0_52
	jmp	.LBB0_74
.LBB0_48:                               # %land.lhs.true217.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$111, %dl
	jne	.LBB0_52
# %bb.49:                               # %land.lhs.true217.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$111, %al
	jne	.LBB0_52
# %bb.50:                               # %land.lhs.true217.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$102, 211(%rsp)
	jne	.LBB0_52
# %bb.51:                               # %land.lhs.true232.i
                                        #   in Loop: Header=BB0_1 Depth=1
	pushq	$39
	popq	%rax
	#APP
	syscall

	#NO_APP
	cmpq	$1, %rax
	je	.LBB0_67
.LBB0_52:                               # %if.end239.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$21505, %esi                    # imm = 0x5401
	xorl	%edi, %edi
	leaq	44(%rsp), %rdx
	pushq	$16
	popq	%r8
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	orb	$10, 56(%rsp)
	movl	$21506, %esi                    # imm = 0x5402
	xorl	%edi, %edi
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	movl	$.L.str.12, %esi
	movq	%rbp, %rdi
	pushq	$5
	popq	%rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	pushq	$57
	popq	%rax
	#APP
	syscall

	#NO_APP
	testl	%eax, %eax
	je	.LBB0_75
# %bb.53:                               # %if.end275.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movslq	%eax, %rdi
	leaq	80(%rsp), %rsi
	xorl	%edx, %edx
	xorl	%r10d, %r10d
	pushq	$61
	popq	%rax
	#APP
	syscall

	#NO_APP
	testq	%rax, %rax
	jle	.LBB0_56
# %bb.54:                               # %if.end292.i
                                        #   in Loop: Header=BB0_1 Depth=1
	andb	$-11, 56(%rsp)
	movl	$21506, %esi                    # imm = 0x5402
	xorl	%edi, %edi
	leaq	44(%rsp), %rdx
	pushq	$16
	popq	%rax
	#APP
	syscall

	#NO_APP
	movl	$.L.str.13, %esi
	movq	%rbp, %rdi
	pushq	$5
	popq	%rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	movl	80(%rsp), %eax
	testb	$127, %al
	je	.LBB0_61
# %bb.55:                               # %if.then308.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.14, %esi
	movq	%rbp, %rdi
	movq	%rbp, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	pushq	$-1
	jmp	.LBB0_60
.LBB0_56:                               # %while.cond287.i.preheader
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%r14, %rax
.LBB0_57:                               # %while.cond287.i
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	subq	$1, %rax
	jb	.LBB0_59
# %bb.58:                               # %while.body288.i
                                        #   in Loop: Header=BB0_57 Depth=2
	movb	$0, 207(%rsp,%r14)
	movq	%rax, %r14
	jmp	.LBB0_57
.LBB0_59:                               #   in Loop: Header=BB0_1 Depth=1
	pushq	$-3
.LBB0_60:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	popq	%rax
	jmp	.LBB0_62
.LBB0_61:                               # %if.end315.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movzbl	%ah, %eax
.LBB0_62:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$-3, %rax
	je	.LBB0_67
# %bb.63:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$60, %rax
	je	.LBB0_72
# %bb.64:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	testq	%rax, %rax
	je	.LBB0_68
# %bb.65:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$-1, %rax
	jne	.LBB0_73
# %bb.66:                               # %sw.bb1
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.2, %esi
	jmp	.LBB0_69
.LBB0_67:                               # %process_line.exit.thread
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.1, %esi
	jmp	.LBB0_69
.LBB0_68:                               # %sw.bb3
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.4, %esi
.LBB0_69:                               # %sw.epilog
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%rbp, %rdi
	pushq	$14
	popq	%rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	leaq	208(%rsp), %rax
.LBB0_70:                               # %while.cond11
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$0, (%rax)
	je	.LBB0_1
# %bb.71:                               # %while.body12
                                        #   in Loop: Header=BB0_70 Depth=2
	movb	$0, (%rax)
	incq	%rax
	jmp	.LBB0_70
.LBB0_72:                               # %sw.bb2
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.3, %esi
	jmp	.LBB0_69
.LBB0_73:                               # %sw.default
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.5, %esi
	jmp	.LBB0_69
.LBB0_74:                               # %if.then.i
	callq	clean_exit
.LBB0_75:                               # %if.then264.i
	movslq	12(%rsp), %rax                  # 4-byte Folded Reload
	movq	16(%rsp), %rcx                  # 8-byte Reload
	leaq	8(%rcx,%rax,8), %r8
	leaq	80(%rsp), %rsi
	andq	$0, (%rsi)
	pushq	$2
	popq	%rdi
	pushq	$8
	popq	%r10
	pushq	$14
	popq	%rax
	xorl	%edx, %edx
	#APP
	syscall

	#NO_APP
	leaq	208(%rsp), %rdi
	movq	%r14, %rsi
	movq	%r8, %rdx
	callq	exec
	pushq	$60
	popq	%rax
	movq	%rax, %rdi
	#APP
	syscall

	#NO_APP
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.type	exec,@function                  # -- Begin function exec
exec:                                   # @exec
# %bb.0:                                # %entry
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$920, %rsp                      # imm = 0x398
	movq	%rdx, %rbx
	movq	%rdi, %r14
	cmpq	$2, %rsi
	pushq	$1
	popq	%rcx
	movq	%rcx, %r15
	cmovgeq	%rsi, %r15
.LBB1_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rcx, %rsi
	jle	.LBB1_4
# %bb.2:                                # %land.lhs.true
                                        #   in Loop: Header=BB1_1 Depth=1
	movzbl	(%r14,%rcx), %eax
	testb	$-33, %al
	je	.LBB1_5
# %bb.3:                                # %while.body
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%rcx
	jmp	.LBB1_1
.LBB1_5:                                # %land.lhs.true.while.end_crit_edge
	leaq	(%r14,%rcx), %rax
	movq	%rcx, %r15
	jmp	.LBB1_6
.LBB1_4:                                # %while.endsplit
	leaq	-1(%r14,%rcx), %rax
.LBB1_6:                                # %while.end
	movq	%r14, 112(%rsp)
	movb	$0, (%r14,%r15)
	pushq	$1
	popq	%rcx
	movl	%r15d, %edx
.LBB1_7:                                # %while.cond8
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_9 Depth 2
	movslq	%edx, %rdi
	cmpq	%rdi, %rsi
	jle	.LBB1_12
# %bb.8:                                # %while.cond13.preheader
                                        #   in Loop: Header=BB1_7 Depth=1
	incl	%edx
	movslq	%edx, %r8
	addq	%r14, %r8
.LBB1_9:                                # %while.cond13
                                        #   Parent Loop BB1_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incq	%rax
	movzbl	(%rax), %r9d
	testb	$-33, %r9b
	je	.LBB1_11
# %bb.10:                               # %while.body26
                                        #   in Loop: Header=BB1_9 Depth=2
	incl	%edx
	incq	%r8
	jmp	.LBB1_9
.LBB1_11:                               # %while.end28
                                        #   in Loop: Header=BB1_7 Depth=1
	leaq	1(%rdi,%r14), %rdi
	movq	%rdi, 112(%rsp,%rcx,8)
	movb	$0, (%r8)
	incq	%rcx
	jmp	.LBB1_7
.LBB1_12:                               # %while.end37
	movl	%ecx, %eax
	andq	$0, 112(%rsp,%rax,8)
	cmpb	$47, (%r14)
	jne	.LBB1_13
# %bb.14:                               # %if.else
	leaq	112(%rsp), %rsi
	pushq	$59
	popq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rdx
	#APP
	syscall

	#NO_APP
	jmp	.LBB1_15
.LBB1_13:                               # %if.then
	movq	%rsp, %r12
	pushq	$5
	popq	%rdx
	movl	$.L.str.15, %esi
	movq	%r12, %rdi
	callq	memcpy
	leaq	5(%rsp), %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	memcpy
	addl	$5, %r15d
	movb	$0, (%rsp,%r15)
	leaq	112(%rsp), %rsi
	pushq	$59
	popq	%rax
	movq	%r12, %rdi
	movq	%rbx, %rdx
	#APP
	syscall

	#NO_APP
.LBB1_15:                               # %if.end
	addq	$920, %rsp                      # imm = 0x398
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end1:
	.size	exec, .Lfunc_end1-exec
                                        # -- End function
	.type	clean_exit,@function            # -- Begin function clean_exit
clean_exit:                             # @clean_exit
# %bb.0:                                # %entry
	leaq	-36(%rsp), %rdx
	movabsq	$16, %r8
	movl	$21505, %esi                    # imm = 0x5401
	xorl	%edi, %edi
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	orb	$10, 12(%rdx)
	movl	$21506, %esi                    # imm = 0x5402
	xorl	%edi, %edi
	movq	%r8, %rax
	#APP
	syscall

	#NO_APP
	movabsq	$60, %rax
	xorl	%edi, %edi
	#APP
	syscall

	#NO_APP
.Lfunc_end2:
	.size	clean_exit, .Lfunc_end2-clean_exit
                                        # -- End function
	.type	strlen,@function                # -- Begin function strlen
strlen:                                 # @strlen
# %bb.0:                                # %entry
	pushq	$-1
	popq	%rax
.LBB3_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$0, 1(%rdi,%rax)
	leaq	1(%rax), %rax
	jne	.LBB3_1
# %bb.2:                                # %while.end
	retq
.Lfunc_end3:
	.size	strlen, .Lfunc_end3-strlen
                                        # -- End function
	.type	memcpy,@function                # -- Begin function memcpy
memcpy:                                 # @memcpy
# %bb.0:                                # %entry
	movq	%rdi, %rax
	xorl	%ecx, %ecx
.LBB4_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rcx, %rdx
	je	.LBB4_3
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	movb	(%rsi,%rcx), %dil
	movb	%dil, (%rax,%rcx)
	incq	%rcx
	jmp	.LBB4_1
.LBB4_3:                                # %for.end
	retq
.Lfunc_end4:
	.size	memcpy, .Lfunc_end4-memcpy
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
	.asciz	"/bin"
	.size	.L.str.7, 5

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"\0337"
	.size	.L.str.8, 3

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"\0338"
	.size	.L.str.9, 3

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"\033[D"
	.size	.L.str.10, 4

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"\033[C"
	.size	.L.str.11, 4

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"\033[0 q"
	.size	.L.str.12, 6

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"\033[5 q"
	.size	.L.str.13, 6

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"\n"
	.size	.L.str.14, 2

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"/bin/"
	.size	.L.str.15, 6

	.section	".note.GNU-stack","",@progbits
