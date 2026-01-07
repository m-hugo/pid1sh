; ModuleID = 'pid1sh.c'
source_filename = "pid1sh.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

module asm ".global _start"
module asm "_start:mov 0(%rsp),%rdi"
module asm "lea 8(%rsp),%rsi"
module asm "jmp main"

%struct.termios = type { i32, i32, i32, i32, i8, [19 x i8] }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [11 x i8] c" \E2\9D\AF \1B[5 q\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"\1B[35m\E2\98\A0>\1B[0m \00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"\1B[34m!\E2\9D\AF\1B[0m \00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"\1B[33m?\E2\9D\AF\1B[0m \00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"\1B[32m \E2\9D\AF\1B[0m \00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"\1B[31mx\E2\9D\AF\1B[0m \00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"\1B[D \1B[D\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"/bin\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"\1B7\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"\1B8\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"\1B[D\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"\1B[C\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"\1B[0 q\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"\1B[5 q\00", align 1
@.str.14 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"/bin/\00", align 1

; Function Attrs: minsize noreturn nounwind optsize
define dso_local noundef i32 @main(i32 noundef %argc, ptr noundef %argv) local_unnamed_addr #0 {
entry:
  %buf.i.i = alloca [50 x i8], align 16
  %inbuf.addr.i = alloca i8, align 1
  %tos.i14 = alloca %struct.termios, align 4
  %set.i15 = alloca %struct.__sigset_t, align 8
  %wstatus.i = alloca i32, align 4
  %tos.i = alloca %struct.termios, align 4
  %set.i = alloca %struct.__sigset_t, align 8
  %outbuf = alloca [1000 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %tos.i) #7
  %0 = ptrtoint ptr %tos.i to i64
  %1 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21505, i64 %0, i64 16) #7, !srcloc !1
  %c_lflag.i = getelementptr inbounds nuw i8, ptr %tos.i, i64 12
  %2 = load i32, ptr %c_lflag.i, align 4, !tbaa !2
  %and.i = and i32 %2, -11
  store i32 %and.i, ptr %c_lflag.i, align 4, !tbaa !2
  %3 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %0, i64 16) #7, !srcloc !7
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %set.i) #7
  store i64 2, ptr %set.i, align 8, !tbaa !8
  %4 = ptrtoint ptr %set.i to i64
  %5 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %4, i64 0, i64 8, i64 14) #7, !srcloc !10
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %set.i) #7
  call void @llvm.lifetime.end.p0(i64 36, ptr nonnull %tos.i) #7
  call void @llvm.lifetime.start.p0(i64 1000, ptr nonnull %outbuf) #7
  %6 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str to i64), i64 10, i64 1) #7, !srcloc !11
  %7 = ptrtoint ptr %inbuf.addr.i to i64
  %8 = ptrtoint ptr %buf.i.i to i64
  %invariant.gep = getelementptr i8, ptr %outbuf, i64 -1
  %arrayidx163.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 1
  %arrayidx168.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 2
  %arrayidx228.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 3
  %9 = ptrtoint ptr %tos.i14 to i64
  %c_lflag.i16 = getelementptr inbounds nuw i8, ptr %tos.i14, i64 12
  %10 = ptrtoint ptr %wstatus.i to i64
  %11 = ptrtoint ptr %arrayidx228.i to i64
  br label %while.cond

while.cond:                                       ; preds = %while.cond11, %entry
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i.backedge, %while.cond
  %ptrlen.addr.0.i = phi i64 [ 0, %while.cond ], [ %ptrlen.addr.0.i.be, %while.body.i.backedge ]
  %outlen.addr.0.i = phi i64 [ 0, %while.cond ], [ %outlen.addr.0.i.be, %while.body.i.backedge ]
  %12 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #7, !srcloc !12
  %cmp.i = icmp slt i64 %12, 1
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @clean_exit() #8
  unreachable

if.end.i:                                         ; preds = %while.body.i
  %13 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  switch i8 %13, label %if.end116.i [
    i8 127, label %if.then3.i
    i8 9, label %if.then24.i
    i8 27, label %if.then52.i
    i8 3, label %while.body.i.backedge
  ]

if.then3.i:                                       ; preds = %if.end.i
  %cmp4.i = icmp eq i64 %ptrlen.addr.0.i, 0
  br i1 %cmp4.i, label %while.body.i.backedge, label %if.end7.i

if.end7.i:                                        ; preds = %if.then3.i
  %cmp8.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  %dec.i = add nsw i64 %ptrlen.addr.0.i, -1
  %spec.select = select i1 %cmp8.i, i64 %dec.i, i64 %outlen.addr.0.i
  %arrayidx13.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec.i
  store i8 32, ptr %arrayidx13.i, align 1, !tbaa !13
  %14 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.6 to i64), i64 7, i64 1) #7, !srcloc !14
  br label %while.body.i.backedge

if.then24.i:                                      ; preds = %if.end.i
  %15 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 ptrtoint (ptr @.str.7 to i64), i64 65536, i64 2) #7, !srcloc !15
  %16 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.8 to i64), i64 2, i64 1) #7, !srcloc !16
  call void @llvm.lifetime.start.p0(i64 50, ptr nonnull %buf.i.i) #7
  %17 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.14 to i64), i64 1, i64 1) #7, !srcloc !17
  %sext398.i = shl i64 %15, 32
  %conv.i.i = ashr exact i64 %sext398.i, 32
  br label %for.cond.i.i

for.cond.i.i:                                     ; preds = %for.inc.i.i, %if.then24.i
  %cnt.0.i.i = phi i32 [ 0, %if.then24.i ], [ %inc.i.i, %for.inc.i.i ]
  %exitcond.not.i.i = icmp eq i32 %cnt.0.i.i, 60
  br i1 %exitcond.not.i.i, label %tab_completion.exit.i, label %for.body.i.i

for.body.i.i:                                     ; preds = %for.cond.i.i
  %18 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %conv.i.i, i64 %8, i64 40, i64 78) #7, !srcloc !18
  %conv7.i.i = trunc i64 %18 to i32
  %19 = add i32 %conv7.i.i, -1
  %or.cond.i.i = icmp ult i32 %19, 40
  br i1 %or.cond.i.i, label %while.cond.i.i, label %tab_completion.exit.i

while.cond.i.i:                                   ; preds = %for.body.i.i, %while.cond.i.i.backedge
  %bufptr.1.i.i = phi i32 [ %add.i.i, %while.cond.i.i.backedge ], [ 0, %for.body.i.i ]
  %cmp12.i.i = icmp slt i32 %bufptr.1.i.i, %conv7.i.i
  br i1 %cmp12.i.i, label %while.body.i.i, label %for.inc.i.i

while.body.i.i:                                   ; preds = %while.cond.i.i
  %idx.ext.i.i = zext nneg i32 %bufptr.1.i.i to i64
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %buf.i.i, i64 %idx.ext.i.i
  %d_reclen.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i.i, i64 16
  %20 = load i16, ptr %d_reclen.i.i, align 8, !tbaa !19
  %conv15.i.i = zext i16 %20 to i32
  %add.i.i = add nuw nsw i32 %bufptr.1.i.i, %conv15.i.i
  %d_name.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i.i, i64 18
  %21 = load i8, ptr %d_name.i.i, align 2, !tbaa !13
  %cmp17.not.i.i = icmp eq i8 %21, 46
  br i1 %cmp17.not.i.i, label %while.cond.i.i.backedge, label %land.lhs.true.i.i

land.lhs.true.i.i:                                ; preds = %while.body.i.i
  %22 = ptrtoint ptr %d_name.i.i to i64
  %23 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %conv.i.i, i64 %22, i64 1, i64 269) #7, !srcloc !21
  %cmp.i.not.i.i = icmp eq i64 %23, 0
  br i1 %cmp.i.not.i.i, label %while.cond.i.preheader, label %while.cond.i.i.backedge

while.cond.i.preheader:                           ; preds = %land.lhs.true.i.i
  %strlen = call fastcc i64 @strlen(ptr dereferenceable(1) %d_name.i.i)
  %24 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %22, i64 %strlen, i64 1) #7, !srcloc !22
  %25 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.14 to i64), i64 1, i64 1) #7, !srcloc !23
  br label %while.cond.i.i.backedge

while.cond.i.i.backedge:                          ; preds = %while.cond.i.preheader, %land.lhs.true.i.i, %while.body.i.i
  br label %while.cond.i.i, !llvm.loop !24

for.inc.i.i:                                      ; preds = %while.cond.i.i
  %inc.i.i = add nuw nsw i32 %cnt.0.i.i, 1
  br label %for.cond.i.i, !llvm.loop !26

tab_completion.exit.i:                            ; preds = %for.body.i.i, %for.cond.i.i
  call void @llvm.lifetime.end.p0(i64 50, ptr nonnull %buf.i.i) #7
  %26 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.9 to i64), i64 2, i64 1) #7, !srcloc !27
  %27 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %conv.i.i, i64 3) #7, !srcloc !28
  br label %while.body.i.backedge

if.then52.i:                                      ; preds = %if.end.i
  %28 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #7, !srcloc !29
  %29 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  %cmp60.i = icmp eq i8 %29, 91
  br i1 %cmp60.i, label %if.then62.i, label %process_line.exit.thread

if.then62.i:                                      ; preds = %if.then52.i
  %30 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #7, !srcloc !30
  %31 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  switch i8 %31, label %process_line.exit.thread [
    i8 68, label %if.then72.i
    i8 67, label %if.then88.i
    i8 65, label %while.body.i.backedge
    i8 66, label %while.body.i.backedge
  ]

if.then72.i:                                      ; preds = %if.then62.i
  %cmp73.i = icmp eq i64 %ptrlen.addr.0.i, 0
  br i1 %cmp73.i, label %while.body.i.backedge, label %if.end76.i

if.end76.i:                                       ; preds = %if.then72.i
  %dec77.i = add nsw i64 %ptrlen.addr.0.i, -1
  %32 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.10 to i64), i64 3, i64 1) #7, !srcloc !31
  br label %while.body.i.backedge

if.then88.i:                                      ; preds = %if.then62.i
  %cmp89.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  br i1 %cmp89.i, label %while.body.i.backedge, label %if.end92.i

if.end92.i:                                       ; preds = %if.then88.i
  %inc.i = add nsw i64 %ptrlen.addr.0.i, 1
  %33 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.11 to i64), i64 3, i64 1) #7, !srcloc !32
  br label %while.body.i.backedge

if.end116.i:                                      ; preds = %if.end.i
  %34 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %7, i64 1, i64 1) #7, !srcloc !33
  %35 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  switch i8 %35, label %if.end320.i [
    i8 35, label %if.then129.i
    i8 10, label %if.then129.i
  ]

if.then129.i:                                     ; preds = %if.end116.i, %if.end116.i
  %gep = getelementptr i8, ptr %invariant.gep, i64 %outlen.addr.0.i
  %36 = load i8, ptr %gep, align 1, !tbaa !13
  %cmp132.i = icmp eq i8 %36, 32
  br i1 %cmp132.i, label %if.then134.i, label %if.end137.i

if.then134.i:                                     ; preds = %if.then129.i
  %dec135.i = add nsw i64 %outlen.addr.0.i, -1
  %arrayidx136.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec135.i
  store i8 0, ptr %arrayidx136.i, align 1, !tbaa !13
  br label %if.end137.i

if.end137.i:                                      ; preds = %if.then134.i, %if.then129.i
  %outlen.addr.2.i = phi i64 [ %dec135.i, %if.then134.i ], [ %outlen.addr.0.i, %if.then129.i ]
  br label %while.cond138.i

while.cond138.i:                                  ; preds = %while.body142.i, %if.end137.i
  %37 = phi i8 [ %.pre.i, %while.body142.i ], [ %35, %if.end137.i ]
  %cmp140.not.i = icmp eq i8 %37, 10
  br i1 %cmp140.not.i, label %while.end.i, label %while.body142.i

while.body142.i:                                  ; preds = %while.cond138.i
  %38 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #7, !srcloc !34
  %39 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %7, i64 1, i64 1) #7, !srcloc !35
  %.pre.i = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  br label %while.cond138.i, !llvm.loop !36

while.end.i:                                      ; preds = %while.cond138.i
  %cmp155.i = icmp eq i64 %outlen.addr.2.i, 0
  br i1 %cmp155.i, label %process_line.exit.thread23, label %if.end158.i

process_line.exit.thread23:                       ; preds = %while.end.i
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %sw.bb3

if.end158.i:                                      ; preds = %while.end.i
  %40 = load i8, ptr %outbuf, align 16, !tbaa !13
  %cmp161.i = icmp eq i8 %40, 99
  %41 = load i8, ptr %arrayidx163.i, align 1
  %cmp165.i = icmp eq i8 %41, 100
  %or.cond = select i1 %cmp161.i, i1 %cmp165.i, i1 false
  %42 = load i8, ptr %arrayidx168.i, align 2
  %cmp170.i = icmp eq i8 %42, 32
  %or.cond25 = select i1 %or.cond, i1 %cmp170.i, i1 false
  br i1 %or.cond25, label %if.then172.i, label %if.end177.i

if.then172.i:                                     ; preds = %if.end158.i
  %43 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %11, i64 80) #7, !srcloc !37
  br label %process_line.exit

if.end177.i:                                      ; preds = %if.end158.i
  switch i64 %outlen.addr.2.i, label %if.end239.i [
    i64 1, label %land.lhs.true180.i
    i64 4, label %land.lhs.true188.i
  ]

land.lhs.true180.i:                               ; preds = %if.end177.i
  %cmp183.i = icmp eq i8 %40, 113
  br i1 %cmp183.i, label %if.end209.i, label %if.end239.i

land.lhs.true188.i:                               ; preds = %if.end177.i
  switch i8 %40, label %if.end239.i [
    i8 101, label %land.lhs.true193.i
    i8 112, label %land.lhs.true217.i
  ]

land.lhs.true193.i:                               ; preds = %land.lhs.true188.i
  %cmp196.i = icmp eq i8 %41, 120
  %cmp201.i = icmp eq i8 %42, 105
  %or.cond26 = select i1 %cmp196.i, i1 %cmp201.i, i1 false
  %44 = load i8, ptr %arrayidx228.i, align 1
  %cmp206.i = icmp eq i8 %44, 116
  %or.cond27 = select i1 %or.cond26, i1 %cmp206.i, i1 false
  br i1 %or.cond27, label %if.end209.i, label %if.end239.i

if.end209.i:                                      ; preds = %land.lhs.true193.i, %land.lhs.true180.i
  call fastcc void @clean_exit() #8
  unreachable

land.lhs.true217.i:                               ; preds = %land.lhs.true188.i
  %cmp220.i = icmp eq i8 %41, 111
  %cmp225.i = icmp eq i8 %42, 111
  %or.cond28 = select i1 %cmp220.i, i1 %cmp225.i, i1 false
  %45 = load i8, ptr %arrayidx228.i, align 1
  %cmp230.i = icmp eq i8 %45, 102
  %or.cond29 = select i1 %or.cond28, i1 %cmp230.i, i1 false
  br i1 %or.cond29, label %land.lhs.true232.i, label %if.end239.i

land.lhs.true232.i:                               ; preds = %land.lhs.true217.i
  %46 = call i64 asm sideeffect "syscall\0A", "={ax},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 39) #7, !srcloc !38
  %cmp236.i = icmp eq i64 %46, 1
  br i1 %cmp236.i, label %process_line.exit.thread, label %if.end239.i

if.end239.i:                                      ; preds = %land.lhs.true232.i, %land.lhs.true217.i, %land.lhs.true193.i, %land.lhs.true188.i, %land.lhs.true180.i, %if.end177.i
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %tos.i14) #7
  %47 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21505, i64 %9, i64 16) #7, !srcloc !39
  %48 = load i32, ptr %c_lflag.i16, align 4, !tbaa !2
  %or.i = or i32 %48, 10
  store i32 %or.i, ptr %c_lflag.i16, align 4, !tbaa !2
  %49 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %9, i64 16) #7, !srcloc !40
  %50 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.12 to i64), i64 5, i64 1) #7, !srcloc !41
  %51 = call i64 asm sideeffect "syscall\0A", "={ax},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 57) #7, !srcloc !42
  %52 = and i64 %51, 4294967295
  %cmp262.i = icmp eq i64 %52, 0
  br i1 %cmp262.i, label %if.then264.i, label %if.end275.i

if.then264.i:                                     ; preds = %if.end239.i
  %53 = sext i32 %argc to i64
  %54 = getelementptr ptr, ptr %argv, i64 %53
  %arrayidx = getelementptr i8, ptr %54, i64 8
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %set.i15) #7
  store i64 0, ptr %set.i15, align 8, !tbaa !8
  %55 = ptrtoint ptr %set.i15 to i64
  %56 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %55, i64 0, i64 8, i64 14) #7, !srcloc !43
  call fastcc void @exec(ptr noundef nonnull %outbuf, i64 noundef %outlen.addr.2.i, ptr noundef %arrayidx) #8
  %57 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 60, i64 60) #7, !srcloc !44
  unreachable

if.end275.i:                                      ; preds = %if.end239.i
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %wstatus.i) #7
  %sext.i = shl i64 %51, 32
  %conv279.i = ashr exact i64 %sext.i, 32
  %58 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %conv279.i, i64 %10, i64 0, i64 0, i64 61) #7, !srcloc !45
  %cmp284.i = icmp slt i64 %58, 1
  br i1 %cmp284.i, label %while.cond287.i, label %if.end292.i

while.cond287.i:                                  ; preds = %if.end275.i, %while.body288.i
  %outlen.addr.3.i = phi i64 [ %dec289.i, %while.body288.i ], [ %outlen.addr.2.i, %if.end275.i ]
  %tobool.not.i = icmp eq i64 %outlen.addr.3.i, 0
  br i1 %tobool.not.i, label %cleanup.i, label %while.body288.i

while.body288.i:                                  ; preds = %while.cond287.i
  %dec289.i = add nsw i64 %outlen.addr.3.i, -1
  %arrayidx290.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec289.i
  store i8 0, ptr %arrayidx290.i, align 1, !tbaa !13
  br label %while.cond287.i, !llvm.loop !46

if.end292.i:                                      ; preds = %if.end275.i
  %59 = load i32, ptr %c_lflag.i16, align 4, !tbaa !2
  %and.i17 = and i32 %59, -11
  store i32 %and.i17, ptr %c_lflag.i16, align 4, !tbaa !2
  %60 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %9, i64 16) #7, !srcloc !47
  %61 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.13 to i64), i64 5, i64 1) #7, !srcloc !48
  %62 = load i32, ptr %wstatus.i, align 4, !tbaa !49
  %and306.i = and i32 %62, 127
  %tobool307.not.i = icmp eq i32 %and306.i, 0
  br i1 %tobool307.not.i, label %if.end315.i, label %if.then308.i

if.then308.i:                                     ; preds = %if.end292.i
  %63 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.14 to i64), i64 1, i64 1) #7, !srcloc !50
  br label %cleanup.i

if.end315.i:                                      ; preds = %if.end292.i
  %and316.i = lshr i32 %62, 8
  %shr.i = and i32 %and316.i, 255
  %conv317.i = zext nneg i32 %shr.i to i64
  br label %cleanup.i

cleanup.i:                                        ; preds = %while.cond287.i, %if.end315.i, %if.then308.i
  %retval.1.i = phi i64 [ -1, %if.then308.i ], [ %conv317.i, %if.end315.i ], [ -3, %while.cond287.i ]
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %wstatus.i) #7
  call void @llvm.lifetime.end.p0(i64 36, ptr nonnull %tos.i14) #7
  br label %process_line.exit

if.end320.i:                                      ; preds = %if.end116.i
  %cmp322.i = icmp slt i8 %35, 32
  br i1 %cmp322.i, label %if.then324.i, label %if.end331.i

if.then324.i:                                     ; preds = %if.end320.i
  %64 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.14 to i64), i64 1, i64 1) #7, !srcloc !51
  br label %process_line.exit.thread

if.end331.i:                                      ; preds = %if.end320.i
  %arrayidx332.i = getelementptr inbounds i8, ptr %outbuf, i64 %ptrlen.addr.0.i
  store i8 %35, ptr %arrayidx332.i, align 1, !tbaa !13
  %cmp333.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  %inc336.i = zext i1 %cmp333.i to i64
  %spec.select.i = add nsw i64 %outlen.addr.0.i, %inc336.i
  %inc338.i = add nsw i64 %ptrlen.addr.0.i, 1
  br label %while.body.i.backedge

while.body.i.backedge:                            ; preds = %if.end331.i, %if.end92.i, %if.then88.i, %if.end76.i, %if.then72.i, %if.then62.i, %if.then62.i, %tab_completion.exit.i, %if.end7.i, %if.then3.i, %if.end.i
  %ptrlen.addr.0.i.be = phi i64 [ %dec.i, %if.end7.i ], [ %ptrlen.addr.0.i, %tab_completion.exit.i ], [ %dec77.i, %if.end76.i ], [ %inc.i, %if.end92.i ], [ %inc338.i, %if.end331.i ], [ 0, %if.then3.i ], [ 0, %if.then72.i ], [ %ptrlen.addr.0.i, %if.then88.i ], [ %ptrlen.addr.0.i, %if.then62.i ], [ %ptrlen.addr.0.i, %if.then62.i ], [ %ptrlen.addr.0.i, %if.end.i ]
  %outlen.addr.0.i.be = phi i64 [ %spec.select, %if.end7.i ], [ %outlen.addr.0.i, %tab_completion.exit.i ], [ %outlen.addr.0.i, %if.end76.i ], [ %outlen.addr.0.i, %if.end92.i ], [ %spec.select.i, %if.end331.i ], [ %outlen.addr.0.i, %if.then3.i ], [ %outlen.addr.0.i, %if.then72.i ], [ %ptrlen.addr.0.i, %if.then88.i ], [ %outlen.addr.0.i, %if.then62.i ], [ %outlen.addr.0.i, %if.then62.i ], [ %outlen.addr.0.i, %if.end.i ]
  br label %while.body.i

process_line.exit.thread:                         ; preds = %if.then62.i, %if.then52.i, %land.lhs.true232.i, %if.then324.i
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %sw.epilog

process_line.exit:                                ; preds = %if.then172.i, %cleanup.i
  %retval.2397.i = phi i64 [ %retval.1.i, %cleanup.i ], [ %43, %if.then172.i ]
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  switch i64 %retval.2397.i, label %sw.default [
    i64 -3, label %sw.epilog
    i64 -1, label %sw.bb1
    i64 60, label %sw.bb2
    i64 0, label %sw.bb3
  ]

sw.bb1:                                           ; preds = %process_line.exit
  br label %sw.epilog

sw.bb2:                                           ; preds = %process_line.exit
  br label %sw.epilog

sw.bb3:                                           ; preds = %process_line.exit.thread23, %process_line.exit
  br label %sw.epilog

sw.default:                                       ; preds = %process_line.exit
  br label %sw.epilog

sw.epilog:                                        ; preds = %process_line.exit.thread, %process_line.exit, %sw.default, %sw.bb3, %sw.bb2, %sw.bb1
  %prompt.0 = phi ptr [ @.str.5, %sw.default ], [ @.str.2, %sw.bb1 ], [ @.str.3, %sw.bb2 ], [ @.str.4, %sw.bb3 ], [ @.str.1, %process_line.exit ], [ @.str.1, %process_line.exit.thread ]
  %65 = ptrtoint ptr %prompt.0 to i64
  %66 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %65, i64 14, i64 1) #7, !srcloc !52
  br label %while.cond11

while.cond11:                                     ; preds = %while.body12, %sw.epilog
  %d.0 = phi ptr [ %outbuf, %sw.epilog ], [ %incdec.ptr, %while.body12 ]
  %67 = load i8, ptr %d.0, align 1, !tbaa !13
  %tobool.not = icmp eq i8 %67, 0
  br i1 %tobool.not, label %while.cond, label %while.body12

while.body12:                                     ; preds = %while.cond11
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %d.0, i64 1
  store i8 0, ptr %d.0, align 1, !tbaa !13
  br label %while.cond11, !llvm.loop !53
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: inlinehint minsize nounwind optsize
define internal fastcc void @exec(ptr noundef nonnull %outbuf, i64 noundef %outlen, ptr noundef %env) unnamed_addr #2 {
entry:
  %argv = alloca [100 x ptr], align 16
  %path = alloca [100 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 800, ptr nonnull %argv) #7
  %smax = tail call i64 @llvm.smax.i64(i64 %outlen, i64 1)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %while.body ], [ 1, %entry ]
  %s.0 = phi ptr [ %incdec.ptr, %while.body ], [ %outbuf, %entry ]
  %cmp = icmp sgt i64 %outlen, %indvars.iv
  br i1 %cmp, label %land.lhs.true, label %while.end

land.lhs.true:                                    ; preds = %while.cond
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %s.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !13
  switch i8 %0, label %while.body [
    i8 0, label %while.end
    i8 32, label %while.end
  ]

while.body:                                       ; preds = %land.lhs.true
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %while.cond, !llvm.loop !54

while.end:                                        ; preds = %land.lhs.true, %land.lhs.true, %while.cond
  %conv.lcssa = phi i64 [ %indvars.iv, %land.lhs.true ], [ %indvars.iv, %land.lhs.true ], [ %smax, %while.cond ]
  %s.1 = phi ptr [ %incdec.ptr, %land.lhs.true ], [ %incdec.ptr, %land.lhs.true ], [ %s.0, %while.cond ]
  %firstlen.0.lcssa = trunc i64 %conv.lcssa to i32
  store ptr %outbuf, ptr %argv, align 16, !tbaa !55
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %outbuf, i64 %conv.lcssa
  store i8 0, ptr %arrayidx7, align 1, !tbaa !13
  br label %while.cond8

while.cond8:                                      ; preds = %while.end28, %while.end
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %while.end28 ], [ 1, %while.end ]
  %totalen.0 = phi i32 [ %add, %while.end28 ], [ %firstlen.0.lcssa, %while.end ]
  %s.2 = phi ptr [ %incdec.ptr18, %while.end28 ], [ %s.1, %while.end ]
  %conv9 = sext i32 %totalen.0 to i64
  %cmp10 = icmp sgt i64 %outlen, %conv9
  br i1 %cmp10, label %while.cond13, label %while.end37

while.cond13:                                     ; preds = %while.cond8, %while.body26
  %sndlen.0 = phi i32 [ %inc27, %while.body26 ], [ 0, %while.cond8 ]
  %s.3 = phi ptr [ %incdec.ptr18, %while.body26 ], [ %s.2, %while.cond8 ]
  %incdec.ptr18 = getelementptr inbounds nuw i8, ptr %s.3, i64 1
  %1 = load i8, ptr %incdec.ptr18, align 1, !tbaa !13
  switch i8 %1, label %while.body26 [
    i8 0, label %while.end28
    i8 32, label %while.end28
  ]

while.body26:                                     ; preds = %while.cond13
  %inc27 = add nuw nsw i32 %sndlen.0, 1
  br label %while.cond13, !llvm.loop !58

while.end28:                                      ; preds = %while.cond13, %while.cond13
  %inc29 = add nsw i32 %totalen.0, 1
  %idx.ext = sext i32 %inc29 to i64
  %add.ptr = getelementptr inbounds i8, ptr %outbuf, i64 %idx.ext
  %arrayidx31 = getelementptr inbounds nuw [100 x ptr], ptr %argv, i64 0, i64 %indvars.iv86
  store ptr %add.ptr, ptr %arrayidx31, align 8, !tbaa !55
  %idxprom34 = zext nneg i32 %sndlen.0 to i64
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %add.ptr, i64 %idxprom34
  store i8 0, ptr %arrayidx35, align 1, !tbaa !13
  %add = add nsw i32 %sndlen.0, %inc29
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  br label %while.cond8, !llvm.loop !59

while.end37:                                      ; preds = %while.cond8
  %idxprom38 = and i64 %indvars.iv86, 4294967295
  %arrayidx39 = getelementptr inbounds nuw [100 x ptr], ptr %argv, i64 0, i64 %idxprom38
  store ptr null, ptr %arrayidx39, align 8, !tbaa !55
  %2 = load i8, ptr %outbuf, align 1, !tbaa !13
  %cmp43.not = icmp eq i8 %2, 47
  br i1 %cmp43.not, label %if.else, label %if.then

if.then:                                          ; preds = %while.end37
  call void @llvm.lifetime.start.p0(i64 100, ptr nonnull %path) #7
  %call = call fastcc ptr @memcpy(ptr noundef %path, ptr noundef nonnull @.str.15, i64 noundef 5) #8
  %add.ptr46 = getelementptr inbounds nuw i8, ptr %path, i64 5
  %call49 = call fastcc ptr @memcpy(ptr noundef %add.ptr46, ptr noundef nonnull %outbuf, i64 noundef %conv.lcssa) #8
  %add50 = add nuw i64 %conv.lcssa, 5
  %idxprom51 = and i64 %add50, 4294967295
  %arrayidx52 = getelementptr inbounds nuw [100 x i8], ptr %path, i64 0, i64 %idxprom51
  store i8 0, ptr %arrayidx52, align 1, !tbaa !13
  %3 = ptrtoint ptr %path to i64
  %4 = ptrtoint ptr %argv to i64
  %5 = ptrtoint ptr %env to i64
  %6 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %3, i64 %4, i64 %5, i64 59) #7, !srcloc !60
  call void @llvm.lifetime.end.p0(i64 100, ptr nonnull %path) #7
  br label %if.end

if.else:                                          ; preds = %while.end37
  %7 = ptrtoint ptr %outbuf to i64
  %8 = ptrtoint ptr %argv to i64
  %9 = ptrtoint ptr %env to i64
  %10 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %7, i64 %8, i64 %9, i64 59) #7, !srcloc !61
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.lifetime.end.p0(i64 800, ptr nonnull %argv) #7
  ret void
}

; Function Attrs: inlinehint minsize noreturn nounwind optsize
define internal fastcc void @clean_exit() unnamed_addr #3 {
entry:
  %tos = alloca %struct.termios, align 4
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %tos) #7
  %0 = ptrtoint ptr %tos to i64
  %1 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21505, i64 %0, i64 16) #7, !srcloc !62
  %c_lflag = getelementptr inbounds nuw i8, ptr %tos, i64 12
  %2 = load i32, ptr %c_lflag, align 4, !tbaa !2
  %or = or i32 %2, 10
  store i32 %or, ptr %c_lflag, align 4, !tbaa !2
  %3 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %0, i64 16) #7, !srcloc !63
  %4 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 60) #7, !srcloc !64
  unreachable
}

; Function Attrs: inlinehint minsize nocallback nofree norecurse nosync nounwind optsize willreturn memory(argmem: read)
define internal fastcc i64 @strlen(ptr noundef nonnull readonly captures(none) %s) unnamed_addr #4 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %entry
  %len.0 = phi i64 [ 0, %entry ], [ %inc, %while.cond ]
  %arrayidx = getelementptr inbounds nuw i8, ptr %s, i64 %len.0
  %0 = load i8, ptr %arrayidx, align 1, !tbaa !13
  %tobool.not = icmp eq i8 %0, 0
  %inc = add i64 %len.0, 1
  br i1 %tobool.not, label %while.end, label %while.cond, !llvm.loop !65

while.end:                                        ; preds = %while.cond
  ret i64 %len.0
}

; Function Attrs: inlinehint minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define internal fastcc noundef nonnull ptr @memcpy(ptr noundef nonnull returned writeonly captures(ret: address, provenance) %dest, ptr noundef readonly captures(none) %src, i64 noundef range(i64 -2147483648, 2147483648) %n) unnamed_addr #5 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %n.addr.0 = phi i64 [ %n, %entry ], [ %dec, %for.body ]
  %d.0 = phi ptr [ %dest, %entry ], [ %incdec.ptr1, %for.body ]
  %s.0 = phi ptr [ %src, %entry ], [ %incdec.ptr, %for.body ]
  %tobool.not = icmp eq i64 %n.addr.0, 0
  br i1 %tobool.not, label %for.end, label %for.body

for.body:                                         ; preds = %for.cond
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %s.0, i64 1
  %0 = load i8, ptr %s.0, align 1, !tbaa !13
  %incdec.ptr1 = getelementptr inbounds nuw i8, ptr %d.0, i64 1
  store i8 %0, ptr %d.0, align 1, !tbaa !13
  %dec = add i64 %n.addr.0, -1
  br label %for.cond, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  ret ptr %dest
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #6

attributes #0 = { minsize noreturn nounwind optsize "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { inlinehint minsize nounwind optsize "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #3 = { inlinehint minsize noreturn nounwind optsize "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #4 = { inlinehint minsize nocallback nofree norecurse nosync nounwind optsize willreturn memory(argmem: read) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #5 = { inlinehint minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { nounwind }
attributes #8 = { minsize optsize }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i64 2147783520}
!2 = !{!3, !4, i64 12}
!3 = !{!"termios", !4, i64 0, !4, i64 4, !4, i64 8, !4, i64 12, !5, i64 16, !5, i64 17}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 2147783967}
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !5, i64 0}
!10 = !{i64 2147784454}
!11 = !{i64 2147801980}
!12 = !{i64 2147790424}
!13 = !{!5, !5, i64 0}
!14 = !{i64 2147790964}
!15 = !{i64 2147791375}
!16 = !{i64 2147791889}
!17 = !{i64 2147788518}
!18 = !{i64 2147788876}
!19 = !{!20, !20, i64 0}
!20 = !{!"short", !5, i64 0}
!21 = !{i64 2147783091}
!22 = !{i64 2147789419}
!23 = !{i64 2147789950}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
!27 = !{i64 2147792414}
!28 = !{i64 2147792717}
!29 = !{i64 2147793144}
!30 = !{i64 2147793603}
!31 = !{i64 2147794119}
!32 = !{i64 2147794652}
!33 = !{i64 2147795114}
!34 = !{i64 2147795573}
!35 = !{i64 2147796018}
!36 = distinct !{!36, !25}
!37 = !{i64 2147796311}
!38 = !{i64 2147796517}
!39 = !{i64 2147796896}
!40 = !{i64 2147797343}
!41 = !{i64 2147797878}
!42 = !{i64 2147798128}
!43 = !{i64 2147798561}
!44 = !{i64 2147798887}
!45 = !{i64 2147799324}
!46 = distinct !{!46, !25}
!47 = !{i64 2147799783}
!48 = !{i64 2147800318}
!49 = !{!4, !4, i64 0}
!50 = !{i64 2147800849}
!51 = !{i64 2147801407}
!52 = !{i64 2147802458}
!53 = distinct !{!53, !25}
!54 = distinct !{!54, !25}
!55 = !{!56, !56, i64 0}
!56 = !{!"p1 omnipotent char", !57, i64 0}
!57 = !{!"any pointer", !5, i64 0}
!58 = distinct !{!58, !25}
!59 = distinct !{!59, !25}
!60 = !{i64 2147787644}
!61 = !{i64 2147788069}
!62 = !{i64 2147786492}
!63 = !{i64 2147786939}
!64 = !{i64 2147787258}
!65 = distinct !{!65, !25}
!66 = distinct !{!66, !25}
