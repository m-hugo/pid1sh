#include <signal.h>
#include <limits.h>
#include <dirent.h>
#include <asm/unistd_64.h>
#include <asm/termios.h>
#include <asm/fcntl.h>
#include "libc-pointer-arith.h"
#include "sigsetops.h"

#define STDOUT_FILENO 1
#define STDIN_FILENO 0
#define VOID 0
#define X_OK 1
#define WEXITSTATUS(wstatus) (wstatus & 0xff00) >> 8;

#if defined(__GNUC__) || defined(__clang__)
	asm(
	".global _start\n"
	"_start:"
	"mov 0(%rsp),%rdi\n" // get argc
	"lea 8(%rsp),%rsi\n"// the arguments are pushed just below, so argv = %rbp + 8
	"jmp main"
	);
	#define get_env() argc + argv + 1;
	#define exit(n) {my_syscall1(__NR_exit, n); __builtin_unreachable();}
#else
	int main(int argc, char* argv[]);
	void _start(){
		main(0, NULL);
	}
	#define exit(n) {my_syscall1(__NR_exit, n);}
	#define get_env() 0;
#endif

#define write(fd, s, n) my_syscall3(__NR_write, fd, s, n);
#define read(fd, s, n) my_syscall3(__NR_read, fd, s, n);
#define ioctl(m, t) my_syscall3(__NR_ioctl, STDIN_FILENO, m, t);
#define chdir(d) my_syscall1(__NR_chdir, d);
#define open(path, m) my_syscall2(__NR_open, path, m);
#define close(fd) my_syscall1(__NR_close, fd);
#define execve(path, argv, env)  my_syscall3(__NR_execve, path, argv, env);
#define getpid() my_syscall0(__NR_getpid)
#define fork() my_syscall0(__NR_fork);
#define sigprocmask(mode, new, old) my_syscall4(__NR_rt_sigprocmask, mode, new, old, 8);
#define wait4(pid, b, c, d) my_syscall4(__NR_wait4, pid, b, c, d)

#define printn(s, n) write(STDOUT_FILENO, s, n);
#define print(s) printn(s, sizeof(s) - 1)
#define puts(s) {printn(s, strlen(s)) print("\n")}

#define getn(s, n) read(STDIN_FILENO, s, 1);
#define getchar(s) getn(s, 1);

#define my_syscall0(num) ({ long _ret;register long _num __asm__ ("rax") = (num); __asm__ volatile ( "syscall\n" : "=a"(_ret): "0"(_num) : "rcx", "r11", "memory", "cc" ); _ret;})
#define my_syscall1(num, arg1) ({ long _ret;register long _num __asm__ ("rax") = (num); register long _arg1 __asm__ ("rdi") = (long)(arg1);__asm__ volatile ( "syscall\n" : "=a"(_ret): "r"(_arg1), "0"(_num) : "rcx", "r11", "memory", "cc" ); _ret;})
#define my_syscall2(num, arg1, arg2) ({ long _ret;register long _num __asm__ ("rax") = (num); register long _arg1 __asm__ ("rdi") = (long)(arg1); register long _arg2 __asm__ ("rsi") = (long)(arg2);__asm__ volatile ( "syscall\n" : "=a"(_ret): "r"(_arg1), "r"(_arg2), "0"(_num) : "rcx", "r11", "memory", "cc" ); _ret;})
#define my_syscall3(num, arg1, arg2, arg3) ({ long _ret;register long _num __asm__ ("rax") = (num); register long _arg1 __asm__ ("rdi") = (long)(arg1); register long _arg2 __asm__ ("rsi") = (long)(arg2); register long _arg3 __asm__ ("rdx") = (long)(arg3);__asm__ volatile ( "syscall\n" : "=a"(_ret): "r"(_arg1), "r"(_arg2), "r"(_arg3), "0"(_num) : "rcx", "r11", "memory", "cc" ); _ret;})
#define my_syscall4(num, arg1, arg2, arg3, arg4)({ long _ret;register long _num __asm__ ("rax") = (num); register long _arg1 __asm__ ("rdi") = (long)(arg1); register long _arg2 __asm__ ("rsi") = (long)(arg2); register long _arg3 __asm__ ("rdx") = (long)(arg3); register long _arg4 __asm__ ("r10") = (long)(arg4);__asm__ volatile ( "syscall\n" : "=a"(_ret): "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4),"0"(_num) : "rcx", "r11", "memory", "cc" ); _ret;})
#define my_syscall5(num, arg1, arg2, arg3, arg4, arg5) ({ long _ret;register long _num __asm__ ("rax") = (num); register long _arg1 __asm__ ("rdi") = (long)(arg1); register long _arg2 __asm__ ("rsi") = (long)(arg2); register long _arg3 __asm__ ("rdx") = (long)(arg3); register long _arg4 __asm__ ("r10") = (long)(arg4); register long _arg5 __asm__ ("r8") = (long)(arg5);__asm__ volatile ( "syscall\n" : "=a"(_ret): "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), "0"(_num) : "rcx", "r11", "memory", "cc" ); _ret;})
#define my_syscall6(num, arg1, arg2, arg3, arg4, arg5, arg6) ({ long _ret;register long _num __asm__ ("rax") = (num); register long _arg1 __asm__ ("rdi") = (long)(arg1); register long _arg2 __asm__ ("rsi") = (long)(arg2); register long _arg3 __asm__ ("rdx") = (long)(arg3); register long _arg4 __asm__ ("r10") = (long)(arg4); register long _arg5 __asm__ ("r8") = (long)(arg5); register long _arg6 __asm__ ("r9") = (long)(arg6);__asm__ volatile ( "syscall\n" : "=a"(_ret): "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), "r"(_arg6), "0"(_num) : "rcx", "r11", "memory", "cc" ); _ret;})

static inline void *memcpy(void *dest, const void *src, unsigned long n){
	unsigned char *d = dest;
	const unsigned char *s = src;
	for (; n; n--) *d++ = *s++; return dest;
}
static inline unsigned long strlen(const char* s){unsigned long len = 0; while (s[len]) len++; return len;}
static inline char can_exec(int fd, char *name){return 0 == my_syscall3(__NR_faccessat, fd, name, X_OK);}
