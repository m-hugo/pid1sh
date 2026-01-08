#include "huglibc.h"

static inline void init_term(){
	struct termios tos;
	ioctl(TCGETS, &tos)
	tos.c_lflag &= (~ICANON & ~ECHO & ~ISIG); // same as tos.c_lflag &= ~(ICANON | ECHO | ISIG);
	ioctl(TCSETS, &tos)
	sigset_t set;
	__sigemptyset(&set);
	__sigaddset(&set, SIGINT);
	sigprocmask(SIG_SETMASK, &set, VOID)
}

#ifdef TODO
static inline void print_env(char* env[]){
	print("TODO: search in ")
	for (; *env; env++) {
		const char *a = *env;
		for (; *a; a++);
		size_t l = a-*env;
		printn(*env, l)
		print("\n")
	}
}
#endif

static inline void clean_exit(){
	struct termios tos;
	ioctl(TCGETS, &tos)
	tos.c_lflag |= (ICANON | ECHO | ISIG);
	ioctl(TCSETS, &tos)
	exit(0)
}

static inline void exec(unsigned char outbuf[255], long outlen, char* env[]){
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
	char path[255+255];
	switch(argv[0][0]){
		case '/':
			execve(argv[0], argv, env)
			break;
		case '.':
		if (argv[0][1] == '/'){
			int pathlen = getcwd255(path); // len of /home/hugo/
			memcpy(path+pathlen-1, argv[0]+1, firstlen);
			execve(path, argv, env)
		}
		break;
		default:
			memcpy(path, "/bin/", 5);
			memcpy(path+5, argv[0], firstlen);
			path[firstlen+5] = 0;
			execve(path, argv, env)
	}
}

#ifdef TAB_SUPPORT
struct dent{
	unsigned long d_ino;
	signed long d1;
	unsigned short d_reclen;
	char d_name[];
};
static inline void tab_completion(int fd){
	char buf[50];
	int bufptr = 0;
	printn("\n", 1)
	for(int cnt=0; cnt<60; cnt++){
		int buflen = my_syscall3(__NR_getdents, fd, buf, 40);
		if (buflen <= 0 || buflen>40) break;
		while (bufptr < buflen){
			struct dent *d = (struct dent *)(buf + bufptr);
			bufptr += d->d_reclen;
			if (d->d_name[0]!='.' && can_exec(fd, d->d_name)) puts(d->d_name);
		}
		bufptr = 0;
	}
}
#endif

static inline long process_line(char inbuf, unsigned char outbuf[255], long outlen, long ptrlen, char* env[]){
while (1) {
	long bytes_read = getchar(&inbuf);
	if (bytes_read < 1) clean_exit();

	if (inbuf == 0x7f) { //backspace
		if (ptrlen == 0) continue;
		if (ptrlen == outlen) {outlen--; outbuf[outlen]= 0;}
		ptrlen--;
		outbuf[ptrlen]= ' ';
		print("[D [D");
		continue;
	}
	if (inbuf == '\t') { //Tab
		#ifdef TAB_SUPPORT
		int fd = open("/bin", O_RDONLY | O_DIRECTORY);
		print("7");
		tab_completion(fd);
		print("8");
		close(fd);
		#endif
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
		print("\n");
		return -1;
	}
	if (inbuf == '&'){
		getchar(&inbuf)
		print("\n")
	} else{
		printn(&inbuf, 1)
	}

	if (inbuf == '\n' || inbuf == '#' || inbuf == '&'){ //Commented line or enter
		if (outbuf[outlen-1] == ' ') {outlen--; outbuf[outlen]= 0;}
		//outbuf[outlen]=0; // hopefully same byte as the final argc argv[0][firstlen] or argv[argc][sndlen]
		while (inbuf!='\n' && inbuf != '&'){
			getchar(&inbuf)
			printn(&inbuf, 1);
		}
		if (inbuf == '&') getchar(&inbuf)
		if (outlen == 0) return 0;
		if (outbuf[0] == 'c' && outbuf[1] == 'd' && outbuf[2] == ' '){
			return chdir(outbuf+3)
		}
		if (outlen == 1 && outbuf[0] == 'q' || outlen == 4 && outbuf[0] == 'e' && outbuf[1] == 'x' && outbuf[2] == 'i' && outbuf[3] == 't') {
			clean_exit(); //EXIT_SUCCESS
		}
		#ifdef PID1
		if (outlen == 4 && outbuf[0] == 'p' && outbuf[1] == 'o' && outbuf[2] == 'o' && outbuf[3] == 'f' && getpid() == 1) { // pid == 1
			//print("System is going Down Now\n");
			return -3;
		}
		#endif

		struct termios tos;
		ioctl(TCGETS, &tos) tos.c_lflag |= (ICANON | ECHO | ISIG); ioctl(TCSETS, &tos)
		print("[0 q");

		pid_t pid = fork();
		if ( pid == 0 ) {
			sigset_t set;
			__sigemptyset(&set);
			sigprocmask(SIG_SETMASK, &set, VOID)
			exec(outbuf, outlen, env);
			exit(60); // file not found
		}
		int wstatus;
		if (wait4(pid, &wstatus, 0, 0) < 1) {while (outlen) {outlen--; outbuf[outlen]= 0;} return -3;}
		tos.c_lflag &= (~ICANON & ~ECHO | ISIG);
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
	char **env = get_env()
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
