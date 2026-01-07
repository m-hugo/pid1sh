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
.LBB0_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
                                        #     Child Loop BB0_25 Depth 2
                                        #     Child Loop BB0_43 Depth 2
                                        #     Child Loop BB0_55 Depth 2
	xorl	%r10d, %r10d
	xorl	%eax, %eax
.LBB0_2:                                # %while.body.i
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, %r15
	xorl	%edi, %edi
	movq	%r8, %rsi
	movq	%r13, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	testq	%rax, %rax
	jle	.LBB0_59
# %bb.3:                                # %if.end.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movq	%r10, %r12
	movzbl	11(%rsp), %ecx
	cmpl	$3, %ecx
	movq	%r15, %rax
	je	.LBB0_2
# %bb.4:                                # %if.end.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$9, %ecx
	movq	%r12, %r10
	movq	%r15, %rax
	je	.LBB0_2
# %bb.5:                                # %if.end.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$27, %ecx
	je	.LBB0_9
# %bb.6:                                # %if.end.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$127, %ecx
	jne	.LBB0_15
# %bb.7:                                # %if.then3.i
                                        #   in Loop: Header=BB0_2 Depth=2
	testq	%r12, %r12
	movl	$0, %r10d
	movq	%r15, %rax
	je	.LBB0_2
# %bb.8:                                # %if.end7.i
                                        #   in Loop: Header=BB0_2 Depth=2
	leaq	-1(%r12), %r10
	cmpq	%r15, %r12
	cmoveq	%r10, %r15
	movb	$32, 191(%rsp,%r12)
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%r9, %rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	movq	%r15, %rax
	jmp	.LBB0_2
.LBB0_9:                                # %if.then29.i
                                        #   in Loop: Header=BB0_2 Depth=2
	xorl	%edi, %edi
	movq	%r8, %rsi
	movq	%r13, %rdx
	xorl	%eax, %eax
	#APP
	syscall

	#NO_APP
	cmpb	$91, 11(%rsp)
	jne	.LBB0_30
# %bb.10:                               # %if.then39.i
                                        #   in Loop: Header=BB0_2 Depth=2
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
	movq	%r12, %r10
	movq	%r15, %rax
	jb	.LBB0_2
# %bb.11:                               # %if.then39.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$67, %ecx
	je	.LBB0_19
# %bb.12:                               # %if.then39.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$68, %ecx
	jne	.LBB0_30
# %bb.13:                               # %if.then49.i
                                        #   in Loop: Header=BB0_2 Depth=2
	testq	%r12, %r12
	movl	$0, %r10d
	movq	%r15, %rax
	je	.LBB0_2
# %bb.14:                               # %if.end53.i
                                        #   in Loop: Header=BB0_2 Depth=2
	decq	%r12
	movq	%r13, %rdi
	movq	%rbp, %rsi
	movq	%rbx, %rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB0_21
.LBB0_15:                               # %if.end93.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movq	%r13, %rdi
	movq	%r8, %rsi
	movq	%r13, %rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	movzbl	11(%rsp), %eax
	cmpl	$35, %eax
	je	.LBB0_22
# %bb.16:                               # %if.end93.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$10, %eax
	je	.LBB0_22
# %bb.17:                               # %if.end267.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpb	$31, %al
	jle	.LBB0_29
# %bb.18:                               # %if.end278.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movb	%al, 192(%rsp,%r12)
	xorl	%eax, %eax
	cmpq	%r15, %r12
	sete	%al
	addq	%r15, %rax
	incq	%r12
	movq	%r12, %r10
	jmp	.LBB0_2
.LBB0_19:                               # %if.then65.i
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpq	%r15, %r12
	movq	%r12, %r10
	movq	%r12, %rax
	je	.LBB0_2
# %bb.20:                               # %if.end69.i
                                        #   in Loop: Header=BB0_2 Depth=2
	incq	%r12
	movq	%r13, %rdi
	leaq	.L.str.8(%rip), %rsi
	movq	%rbx, %rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
.LBB0_21:                               # %while.body.i
                                        #   in Loop: Header=BB0_2 Depth=2
	movq	%r12, %r10
	movq	%r15, %rax
	jmp	.LBB0_2
.LBB0_22:                               # %if.then106.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$32, 191(%rsp,%r15)
	jne	.LBB0_25
# %bb.23:                               # %if.then111.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movb	$0, 191(%rsp,%r15)
	decq	%r15
	jmp	.LBB0_25
.LBB0_24:                               # %while.body119.i
                                        #   in Loop: Header=BB0_25 Depth=2
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
.LBB0_25:                               # %while.cond115.i
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$10, %al
	jne	.LBB0_24
# %bb.26:                               # %while.end.i
                                        #   in Loop: Header=BB0_1 Depth=1
	testq	%r15, %r15
	je	.LBB0_53
# %bb.27:                               # %if.end135.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movb	192(%rsp), %al
	movb	193(%rsp), %cl
	movl	%eax, %edx
	xorb	$99, %dl
	movl	%ecx, %esi
	xorb	$100, %sil
	orb	%dl, %sil
	movb	194(%rsp), %dl
	movl	%edx, %edi
	xorb	$32, %dil
	orb	%sil, %dil
	jne	.LBB0_31
# %bb.28:                               # %if.then149.i
                                        #   in Loop: Header=BB0_1 Depth=1
	leaq	195(%rsp), %rdi
	pushq	$80
	popq	%rax
	#APP
	syscall

	#NO_APP
	jmp	.LBB0_48
.LBB0_29:                               # %if.then271.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%r13, %rdi
	leaq	.L.str.11(%rip), %rsi
	movq	%r13, %rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
.LBB0_30:                               # %process_line.exit.thread
                                        #   in Loop: Header=BB0_1 Depth=1
	leaq	.L.str.1(%rip), %rsi
	jmp	.LBB0_54
.LBB0_31:                               # %if.end154.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$4, %r15
	je	.LBB0_34
# %bb.32:                               # %if.end154.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$1, %r15
	jne	.LBB0_38
# %bb.33:                               # %land.lhs.true157.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$113, %al
	jne	.LBB0_38
	jmp	.LBB0_59
.LBB0_34:                               # %land.lhs.true165.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$101, %al
	jne	.LBB0_38
# %bb.35:                               # %land.lhs.true165.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$120, %cl
	jne	.LBB0_38
# %bb.36:                               # %land.lhs.true165.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$105, %dl
	jne	.LBB0_38
# %bb.37:                               # %land.lhs.true165.i
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpb	$116, 195(%rsp)
	je	.LBB0_59
.LBB0_38:                               # %if.end186.i
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
	je	.LBB0_60
# %bb.39:                               # %if.end222.i
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
	jle	.LBB0_42
# %bb.40:                               # %if.end239.i
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
	je	.LBB0_47
# %bb.41:                               # %if.then255.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%r13, %rdi
	leaq	.L.str.11(%rip), %rsi
	movq	%r13, %rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	pushq	$-1
	jmp	.LBB0_46
.LBB0_42:                               # %while.cond234.i.preheader
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%r15, %rax
.LBB0_43:                               # %while.cond234.i
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	subq	$1, %rax
	jb	.LBB0_45
# %bb.44:                               # %while.body235.i
                                        #   in Loop: Header=BB0_43 Depth=2
	movb	$0, 191(%rsp,%r15)
	movq	%rax, %r15
	jmp	.LBB0_43
.LBB0_45:                               #   in Loop: Header=BB0_1 Depth=1
	pushq	$-3
.LBB0_46:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	popq	%rax
	jmp	.LBB0_48
.LBB0_47:                               # %if.end262.i
                                        #   in Loop: Header=BB0_1 Depth=1
	movzbl	%ah, %eax
.LBB0_48:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$-3, %rax
	leaq	.L.str.1(%rip), %rsi
	je	.LBB0_54
# %bb.49:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$60, %rax
	je	.LBB0_57
# %bb.50:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	testq	%rax, %rax
	je	.LBB0_53
# %bb.51:                               # %process_line.exit
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$-1, %rax
	jne	.LBB0_58
# %bb.52:                               # %sw.bb1
                                        #   in Loop: Header=BB0_1 Depth=1
	leaq	.L.str.2(%rip), %rsi
	jmp	.LBB0_54
.LBB0_53:                               # %sw.bb3
                                        #   in Loop: Header=BB0_1 Depth=1
	leaq	.L.str.4(%rip), %rsi
.LBB0_54:                               # %sw.epilog
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%r13, %rdi
	pushq	$14
	popq	%rdx
	movq	%r13, %rax
	#APP
	syscall

	#NO_APP
	leaq	192(%rsp), %rax
.LBB0_55:                               # %while.cond11
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$0, (%rax)
	je	.LBB0_1
# %bb.56:                               # %while.body12
                                        #   in Loop: Header=BB0_55 Depth=2
	movb	$0, (%rax)
	incq	%rax
	jmp	.LBB0_55
.LBB0_57:                               # %sw.bb2
                                        #   in Loop: Header=BB0_1 Depth=1
	leaq	.L.str.3(%rip), %rsi
	jmp	.LBB0_54
.LBB0_58:                               # %sw.default
                                        #   in Loop: Header=BB0_1 Depth=1
	leaq	.L.str.5(%rip), %rsi
	jmp	.LBB0_54
.LBB0_59:                               # %if.then.i
	callq	clean_exit
.LBB0_60:                               # %if.then211.i
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
	.size	.Lmain$local, .Lfunc_end0-main
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
	leaq	.L.str.12(%rip), %rsi
	movq	%rsp, %r12
	pushq	$5
	popq	%rdx
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
