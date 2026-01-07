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
	subq	$1192, %rsp                     # imm = 0x4A8
	movq	%rsi, 16(%rsp)                  # 8-byte Spill
	movl	%edi, 12(%rsp)                  # 4-byte Spill
	leaq	64(%rsp), %rdx
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
	leaq	192(%rsp), %rsi
	movq	$2, (%rsi)
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
	leaq	.L.str(%rip), %rsi
	pushq	$10
	popq	%rdx
	pushq	$1
	popq	%r13
	movq	%r13, %rdi
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	leaq	11(%rsp), %r8
	pushq	$3
	popq	%rbx
	leaq	.L.str.7(%rip), %rbp
	leaq	.L.str.6(%rip), %r14
	pushq	$7
	popq	%r9
.LBB1_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #     Child Loop BB1_27 Depth 2
                                        #     Child Loop BB1_50 Depth 2
                                        #     Child Loop BB1_62 Depth 2
	xorl	%eax, %eax
	xorl	%r15d, %r15d
.LBB1_2:                                # %while.body.i
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, %r10
	xorl	%edi, %edi
	movq	%r8, %rsi
	movq	%r13, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	testq	%rax, %rax
	jle	.LBB1_66
# %bb.3:                                # %if.end.i
                                        #   in Loop: Header=BB1_2 Depth=2
	movq	%r15, %r12
	movzbl	11(%rsp), %ecx
	cmpl	$3, %ecx
	movq	%r10, %rax
	je	.LBB1_2
# %bb.4:                                # %if.end.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpl	$9, %ecx
	movq	%r10, %rax
	movq	%r12, %r15
	je	.LBB1_2
# %bb.5:                                # %if.end.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpl	$27, %ecx
	je	.LBB1_11
# %bb.6:                                # %if.end.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpl	$127, %ecx
	jne	.LBB1_17
# %bb.7:                                # %if.then3.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpq	%r12, %r10
	movq	%r12, %r15
	jne	.LBB1_9
# %bb.8:                                # %if.then6.i
                                        #   in Loop: Header=BB1_2 Depth=2
	leaq	-1(%r10), %r15
	movb	$0, 191(%rsp,%r10)
.LBB1_9:                                # %if.end7.i
                                        #   in Loop: Header=BB1_2 Depth=2
	testq	%r10, %r10
	movl	$0, %eax
	je	.LBB1_2
# %bb.10:                               # %if.end11.i
                                        #   in Loop: Header=BB1_2 Depth=2
	movb	$32, 191(%rsp,%r10)
	decq	%r10
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%r9, %rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	movq	%r10, %rax
	jmp	.LBB1_2
.LBB1_11:                               # %if.then29.i
                                        #   in Loop: Header=BB1_2 Depth=2
	xorl	%edi, %edi
	movq	%r8, %rsi
	movq	%r13, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	cmpb	$91, 11(%rsp)
	jne	.LBB1_32
# %bb.12:                               # %if.then39.i
                                        #   in Loop: Header=BB1_2 Depth=2
	xorl	%edi, %edi
	movq	%r8, %rsi
	movq	%r13, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	movzbl	11(%rsp), %ecx
	leal	-65(%rcx), %eax
	cmpl	$2, %eax
	movq	%r10, %rax
	movq	%r12, %r15
	jb	.LBB1_2
# %bb.13:                               # %if.then39.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpl	$67, %ecx
	je	.LBB1_21
# %bb.14:                               # %if.then39.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpl	$68, %ecx
	jne	.LBB1_32
# %bb.15:                               # %if.then49.i
                                        #   in Loop: Header=BB1_2 Depth=2
	testq	%r10, %r10
	movl	$0, %eax
	movq	%r12, %r15
	je	.LBB1_2
# %bb.16:                               # %if.end53.i
                                        #   in Loop: Header=BB1_2 Depth=2
	decq	%r10
	movq	%r13, %rdi
	movq	%rbp, %rsi
	movq	%rbx, %rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB1_23
.LBB1_17:                               # %if.end93.i
                                        #   in Loop: Header=BB1_2 Depth=2
	movq	%r13, %rdi
	movq	%r8, %rsi
	movq	%r13, %rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	movzbl	11(%rsp), %eax
	cmpl	$35, %eax
	je	.LBB1_24
# %bb.18:                               # %if.end93.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpl	$10, %eax
	je	.LBB1_24
# %bb.19:                               # %if.end297.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpb	$31, %al
	jle	.LBB1_31
# %bb.20:                               # %if.end308.i
                                        #   in Loop: Header=BB1_2 Depth=2
	movb	%al, 192(%rsp,%r10)
	xorl	%r15d, %r15d
	cmpq	%r12, %r10
	sete	%r15b
	addq	%r12, %r15
	incq	%r10
	movq	%r10, %rax
	jmp	.LBB1_2
.LBB1_21:                               # %if.then65.i
                                        #   in Loop: Header=BB1_2 Depth=2
	cmpq	%r12, %r10
	movq	%r10, %rax
	movq	%r10, %r15
	je	.LBB1_2
# %bb.22:                               # %if.end69.i
                                        #   in Loop: Header=BB1_2 Depth=2
	incq	%r10
	movq	%r13, %rdi
	leaq	.L.str.8(%rip), %rsi
	movq	%rbx, %rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
.LBB1_23:                               # %while.body.i
                                        #   in Loop: Header=BB1_2 Depth=2
	movq	%r10, %rax
	movq	%r12, %r15
	jmp	.LBB1_2
.LBB1_24:                               # %if.then106.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpb	$32, 191(%rsp,%r12)
	jne	.LBB1_27
# %bb.25:                               # %if.then111.i
                                        #   in Loop: Header=BB1_1 Depth=1
	movb	$0, 191(%rsp,%r12)
	decq	%r12
	jmp	.LBB1_27
.LBB1_26:                               # %while.body119.i
                                        #   in Loop: Header=BB1_27 Depth=2
	xorl	%edi, %edi
	movq	%r8, %rsi
	movq	%r13, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	movq	%r13, %rdi
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	movb	11(%rsp), %al
.LBB1_27:                               # %while.cond115.i
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$10, %al
	jne	.LBB1_26
# %bb.28:                               # %while.end.i
                                        #   in Loop: Header=BB1_1 Depth=1
	testq	%r12, %r12
	je	.LBB1_60
# %bb.29:                               # %if.end135.i
                                        #   in Loop: Header=BB1_1 Depth=1
	movzbl	192(%rsp), %ecx
	movl	%ecx, %esi
	xorb	$99, %sil
	movb	193(%rsp), %dl
	movb	194(%rsp), %al
	movl	%edx, %edi
	xorb	$100, %dil
	orb	%sil, %dil
	movl	%eax, %esi
	xorb	$32, %sil
	orb	%dil, %sil
	jne	.LBB1_33
# %bb.30:                               # %if.then149.i
                                        #   in Loop: Header=BB1_1 Depth=1
	leaq	195(%rsp), %rdi
	pushq	$80
	popq	%rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB1_55
.LBB1_31:                               # %if.then301.i
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%r13, %rdi
	leaq	.L.str.11(%rip), %rsi
	movq	%r13, %rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
.LBB1_32:                               # %process_line.exit.thread
                                        #   in Loop: Header=BB1_1 Depth=1
	leaq	.L.str.1(%rip), %rsi
	jmp	.LBB1_61
.LBB1_33:                               # %if.end154.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpq	$4, %r12
	je	.LBB1_36
# %bb.34:                               # %if.end154.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpq	$1, %r12
	jne	.LBB1_45
# %bb.35:                               # %land.lhs.true157.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$113, %ecx
	je	.LBB1_66
	jmp	.LBB1_45
.LBB1_36:                               # %land.lhs.true165.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$112, %ecx
	je	.LBB1_41
# %bb.37:                               # %land.lhs.true165.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$101, %ecx
	jne	.LBB1_45
# %bb.38:                               # %land.lhs.true170.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpb	$120, %dl
	jne	.LBB1_45
# %bb.39:                               # %land.lhs.true170.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpb	$105, %al
	jne	.LBB1_45
# %bb.40:                               # %land.lhs.true170.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpb	$116, 195(%rsp)
	jne	.LBB1_45
	jmp	.LBB1_66
.LBB1_41:                               # %land.lhs.true194.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpb	$111, %dl
	jne	.LBB1_45
# %bb.42:                               # %land.lhs.true194.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpb	$111, %al
	jne	.LBB1_45
# %bb.43:                               # %land.lhs.true194.i
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpb	$102, 195(%rsp)
	jne	.LBB1_45
# %bb.44:                               # %land.lhs.true209.i
                                        #   in Loop: Header=BB1_1 Depth=1
	pushq	$39
	popq	%rax
	#APP
	syscall

	#NO_APP
	cmpq	$1, %rax
	je	.LBB1_32
.LBB1_45:                               # %if.end216.i
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	$21505, %esi                    # imm = 0x5401
	xorl	%edi, %edi
	leaq	28(%rsp), %rdx
	pushq	$16
	popq	%r10
	movq	%r10, %rax
	#APP
	syscall

	#NO_APP
	orb	$10, 40(%rsp)
	movl	$21506, %esi                    # imm = 0x5402
	xorl	%edi, %edi
	movq	%r10, %rax
	#APP
	syscall

	#NO_APP
	movq	%r13, %rdi
	leaq	.L.str.9(%rip), %rsi
	pushq	$5
	popq	%rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	pushq	$57
	popq	%rax
	#APP
	syscall

	#NO_APP
	testl	%eax, %eax
	je	.LBB1_67
# %bb.46:                               # %if.end252.i
                                        #   in Loop: Header=BB1_1 Depth=1
	movslq	%eax, %rdi
	leaq	64(%rsp), %rsi
	xorl	%edx, %edx
	xorl	%r10d, %r10d
	pushq	$61
	popq	%rax
	#APP
	syscall

	#NO_APP
	testq	%rax, %rax
	jle	.LBB1_49
# %bb.47:                               # %if.end269.i
                                        #   in Loop: Header=BB1_1 Depth=1
	andb	$-11, 40(%rsp)
	movl	$21506, %esi                    # imm = 0x5402
	xorl	%edi, %edi
	leaq	28(%rsp), %rdx
	pushq	$16
	popq	%rax
	#APP
	syscall

	#NO_APP
	movq	%r13, %rdi
	leaq	.L.str.10(%rip), %rsi
	pushq	$5
	popq	%rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	movl	64(%rsp), %eax
	testb	$127, %al
	je	.LBB1_54
# %bb.48:                               # %if.then285.i
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%r13, %rdi
	leaq	.L.str.11(%rip), %rsi
	movq	%r13, %rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	pushq	$-1
	jmp	.LBB1_53
.LBB1_49:                               # %while.cond264.i.preheader
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%r12, %rax
.LBB1_50:                               # %while.cond264.i
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	subq	$1, %rax
	jb	.LBB1_52
# %bb.51:                               # %while.body265.i
                                        #   in Loop: Header=BB1_50 Depth=2
	movb	$0, 191(%rsp,%r12)
	movq	%rax, %r12
	jmp	.LBB1_50
.LBB1_52:                               #   in Loop: Header=BB1_1 Depth=1
	pushq	$-3
.LBB1_53:                               # %process_line.exit
                                        #   in Loop: Header=BB1_1 Depth=1
	popq	%rax
	jmp	.LBB1_55
.LBB1_54:                               # %if.end292.i
                                        #   in Loop: Header=BB1_1 Depth=1
	movzbl	%ah, %eax
.LBB1_55:                               # %process_line.exit
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpq	$-3, %rax
	leaq	.L.str.1(%rip), %rsi
	je	.LBB1_61
# %bb.56:                               # %process_line.exit
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpq	$60, %rax
	je	.LBB1_64
# %bb.57:                               # %process_line.exit
                                        #   in Loop: Header=BB1_1 Depth=1
	testq	%rax, %rax
	je	.LBB1_60
# %bb.58:                               # %process_line.exit
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpq	$-1, %rax
	jne	.LBB1_65
# %bb.59:                               # %sw.bb1
                                        #   in Loop: Header=BB1_1 Depth=1
	leaq	.L.str.2(%rip), %rsi
	jmp	.LBB1_61
.LBB1_60:                               # %sw.bb3
                                        #   in Loop: Header=BB1_1 Depth=1
	leaq	.L.str.4(%rip), %rsi
.LBB1_61:                               # %sw.epilog
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%r13, %rdi
	pushq	$14
	popq	%rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	leaq	192(%rsp), %rax
.LBB1_62:                               # %while.cond11
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$0, (%rax)
	je	.LBB1_1
# %bb.63:                               # %while.body12
                                        #   in Loop: Header=BB1_62 Depth=2
	movb	$0, (%rax)
	incq	%rax
	jmp	.LBB1_62
.LBB1_64:                               # %sw.bb2
                                        #   in Loop: Header=BB1_1 Depth=1
	leaq	.L.str.3(%rip), %rsi
	jmp	.LBB1_61
.LBB1_65:                               # %sw.default
                                        #   in Loop: Header=BB1_1 Depth=1
	leaq	.L.str.5(%rip), %rsi
	jmp	.LBB1_61
.LBB1_66:                               # %if.then.i
	callq	clean_exit
.LBB1_67:                               # %if.then241.i
	movslq	12(%rsp), %rax                  # 4-byte Folded Reload
	movq	16(%rsp), %rcx                  # 8-byte Reload
	leaq	8(%rcx,%rax,8), %r8
	leaq	64(%rsp), %rsi
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
	leaq	192(%rsp), %rdi
	movq	%r12, %rsi
	movq	%r8, %rdx
	callq	exec
	pushq	$60
	popq	%rax
	movq	%rax, %rdi
	#APP
	syscall

	#NO_APP
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.size	.Lmain$local, .Lfunc_end1-main
                                        # -- End function
	.type	exec,@function                  # -- Begin function exec
exec:                                   # @exec
# %bb.0:                                # %entry
	pushq	%r14
	pushq	%rbx
	subq	$920, %rsp                      # imm = 0x398
	movq	%rdx, %rbx
	movq	%rdi, %rcx
	cmpq	$2, %rsi
	pushq	$1
	popq	%rdx
	movq	%rdx, %r14
	cmovgeq	%rsi, %r14
.LBB2_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rdx, %rsi
	jle	.LBB2_4
# %bb.2:                                # %land.lhs.true
                                        #   in Loop: Header=BB2_1 Depth=1
	movzbl	(%rcx,%rdx), %eax
	testb	$-33, %al
	je	.LBB2_5
# %bb.3:                                # %while.body
                                        #   in Loop: Header=BB2_1 Depth=1
	incq	%rdx
	jmp	.LBB2_1
.LBB2_5:                                # %land.lhs.true.while.end_crit_edge
	leaq	(%rcx,%rdx), %rax
	movq	%rdx, %r14
	jmp	.LBB2_6
.LBB2_4:                                # %while.endsplit
	leaq	-1(%rcx,%rdx), %rax
.LBB2_6:                                # %while.end
	movq	%rcx, 112(%rsp)
	movb	$0, (%rcx,%r14)
	pushq	$1
	popq	%rdx
	movl	%r14d, %edi
.LBB2_7:                                # %while.cond8
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_9 Depth 2
	movslq	%edi, %r8
	cmpq	%r8, %rsi
	jle	.LBB2_12
# %bb.8:                                # %while.cond13.preheader
                                        #   in Loop: Header=BB2_7 Depth=1
	incl	%edi
	movslq	%edi, %r9
	addq	%rcx, %r9
.LBB2_9:                                # %while.cond13
                                        #   Parent Loop BB2_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incq	%rax
	movzbl	(%rax), %r10d
	testb	$-33, %r10b
	je	.LBB2_11
# %bb.10:                               # %while.body26
                                        #   in Loop: Header=BB2_9 Depth=2
	incl	%edi
	incq	%r9
	jmp	.LBB2_9
.LBB2_11:                               # %while.end28
                                        #   in Loop: Header=BB2_7 Depth=1
	leaq	1(%r8,%rcx), %r8
	movq	%r8, 112(%rsp,%rdx,8)
	movb	$0, (%r9)
	incq	%rdx
	jmp	.LBB2_7
.LBB2_12:                               # %while.end37
	movl	%edx, %eax
	andq	$0, 112(%rsp,%rax,8)
	cmpb	$47, (%rcx)
	jne	.LBB2_13
# %bb.14:                               # %if.else
	leaq	112(%rsp), %rsi
	pushq	$59
	popq	%rax
	movq	%rcx, %rdi
	movq	%rbx, %rdx
	#APP
	syscall

	#NO_APP
	jmp	.LBB2_15
.LBB2_13:                               # %if.then
	leaq	5(%rsp), %rdi
	movb	$47, -1(%rdi)
	movl	$1852400175, -5(%rdi)           # imm = 0x6E69622F
	movq	%rcx, %rsi
	movq	%r14, %rdx
	callq	memcpy@PLT
	addl	$5, %r14d
	movb	$0, (%rsp,%r14)
	movq	%rsp, %rdi
	leaq	112(%rsp), %rsi
	pushq	$59
	popq	%rax
	movq	%rbx, %rdx
	#APP
	syscall

	#NO_APP
.LBB2_15:                               # %if.end
	addq	$920, %rsp                      # imm = 0x398
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end2:
	.size	exec, .Lfunc_end2-exec
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
.Lfunc_end3:
	.size	clean_exit, .Lfunc_end3-clean_exit
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
	.asciz	"\033[0 q"
	.size	.L.str.9, 6

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"\033[5 q"
	.size	.L.str.10, 6

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"\n"
	.size	.L.str.11, 2

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"/bin/"
	.size	.L.str.12, 6

	.section	".note.GNU-stack","",@progbits
