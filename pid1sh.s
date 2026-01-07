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
	popq	%r12
	pushq	$8
	popq	%r10
	pushq	$14
	popq	%rax
	movq	%r12, %rdi
	xorl	%edx, %edx
	movq	%rax, %r13
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
	leaq	11(%rsp), %r9
	pushq	$3
	popq	%rbx
	pushq	$7
	popq	%r8
.LBB0_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
                                        #     Child Loop BB0_28 Depth 2
                                        #     Child Loop BB0_50 Depth 2
                                        #     Child Loop BB0_63 Depth 2
	xorl	%eax, %eax
	xorl	%r14d, %r14d
.LBB0_2:                                # %while.body.i
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, %r10
	xorl	%edi, %edi
	movq	%r9, %rsi
	movq	%rbp, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	testq	%rax, %rax
	jle	.LBB0_67
# %bb.3:                                # %if.end.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movq	%r14, %r15
	movzbl	11(%rsp), %ecx
	cmpl	$3, %ecx
	movq	%r10, %rax
	je	.LBB0_2
# %bb.4:                                # %if.end.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$9, %ecx
	je	.LBB0_11
# %bb.5:                                # %if.end.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$27, %ecx
	je	.LBB0_13
# %bb.6:                                # %if.end.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$127, %ecx
	jne	.LBB0_19
# %bb.7:                                # %if.then3.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpq	%r15, %r10
	movq	%r15, %r14
	jne	.LBB0_9
# %bb.8:                                # %if.then6.i
                                        #   in Loop: Header=BB0_2 Depth=2
	leaq	-1(%r10), %r14
	movb	$0, 191(%rsp,%r10)
.LBB0_9:                                # %if.end7.i
                                        #   in Loop: Header=BB0_2 Depth=2
	testq	%r10, %r10
	movl	$0, %eax
	je	.LBB0_2
# %bb.10:                               # %if.end11.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movb	$32, 191(%rsp,%r10)
	decq	%r10
	movl	$.L.str.6, %esi
	movq	%rbp, %rdi
	movq	%r8, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	movq	%r10, %rax
	jmp	.LBB0_2
.LBB0_11:                               # %if.then24.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$.L.str.7, %edi
	movl	$65536, %esi                    # imm = 0x10000
	movq	%r12, %rax
	#APP
	syscall

	#NO_APP
	movslq	%eax, %rdi
	movq	%rbx, %rax
	#APP
	syscall

	#NO_APP
.LBB0_12:                               # %while.body.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movq	%r10, %rax
	movq	%r15, %r14
	jmp	.LBB0_2
.LBB0_13:                               # %if.then40.i
                                        #   in Loop: Header=BB0_2 Depth=2
	xorl	%edi, %edi
	movq	%r9, %rsi
	movq	%rbp, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	cmpb	$91, 11(%rsp)
	jne	.LBB0_60
# %bb.14:                               # %if.then50.i
                                        #   in Loop: Header=BB0_2 Depth=2
	xorl	%edi, %edi
	movq	%r9, %rsi
	movq	%rbp, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	movzbl	11(%rsp), %ecx
	leal	-65(%rcx), %eax
	cmpl	$2, %eax
	movq	%r10, %rax
	movq	%r15, %r14
	jb	.LBB0_2
# %bb.15:                               # %if.then50.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$67, %ecx
	je	.LBB0_23
# %bb.16:                               # %if.then50.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$68, %ecx
	jne	.LBB0_60
# %bb.17:                               # %if.then60.i
                                        #   in Loop: Header=BB0_2 Depth=2
	testq	%r10, %r10
	movl	$0, %eax
	movq	%r15, %r14
	je	.LBB0_2
# %bb.18:                               # %if.end64.i
                                        #   in Loop: Header=BB0_2 Depth=2
	decq	%r10
	movl	$.L.str.8, %esi
	movq	%rbp, %rdi
	movq	%rbx, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB0_12
.LBB0_19:                               # %if.end104.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movq	%rbp, %rdi
	movq	%r9, %rsi
	movq	%rbp, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	movzbl	11(%rsp), %eax
	cmpl	$35, %eax
	je	.LBB0_25
# %bb.20:                               # %if.end104.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$10, %eax
	je	.LBB0_25
# %bb.21:                               # %if.end308.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpb	$31, %al
	jle	.LBB0_32
# %bb.22:                               # %if.end319.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movb	%al, 192(%rsp,%r10)
	xorl	%r14d, %r14d
	cmpq	%r15, %r10
	sete	%r14b
	addq	%r15, %r14
	incq	%r10
	movq	%r10, %rax
	jmp	.LBB0_2
.LBB0_23:                               # %if.then76.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpq	%r15, %r10
	movq	%r10, %rax
	movq	%r10, %r14
	je	.LBB0_2
# %bb.24:                               # %if.end80.i
                                        #   in Loop: Header=BB0_2 Depth=2
	incq	%r10
	movl	$.L.str.9, %esi
	movq	%rbp, %rdi
	movq	%rbx, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB0_12
.LBB0_25:                               # %if.then117.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$32, 191(%rsp,%r15)
	jne	.LBB0_28
# %bb.26:                               # %if.then122.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movb	$0, 191(%rsp,%r15)
	decq	%r15
	jmp	.LBB0_28
.LBB0_27:                               # %while.body130.i
                                        #   in Loop: Header=BB0_28 Depth=2
	xorl	%edi, %edi
	movq	%r9, %rsi
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
.LBB0_28:                               # %while.cond126.i
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$10, %al
	jne	.LBB0_27
# %bb.29:                               # %while.end.i
                                        #   in Loop: Header=BB0_1 Depth=1
	testq	%r15, %r15
	je	.LBB0_61
# %bb.30:                               # %if.end146.i
                                        #   in Loop: Header=BB0_1 Depth=1
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
	jne	.LBB0_33
# %bb.31:                               # %if.then160.i
                                        #   in Loop: Header=BB0_1 Depth=1
	leaq	195(%rsp), %rdi
	pushq	$80
	popq	%rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB0_55
.LBB0_32:                               # %if.then312.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.12, %esi
	movq	%rbp, %rdi
	movq	%rbp, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB0_60
.LBB0_33:                               # %if.end165.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$4, %r15
	je	.LBB0_36
# %bb.34:                               # %if.end165.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$1, %r15
	jne	.LBB0_45
# %bb.35:                               # %land.lhs.true168.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpl	$113, %ecx
	je	.LBB0_67
	jmp	.LBB0_45
.LBB0_36:                               # %land.lhs.true176.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpl	$112, %ecx
	je	.LBB0_41
# %bb.37:                               # %land.lhs.true176.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpl	$101, %ecx
	jne	.LBB0_45
# %bb.38:                               # %land.lhs.true181.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$120, %dl
	jne	.LBB0_45
# %bb.39:                               # %land.lhs.true181.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$105, %al
	jne	.LBB0_45
# %bb.40:                               # %land.lhs.true181.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$116, 195(%rsp)
	jne	.LBB0_45
	jmp	.LBB0_67
.LBB0_41:                               # %land.lhs.true205.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$111, %dl
	jne	.LBB0_45
# %bb.42:                               # %land.lhs.true205.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$111, %al
	jne	.LBB0_45
# %bb.43:                               # %land.lhs.true205.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$102, 195(%rsp)
	jne	.LBB0_45
# %bb.44:                               # %land.lhs.true220.i
                                        #   in Loop: Header=BB0_1 Depth=1
	pushq	$39
	popq	%rax
	#APP
	syscall

	#NO_APP
	cmpq	$1, %rax
	je	.LBB0_60
.LBB0_45:                               # %if.end227.i
                                        #   in Loop: Header=BB0_1 Depth=1
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
	movl	$.L.str.10, %esi
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
	je	.LBB0_68
# %bb.46:                               # %if.end263.i
                                        #   in Loop: Header=BB0_1 Depth=1
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
	jle	.LBB0_49
# %bb.47:                               # %if.end280.i
                                        #   in Loop: Header=BB0_1 Depth=1
	andb	$-11, 40(%rsp)
	movl	$21506, %esi                    # imm = 0x5402
	xorl	%edi, %edi
	leaq	28(%rsp), %rdx
	pushq	$16
	popq	%rax
	#APP
	syscall

	#NO_APP
	movl	$.L.str.11, %esi
	movq	%rbp, %rdi
	pushq	$5
	popq	%rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	movl	64(%rsp), %eax
	testb	$127, %al
	je	.LBB0_54
# %bb.48:                               # %if.then296.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.12, %esi
	movq	%rbp, %rdi
	movq	%rbp, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	pushq	$-1
	jmp	.LBB0_53
.LBB0_49:                               # %while.cond275.i.preheader
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%r15, %rax
.LBB0_50:                               # %while.cond275.i
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	subq	$1, %rax
	jb	.LBB0_52
# %bb.51:                               # %while.body276.i
                                        #   in Loop: Header=BB0_50 Depth=2
	movb	$0, 191(%rsp,%r15)
	movq	%rax, %r15
	jmp	.LBB0_50
.LBB0_52:                               #   in Loop: Header=BB0_1 Depth=1
	pushq	$-3
.LBB0_53:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	popq	%rax
	jmp	.LBB0_55
.LBB0_54:                               # %if.end303.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movzbl	%ah, %eax
.LBB0_55:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$-3, %rax
	je	.LBB0_60
# %bb.56:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$60, %rax
	je	.LBB0_65
# %bb.57:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	testq	%rax, %rax
	je	.LBB0_61
# %bb.58:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$-1, %rax
	jne	.LBB0_66
# %bb.59:                               # %sw.bb1
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.2, %esi
	jmp	.LBB0_62
.LBB0_60:                               # %process_line.exit.thread
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.1, %esi
	jmp	.LBB0_62
.LBB0_61:                               # %sw.bb3
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.4, %esi
.LBB0_62:                               # %sw.epilog
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%rbp, %rdi
	movq	%r13, %rdx
	movq	%rbp, %rax
	#APP
	syscall

	#NO_APP
	leaq	192(%rsp), %rax
.LBB0_63:                               # %while.cond11
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$0, (%rax)
	je	.LBB0_1
# %bb.64:                               # %while.body12
                                        #   in Loop: Header=BB0_63 Depth=2
	movb	$0, (%rax)
	incq	%rax
	jmp	.LBB0_63
.LBB0_65:                               # %sw.bb2
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.3, %esi
	jmp	.LBB0_62
.LBB0_66:                               # %sw.default
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.5, %esi
	jmp	.LBB0_62
.LBB0_67:                               # %if.then.i
	callq	clean_exit
.LBB0_68:                               # %if.then252.i
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
	movq	%r15, %rsi
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
	movl	$.L.str.13, %esi
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
	.type	memcpy,@function                # -- Begin function memcpy
memcpy:                                 # @memcpy
# %bb.0:                                # %entry
	movq	%rdi, %rax
	xorl	%ecx, %ecx
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rcx, %rdx
	je	.LBB3_3
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movb	(%rsi,%rcx), %dil
	movb	%dil, (%rax,%rcx)
	incq	%rcx
	jmp	.LBB3_1
.LBB3_3:                                # %for.end
	retq
.Lfunc_end3:
	.size	memcpy, .Lfunc_end3-memcpy
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
	.asciz	"\033[D"
	.size	.L.str.8, 4

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"\033[C"
	.size	.L.str.9, 4

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

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"/bin/"
	.size	.L.str.13, 6

	.section	".note.GNU-stack","",@progbits
