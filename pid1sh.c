#include "huglibc.h"

static inline void init_term(){
	struct termios tos;
	ioctl(TCGETS, &tos)
	tos.c_lflag &= (~ICANON & ~ECHO & ~ISIG); //tos.set(not ICANON & not ECHO)  & ~ISIG
//	tos.c_lflag &= ~(ICANON | ECHO); //tos.disable(ICANON & ECHO)
	ioctl(TCSETS, &tos)
}

static inline void print_env(char* env[]){
	print("TODO: search in ")
	for (; *env; env++) {
		const char *a = *env;
		for (; *a; a++);
		size_t l = a-*env;
		printn(*env, l)
		print("\n")
		my_syscall3(__NR_write, STDOUT_FILENO, "\n", 1);
	}
}

static inline long process_line(char inbuf, unsigned char outbuf[255], long outlen, long ptrlen, char* env[]){
while (1) {
	long bytes_read = getchar(&inbuf);
	if (bytes_read < 1) exit(0)

	if (inbuf == 0x7f) { //backspace
		if (ptrlen == outlen) outlen--;
		if (ptrlen == 0) continue;
		ptrlen--;
		outbuf[ptrlen]= ' ';
		print("[D [D");
		continue;
	}
	if (inbuf == '\t') { //Tab
		continue;
	}
	if (inbuf == '') { // terminal control
		getchar(&inbuf)
		if (inbuf == '[') {
			getchar(&inbuf)
			if (inbuf == 'D') { //Left
				if (ptrlen == 0) continue;
				ptrlen--;
				print("[D");

				continue;
			}
			if (inbuf == 'C') { //Right
				if (ptrlen == outlen) continue;
				ptrlen++;
				print("[C");
				continue;
			}
			if (inbuf == 'A') { //Up
				continue;
			}
			if (inbuf == 'B') { //Down
				continue;
			}
			//continue;
		}
		return -3;
	}
	if (inbuf == 3){ //Ctrl+C
		//getchar(&inbuf, 1); useless for ctrl+z
		continue;
	}
	printn(&inbuf, 1);
	if (inbuf == '\n' || inbuf == '#'){ //Commented line or enter
		if (outbuf[outlen-1] == ' ') outlen--;
		if (outlen == 0) return 0;
		//outbuf[outlen]=0;
		while (inbuf!='\n'){
			getchar(&inbuf)
			printn(&inbuf, 1);
		}
		if (outbuf[0] == 'c' && outbuf[1] == 'd' && outbuf[2] == ' '){
			return chdir(outbuf+3)
		}
		if (outlen == 1 && outbuf[0] == 'q' || outlen == 4 && outbuf[0] == 'e' && outbuf[1] == 'x' && outbuf[2] == 'i' && outbuf[3] == 't') {
			exit(0); //EXIT_SUCCESS
		}
		if (outlen == 4 && outbuf[0] == 'p' && outbuf[1] == 'o' && outbuf[2] == 'o' && outbuf[3] == 'f' && my_syscall0(__NR_getpid) == 1) { // pid == 1
			//print("System is going Down Now\n");
			return -3;
		}
		sigset_t set;
		__sigemptyset(&set);
		pid_t pid = my_syscall0(__NR_fork);
		if ( pid == 0 ) {
			my_syscall4(__NR_rt_sigprocmask, SIG_SETMASK, &set, 0, 8);

			unsigned char *argv[100];
			const unsigned char *s = outbuf;
			//int firstlen = 0;
			int firstlen = 1;
			while (firstlen<outlen && *++s && *s!=' ') firstlen++;
			//while (firstlen<outlen && *s!=0 && *s!=' ') {s++; firstlen++;}
			argv[0]=outbuf; argv[0][firstlen]=0;
			int totalen = firstlen; int argc = 1;
			//printn("abcde", totalen)
			//printn("abcde", outlen)
			while (totalen < outlen){
				//if (totalen > outlen) return -3;
				int sndlen = 0;
				while (totalen<=outlen && *++s && *s!=' ') sndlen++;
				//while (totalen<outlen && *s!=0 && *s!=' ') {s++; sndlen++;}
				totalen++;
				argv[argc]=outbuf+totalen; argv[argc][sndlen]=0;
				totalen+=sndlen; argc++;
			}
			argv[argc] = 0;
			if (argv[0][0] != '/'){
				char binbuf[100];
				memcpy(binbuf, "/bin/", 5);
				memcpy(binbuf+5, argv[0], firstlen);
				binbuf[firstlen+5] = 0;
				my_syscall3(__NR_execve, binbuf, argv, env);
			} else {
				my_syscall3(__NR_execve, argv[0], argv, env);
			}
			exit(60); // file not found
		}
		__sigaddset(&set, SIGINT);
		my_syscall4(__NR_rt_sigprocmask, SIG_SETMASK, &set, 0, 8);
		struct termios tos;
		ioctl(TCGETS, &tos)
		tos.c_lflag |= (ICANON | ECHO | ISIG); //tos.set(ICANON & ECHO)
		ioctl(TCSETS, &tos)
		print("[0 q");
		int wstatus;
		if (my_syscall4(__NR_wait4, pid, &wstatus, 0, 0) < 1) return -3;
		tos.c_lflag &= (~ICANON & ~ECHO & ~ISIG); //tos.set(ICANON & ECHO)
		ioctl(TCSETS, &tos)
		print("[5 q");
		if (wstatus & 0x7f) {//WTERMSIG or !WIFEXITED
			print("\n");
			return -1;
		}
		return WEXITSTATUS(wstatus)
	}
	if (inbuf < 32) {
		print("\n");
		return -3; //ctrl+z
	};
	//printn(&inbuf, 1);
	outbuf[ptrlen]=inbuf;
	if (ptrlen == outlen) outlen++;
	ptrlen++;
}}

int main(int argc, char* argv[]) {
	char **env = &argv[argc + 1];
	init_term();
	char inbuf;
	unsigned char outbuf[1000];
	print(" ❯ [5 q"); //5 for vertical, 3 for under
	while (1) {
		char *prompt;
		switch (process_line(inbuf, outbuf, 0, 0, env)){
			case -3: // major failure or unhandled input
				prompt = "[35m☠>[0m "; //purple
				break;
			case -1: // SignalTerminated or abnormal exit
				prompt = "[34m!❯[0m "; //blue
				break;
			case 60: // file not found
				prompt = "[33m?❯[0m "; //yellow
				break;
			case 0: // exit_success (0)
				prompt = "[32m ❯[0m "; //green
				break;
			default: // non-zero exit (normal failure)
				prompt = "[31mx❯[0m "; //red
		}
		printn(prompt, 14);
		unsigned char *d = outbuf; while (*d) *d++ = 0; //zero command buffer
	}
}
