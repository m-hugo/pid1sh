pid1sh installation:

- best option:
(change `-I/usr/lib/clang/21/include` with your clang version)
```bash
clang -cc1 -o pid1sh.ll pid1sh.c  -Oz -emit-llvm -Qn -I/usr/lib/clang/21/include -I/usr/include
llc        -o pid1sh.s  pid1sh.ll
llvm-mc    -o pid1sh.o  pid1sh.s  -filetype obj
ld.bfd     -o pid1sh    pid1sh.o  -s -n -Os
du -b pid1sh && ./pid1sh
```
it should display:
```
1928	pid1sh
❯ 
```
---
- other options: 
```bash
clang -cc1   -o pid1sh.ll pid1sh.c  -Oz -emit-llvm -Qn -I/usr/lib/clang/21/include -I/usr/include
clang -cc1   -o pid1sh.s  pid1sh.ll -Oz -S -Qn
clang -cc1as -o pid1sh.o  pid1sh.s  -filetype obj -triple x86_64-unknown-linux
ld.bfd       -o pid1sh    pid1sh.o  -s -n 
du -b pid1sh && ./pid1sh
```
it should display:
```
1968	pid1sh
❯ 
```
---
```bash
clang -o pid1sh pid1sh.c -nostdlib -fno-stack-protector -Oz -s -static -Wl,-n,--build-id=none -Qn -fno-pic -fno-asynchronous-unwind-tables && du -b pid1sh && ./pid1sh
```
it should display:
```
1936	pid1sh
❯ 
```
---
```bash
gcc   -o pid1sh pid1sh.c -nostdlib -fno-stack-protector -Oz -s -static -Wl,-n,--build-id=none -Qn -fno-pic -fno-asynchronous-unwind-tables && du -b pid1sh && ./pid1sh
```
it should display:
```
1968	pid1sh
❯ 
```

TODO tcc compiles but doesn't run: `tcc -o pid1sh pid1sh.c -nostdlib -static && du -b pid1sh && ./pid1sh`
it only displays:
```
6200	a.out
```

you're in the shell now, have fun
exit with `q` or `exit`

testing:
---
run `cat test.3.sh | ./pid1sh > test.3.log && diff test.3.gold test.3.log --color=always > test.3.diff`
warning: piping to stdin doesnt behave like in pratice, we should move to either
- automated typing in terminal
- automated copy-paste, either line by line or all at once is fine
