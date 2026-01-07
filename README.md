pid1sh installation:

step 1: compile c source to llvm-ir:
---
(change `-I/usr/lib/clang/21/include` with your clang version)
(unlikely to work, very cursed setup, use the provided pid1sh.ll with step 2 if it doesn't)
```bash
clang -cc1 -o pid1sh.ll pid1sh.c -Oz -emit-llvm -Qn -I/usr/lib/clang/21/include -I/usr/include
```

step 2: compile the rest of the way:
---
- option 1
```bash
llc     -o pid1sh.s pid1sh.ll
llvm-mc -o pid1sh.o pid1sh.s  -filetype obj
ld      -o pid1sh   pid1sh.o  -s -n
du -b pid1sh && ./pid1sh
```
it should display:
```
1968	pid1sh
❯ 
```
---
- option 2 
```bash
clang -cc1   -o pid1sh.s pid1sh.ll -Oz -S
clang -cc1as -o pid1sh.o pid1sh.s  -filetype obj -triple x86_64-unknown-linux
ld           -o pid1sh   pid1sh.o  -s -n
du -b pid1sh && ./pid1sh
```
it should display:
```
2000	pid1sh
❯ 
```

step 3: you're in the shell now
---
have fun, exit with `q` or `exit`

testing:
---
run `cat test.3.sh | ./pid1sh > test.3.log && diff test.3.gold test.3.log --color=always > test.3.diff`
warning: piping to stdin doesnt behave like in pratice, we should move to either
- automated typing in terminal
- automated copy-paste, either line by line or all at once is fine
