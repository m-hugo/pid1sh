//#include <stdlib.h>
//#include <termios.h>
//#include <string.h>
//#include <unistd.h>
#include <signal.h>
#include <limits.h>

//#include <sys/ioctl.h>
//#include <sys/termios.h>
//#include <sys/signal.h>

//#include <linux/signal.h>
//#include "linux/signal.h"
//#include <linux/bitops.h>

#include <asm/unistd_64.h>
#include <asm/termios.h>
//#include <asm/signal.h>
//#include <asm/termios.h>
//#include <asm/signal.h>
//#include <asm/ioctl.h>
//#include <asm/types.h>
//#include "asm/signal.h"

#include "libc-pointer-arith.h"
#include "sigsetops.h"

#define STDOUT_FILENO 1
#define STDIN_FILENO 0
#define VOID 0

#define print(s) my_syscall3(__NR_write, STDOUT_FILENO, s, sizeof(s) - 1);
#define printn(s, n) my_syscall3(__NR_write, STDOUT_FILENO, s, n);
#define getchar(s) my_syscall3(__NR_read, STDIN_FILENO, s, 1);
#define exit(n) {my_syscall1(__NR_exit, n); __builtin_unreachable();}
#define ioctl(m, t) my_syscall3(__NR_ioctl, STDIN_FILENO, m, t);
#define chdir(d) my_syscall1(__NR_chdir, d);
#define WEXITSTATUS(wstatus) (wstatus & 0xff00) >> 8;

asm(    ".global _start\n"
        "_start:\n"
        "movq 0(%rsp),%rdi\n"    // get argc
        "lea 8(%rsp),%rsi\n"     // the arguments are pushed just below, so argv = %rbp + 8
        "call main\n");

#define my_syscall0(num)                                                      \
({                                                                            \
	long _ret;                                                            \
	register long _num  __asm__ ("rax") = (num);                          \
									      \
	__asm__ volatile (                                                    \
		"syscall\n"                                                   \
		: "=a"(_ret)                                                  \
		: "0"(_num)                                                   \
		: "rcx", "r11", "memory", "cc"                                \
	);                                                                    \
	_ret;                                                                 \
})

#define my_syscall1(num, arg1)                                                \
({                                                                            \
	long _ret;                                                            \
	register long _num  __asm__ ("rax") = (num);                          \
	register long _arg1 __asm__ ("rdi") = (long)(arg1);                   \
									      \
	__asm__ volatile (                                                    \
		"syscall\n"                                                   \
		: "=a"(_ret)                                                  \
		: "r"(_arg1),                                                 \
		  "0"(_num)                                                   \
		: "rcx", "r11", "memory", "cc"                                \
	);                                                                    \
	_ret;                                                                 \
})

#define my_syscall2(num, arg1, arg2)                                          \
({                                                                            \
	long _ret;                                                            \
	register long _num  __asm__ ("rax") = (num);                          \
	register long _arg1 __asm__ ("rdi") = (long)(arg1);                   \
	register long _arg2 __asm__ ("rsi") = (long)(arg2);                   \
									      \
	__asm__ volatile (                                                    \
		"syscall\n"                                                   \
		: "=a"(_ret)                                                  \
		: "r"(_arg1), "r"(_arg2),                                     \
		  "0"(_num)                                                   \
		: "rcx", "r11", "memory", "cc"                                \
	);                                                                    \
	_ret;                                                                 \
})

#define my_syscall3(num, arg1, arg2, arg3)                                    \
({                                                                            \
	long _ret;                                                            \
	register long _num  __asm__ ("rax") = (num);                          \
	register long _arg1 __asm__ ("rdi") = (long)(arg1);                   \
	register long _arg2 __asm__ ("rsi") = (long)(arg2);                   \
	register long _arg3 __asm__ ("rdx") = (long)(arg3);                   \
									      \
	__asm__ volatile (                                                    \
		"syscall\n"                                                   \
		: "=a"(_ret)                                                  \
		: "r"(_arg1), "r"(_arg2), "r"(_arg3),                         \
		  "0"(_num)                                                   \
		: "rcx", "r11", "memory", "cc"                                \
	);                                                                    \
	_ret;                                                                 \
})

#define my_syscall4(num, arg1, arg2, arg3, arg4)                              \
({                                                                            \
	long _ret;                                                            \
	register long _num  __asm__ ("rax") = (num);                          \
	register long _arg1 __asm__ ("rdi") = (long)(arg1);                   \
	register long _arg2 __asm__ ("rsi") = (long)(arg2);                   \
	register long _arg3 __asm__ ("rdx") = (long)(arg3);                   \
	register long _arg4 __asm__ ("r10") = (long)(arg4);                   \
									      \
	__asm__ volatile (                                                    \
		"syscall\n"                                                   \
		: "=a"(_ret)                                                  \
		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4),             \
		  "0"(_num)                                                   \
		: "rcx", "r11", "memory", "cc"                                \
	);                                                                    \
	_ret;                                                                 \
})

#define my_syscall5(num, arg1, arg2, arg3, arg4, arg5)                        \
({                                                                            \
	long _ret;                                                            \
	register long _num  __asm__ ("rax") = (num);                          \
	register long _arg1 __asm__ ("rdi") = (long)(arg1);                   \
	register long _arg2 __asm__ ("rsi") = (long)(arg2);                   \
	register long _arg3 __asm__ ("rdx") = (long)(arg3);                   \
	register long _arg4 __asm__ ("r10") = (long)(arg4);                   \
	register long _arg5 __asm__ ("r8")  = (long)(arg5);                   \
									      \
	__asm__ volatile (                                                    \
		"syscall\n"                                                   \
		: "=a"(_ret)                                                  \
		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), \
		  "0"(_num)                                                   \
		: "rcx", "r11", "memory", "cc"                                \
	);                                                                    \
	_ret;                                                                 \
})

#define my_syscall6(num, arg1, arg2, arg3, arg4, arg5, arg6)                  \
({                                                                            \
	long _ret;                                                            \
	register long _num  __asm__ ("rax") = (num);                          \
	register long _arg1 __asm__ ("rdi") = (long)(arg1);                   \
	register long _arg2 __asm__ ("rsi") = (long)(arg2);                   \
	register long _arg3 __asm__ ("rdx") = (long)(arg3);                   \
	register long _arg4 __asm__ ("r10") = (long)(arg4);                   \
	register long _arg5 __asm__ ("r8")  = (long)(arg5);                   \
	register long _arg6 __asm__ ("r9")  = (long)(arg6);                   \
									      \
	__asm__ volatile (                                                    \
		"syscall\n"                                                   \
		: "=a"(_ret)                                                  \
		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), \
		  "r"(_arg6), "0"(_num)                                       \
		: "rcx", "r11", "memory", "cc"                                \
	);                                                                    \
	_ret;                                                                 \
})
void *memcpy(void *dest, const void *src, unsigned long n)
//void memcpy(void *restrict dest, const void *restrict src, size_t n)
{
	unsigned char *d = dest;
	const unsigned char *s = src;
	for (; n; n--) *d++ = *s++;
	return dest;
}
