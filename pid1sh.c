#include "options.h"
#include "huglibc.h"

static inline void set_normal_termconfig(struct termios *tos){
	ioctl(TCGETS, tos)
	tos->c_lflag |= (ICANON | ECHO | ISIG);
	ioctl(TCSETS, tos)
	print("\x1B[0 q")
}
static inline void set_special_termconfig(struct termios *tos){
	tos->c_lflag &= (~ICANON & ~ECHO & ~ISIG); // same as tos.c_lflag &= ~(ICANON | ECHO | ISIG);
	ioctl(TCSETS, tos)
	print("\x1B[5 q") //\x1B[5 q //5 for vertical, 3 for under, 0 for default (square)
}
static inline void set_sigint_sig_mask(){
	sigset_t set;
	__sigemptyset(&set);
	__sigaddset(&set, SIGINT);
	sigprocmask(SIG_SETMASK, &set, VOID)
}
static inline void set_empty_sig_mask(){
	sigset_t set;
	__sigemptyset(&set);
	sigprocmask(SIG_SETMASK, &set, VOID)
}
static inline void init_term(){
	struct termios tos;
	ioctl(TCGETS, &tos)
	set_special_termconfig(&tos);
	set_sigint_sig_mask();
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
	#ifdef PID1
	if (getpid() == 1) {
		print("running as pid1 (init), not quitting")
		return;
	}
	#endif
	struct termios tos;
	set_normal_termconfig(&tos);
	exit(0)
}

static inline void exec(unsigned char outbuf[255], long outlen, char* env[]){
	unsigned char *argv[100];
	//int firstlen = 0;
	int firstlen = 1;
{
	const unsigned char *s = outbuf;
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
}
#ifdef SWITCH
	char path[255+255];
	switch(outbuf[0]){
		case '/':
			execve(outbuf, argv, env)
			break;
		case '.':
		if (outbuf[1] == '/'){
			int pathlen = getcwd255(path); // len of /home/hugo/
			memcpy(path+pathlen-1, outbuf+1, firstlen);
			execve(path, argv, env)
		}
		break;
		default:
			memcpy(path, "/bin/", 5);
			memcpy(path+5, outbuf, firstlen);
			path[firstlen+5] = 0;
			execve(path, argv, env)
	}
#else
	if (outbuf[0] == '/'){
		execve(argv[0], argv, env)
	} else if (outbuf[0] == '.' && outbuf[1] == '/') {
		char path[255+255];
		int pathlen = getcwd255(path); // len of /home/hugo/
		memcpy(path+pathlen-1, argv[0]+1, firstlen);
		execve(path, argv, env)
	} else {
		char path[255];
		memcpy(path, "/bin/", 5);
		memcpy(path+5, argv[0], firstlen);
		path[firstlen+5] = 0;
		execve(path, argv, env)
	}
#endif
}

#ifdef TAB_SUPPORT_CLANG_ONLY
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

#ifdef BUILTIN_FREE
typedef unsigned short u16; typedef unsigned int u32; typedef unsigned long long u64;
static u16 const c100[100] = {12336, 12592, 12848, 13104, 13360, 13616, 13872, 14128, 14384, 14640, 12337, 12593, 12849, 13105, 13361, 13617, 13873, 14129, 14385, 14641, 12338, 12594, 12850, 13106, 13362, 13618, 13874, 14130, 14386, 14642, 12339, 12595, 12851, 13107, 13363, 13619, 13875, 14131, 14387, 14643, 12340, 12596, 12852, 13108, 13364, 13620, 13876, 14132, 14388, 14644, 12341, 12597, 12853, 13109, 13365, 13621, 13877, 14133, 14389, 14645, 12342, 12598, 12854, 13110, 13366, 13622, 13878, 14134, 14390, 14646, 12343, 12599, 12855, 13111, 13367, 13623, 13879, 14135, 14391, 14647, 12344, 12600, 12856, 13112, 13368, 13624, 13880, 14136, 14392, 14648, 12345, 12601, 12857, 13113, 13369, 13625, 13881, 14137, 14393, 14649};
static inline void itoa(u64 val, char *p){
    while(val >= 100) {u64 tmp=val; memcpy(p-=2, &c100[tmp - ((val /= 100) * 100)], 2);}
    if(val >= 10) memcpy(p-=2, &c100[val], 2); else *--p = val|0x30;
}
void cmd_free(){
{
	           print("               total      buffer        free      shared\n");
	char memline[] = "Mem:               0           0           0           0\n";
	struct sysinfo info;
	_sysinfo(&info)
	itoa(info.totalram >> 10, &(memline)[20]);
	itoa(info.bufferram >> 10, &(memline)[32]);
	itoa(info.freeram >> 10, &(memline)[44]);
	itoa(info.sharedram >> 10, &(memline)[56]);
	printn(memline, 57)
}
{
	pid_t pid = fork();
	if ( pid == 0 ) {
		execve("/bin/free", ((char*[]){0}), NULL)
		exit(60); // file not found
	}
	wait4(pid, NULL, 0, 0);
}
{
	pid_t pid = fork();
	if ( pid == 0 ) {
		execve("/bin/sh", ((char*[]){"sh", "-c", "cat /proc/meminfo | head -n5", 0}), NULL)
		exit(60); // file not found
	}
	wait4(pid, NULL, 0, 0);
}
}
#endif

static inline long process_line(char inbuf, unsigned char outbuf[255], long outlen, long ptrlen, char* env[]){
while (1) {
	long bytes_read = getchar(&inbuf);
	if (bytes_read < 1) clean_exit();

	if (inbuf == 0x7f) { //backspace
		#ifdef CONTROLS
		if (ptrlen == 0) continue;
		if (ptrlen == outlen) {outlen--; outbuf[outlen]= 0;}
		ptrlen--;
		outbuf[ptrlen]= ' ';
		print("[D [D");
		#endif
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
	if (inbuf == 0x1B) { // ESC (terminal control)
		getchar(&inbuf)
		if (inbuf == '[') {
			getchar(&inbuf)
			#ifdef CONTROLS
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
			if (inbuf == 51){ //Del
				getchar(&inbuf)
				if (ptrlen == outlen) continue;
				if (ptrlen == outlen-1) {
					outbuf[ptrlen]= 0;
					outlen--;
				} else outbuf[ptrlen]= ' ';
				print(" [D");
				continue;
			}
			#endif
			//continue;
		}
		#ifdef DOUBLE_ESCAPE_QUIT
		else if (inbuf == 0x1B) {
			clean_exit(); //ESC pressed twice
		}
		#endif
		print("\n");
		return -4;
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
		#ifdef BUILTIN_FREE
		if (outlen == 1 && outbuf[0] == 'f'){
			cmd_free();
			return 0;
		}
		#endif
		if (outlen == 1 && outbuf[0] == 'q' || outlen == 4 && outbuf[0] == 'e' && outbuf[1] == 'x' && outbuf[2] == 'i' && outbuf[3] == 't') {
			clean_exit(); //EXIT_SUCCESS
		}
		#ifdef PID1
		if (outlen == 4 && outbuf[0] == 'p' && outbuf[1] == 'o' && outbuf[2] == 'o' && outbuf[3] == 'f') {
			if (getpid() == 1) {
				print("System is going Down Now\n")
				sync()
				reboot(LINUX_REBOOT_CMD_POWER_OFF)
			} else {
				print("Not pid1\n")
			}
			return -3;
		}
		if (outlen == 4 && outbuf[0] == 'r' && outbuf[1] == 'e' && outbuf[2] == 'b' && outbuf[3] == 'o') {
			if (getpid() == 1) {
				print("Rebooting Now\n")
				sync()
				reboot(LINUX_REBOOT_CMD_RESTART)
			} else {
				print("Not pid1\n")
			}
			return -3;
		}
		#endif

		struct termios tos;
		set_normal_termconfig(&tos);
		pid_t pid = fork();
		if ( pid == 0 ) {
			set_empty_sig_mask();
			exec(outbuf, outlen, env);
			exit(60); // file not found
		}
		int wstatus;
		int wres = wait4(pid, &wstatus, 0, 0);
		set_special_termconfig(&tos);
		if (wres < 1) {while (outlen) {outlen--; outbuf[outlen]= 0;} return -3;}
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
	if (inbuf == '\\'){
		getchar(&inbuf)
		if (inbuf == '\n'){
			print("\n");
			continue;
		}
	}
	//printn(&inbuf, 1);
	outbuf[ptrlen]=inbuf;
	if (ptrlen == outlen){
		outlen++;
		outbuf[outlen] = 0;
	}
	ptrlen++;
}}

int main(int argc, char* argv[]) {
	char **env = get_env()
	init_term();
	char inbuf;
	unsigned char outbuf[1000];
#ifndef COOL_PROMPT
	while (1) {
		print(" ❯ ");
		process_line(inbuf, outbuf, 0, 0, env);
		unsigned char *d = outbuf; while (*d) *d++ = 0; //zero command buffer
	}
#else
	char* allprompts = "[32m ❯ [31mx❯ [33m?❯ [34m!❯ [35m☠> [36mc❯ [0m";
	printn(allprompts+5, 5);
	while (1) {
		long promptidx;
		switch (process_line(inbuf, outbuf, 0, 0, env)){
			case -4: // unhandled terminal control
				promptidx = 10*5; //cyan
				break;
			case -3: // major failure or unhandled input
				promptidx = 10*4; //purple
				break;
			case -1: // SignalTerminated or abnormal exit
				promptidx = 10*3; //blue
				break;
			case 60: // file not found
				promptidx = 10*2; //yellow
				break;
			case 0: // exit_success (0)
				promptidx = 0; //green
				break;
			default: // non-zero exit (normal failure)
				promptidx = 10; //red
		}
		printn(allprompts+promptidx, 10);
		printn(allprompts+10*6, 4);
		//unsigned char *d = outbuf; while (*d) *d++ = 0; //zero command buffer
	}
#endif
}
