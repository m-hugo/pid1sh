pid1sh installation:

compile c source to llvmir:
(change `-I/usr/lib/clang/21/include` with your clang version)
(unlikely to work, very cursed setup, use the provided pid1sh.ll with step 2 if it doesn't)
```bash
clang -cc1   -o pid1sh.ll pid1sh.c  -Oz -emit-llvm -Qn -I/usr/lib/clang/21/include -I/usr/include
```

step 2: compile the rest of the way:
```bash
clang -cc1   -o pid1sh.s  pid1sh.ll -Oz -S
clang -cc1as -o pid1sh.o  pid1sh.s  -filetype obj -triple x86_64-unknown-linux
ld    -s -n  -o pid1sh    pid1sh.o
du -b pid1sh
```

it should display just:
```
1944	pid1sh
❯ 
```

you're in the shell now, have fun

testing:
run `cat test.3.sh | ./pid1sh > test.3.log && diff test.3.gold test.3.log --color=always > test.3.diff`
warning: piping to stdin doesnt behave like in pratice, we should move to either
1 automated typing in terminal
2 automated copy-paste, either line by line or all at once is fine
