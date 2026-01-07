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
@.str.8 = private unnamed_addr constant [4 x i8] c"\1B[D\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"\1B[C\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"\1B[0 q\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"\1B[5 q\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"/bin/\00", align 1

; Function Attrs: minsize noreturn nounwind optsize
define dso_local noundef i32 @main(i32 noundef %argc, ptr noundef %argv) local_unnamed_addr #0 {
entry:
  %inbuf.addr.i = alloca i8, align 1
  %tos.i14 = alloca %struct.termios, align 4
  %set.i15 = alloca %struct.__sigset_t, align 8
  %wstatus.i = alloca i32, align 4
  %tos.i = alloca %struct.termios, align 4
  %set.i = alloca %struct.__sigset_t, align 8
  %outbuf = alloca [1000 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %tos.i) #6
  %0 = ptrtoint ptr %tos.i to i64
  %1 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21505, i64 %0, i64 16) #6, !srcloc !1
  %c_lflag.i = getelementptr inbounds nuw i8, ptr %tos.i, i64 12
  %2 = load i32, ptr %c_lflag.i, align 4, !tbaa !2
  %and.i = and i32 %2, -11
  store i32 %and.i, ptr %c_lflag.i, align 4, !tbaa !2
  %3 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %0, i64 16) #6, !srcloc !7
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %set.i) #6
  store i64 2, ptr %set.i, align 8, !tbaa !8
  %4 = ptrtoint ptr %set.i to i64
  %5 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %4, i64 0, i64 8, i64 14) #6, !srcloc !10
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %set.i) #6
  call void @llvm.lifetime.end.p0(i64 36, ptr nonnull %tos.i) #6
  call void @llvm.lifetime.start.p0(i64 1000, ptr nonnull %outbuf) #6
  %6 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str to i64), i64 10, i64 1) #6, !srcloc !11
  %7 = ptrtoint ptr %inbuf.addr.i to i64
  %invariant.gep = getelementptr i8, ptr %outbuf, i64 -1
  %arrayidx151.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 1
  %arrayidx156.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 2
  %arrayidx216.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 3
  %8 = ptrtoint ptr %tos.i14 to i64
  %c_lflag.i16 = getelementptr inbounds nuw i8, ptr %tos.i14, i64 12
  %9 = ptrtoint ptr %wstatus.i to i64
  %10 = ptrtoint ptr %arrayidx216.i to i64
  br label %while.cond

while.cond:                                       ; preds = %while.cond11, %entry
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i.backedge, %while.cond
  %ptrlen.addr.0.i = phi i64 [ 0, %while.cond ], [ %ptrlen.addr.0.i.be, %while.body.i.backedge ]
  %outlen.addr.0.i = phi i64 [ 0, %while.cond ], [ %outlen.addr.0.i.be, %while.body.i.backedge ]
  %11 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #6, !srcloc !12
  %cmp.i = icmp slt i64 %11, 1
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @clean_exit() #7
  unreachable

if.end.i:                                         ; preds = %while.body.i
  %12 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  switch i8 %12, label %if.end104.i [
    i8 127, label %if.then3.i
    i8 9, label %if.then24.i
    i8 27, label %if.then40.i
    i8 3, label %while.body.i.backedge
  ]

if.then3.i:                                       ; preds = %if.end.i
  %cmp4.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  br i1 %cmp4.i, label %if.then6.i, label %if.end7.i

if.then6.i:                                       ; preds = %if.then3.i
  %dec.i = add nsw i64 %ptrlen.addr.0.i, -1
  %arrayidx.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec.i
  store i8 0, ptr %arrayidx.i, align 1, !tbaa !13
  br label %if.end7.i

if.end7.i:                                        ; preds = %if.then6.i, %if.then3.i
  %outlen.addr.1.i = phi i64 [ %dec.i, %if.then6.i ], [ %outlen.addr.0.i, %if.then3.i ]
  %cmp8.i = icmp eq i64 %ptrlen.addr.0.i, 0
  br i1 %cmp8.i, label %while.body.i.backedge, label %if.end11.i

if.end11.i:                                       ; preds = %if.end7.i
  %dec12.i = add nsw i64 %ptrlen.addr.0.i, -1
  %arrayidx13.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec12.i
  store i8 32, ptr %arrayidx13.i, align 1, !tbaa !13
  %13 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.6 to i64), i64 7, i64 1) #6, !srcloc !14
  br label %while.body.i.backedge

if.then24.i:                                      ; preds = %if.end.i
  %14 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 ptrtoint (ptr @.str.7 to i64), i64 65536, i64 2) #6, !srcloc !15
  %sext374.i = shl i64 %14, 32
  %conv34.i = ashr exact i64 %sext374.i, 32
  %15 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %conv34.i, i64 3) #6, !srcloc !16
  br label %while.body.i.backedge

if.then40.i:                                      ; preds = %if.end.i
  %16 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #6, !srcloc !17
  %17 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  %cmp48.i = icmp eq i8 %17, 91
  br i1 %cmp48.i, label %if.then50.i, label %process_line.exit.thread

if.then50.i:                                      ; preds = %if.then40.i
  %18 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #6, !srcloc !18
  %19 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  switch i8 %19, label %process_line.exit.thread [
    i8 68, label %if.then60.i
    i8 67, label %if.then76.i
    i8 65, label %while.body.i.backedge
    i8 66, label %while.body.i.backedge
  ]

if.then60.i:                                      ; preds = %if.then50.i
  %cmp61.i = icmp eq i64 %ptrlen.addr.0.i, 0
  br i1 %cmp61.i, label %while.body.i.backedge, label %if.end64.i

if.end64.i:                                       ; preds = %if.then60.i
  %dec65.i = add nsw i64 %ptrlen.addr.0.i, -1
  %20 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.8 to i64), i64 3, i64 1) #6, !srcloc !19
  br label %while.body.i.backedge

if.then76.i:                                      ; preds = %if.then50.i
  %cmp77.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  br i1 %cmp77.i, label %while.body.i.backedge, label %if.end80.i

if.end80.i:                                       ; preds = %if.then76.i
  %inc.i = add nsw i64 %ptrlen.addr.0.i, 1
  %21 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.9 to i64), i64 3, i64 1) #6, !srcloc !20
  br label %while.body.i.backedge

if.end104.i:                                      ; preds = %if.end.i
  %22 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %7, i64 1, i64 1) #6, !srcloc !21
  %23 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  switch i8 %23, label %if.end308.i [
    i8 35, label %if.then117.i
    i8 10, label %if.then117.i
  ]

if.then117.i:                                     ; preds = %if.end104.i, %if.end104.i
  %gep = getelementptr i8, ptr %invariant.gep, i64 %outlen.addr.0.i
  %24 = load i8, ptr %gep, align 1, !tbaa !13
  %cmp120.i = icmp eq i8 %24, 32
  br i1 %cmp120.i, label %if.then122.i, label %if.end125.i

if.then122.i:                                     ; preds = %if.then117.i
  %dec123.i = add nsw i64 %outlen.addr.0.i, -1
  %arrayidx124.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec123.i
  store i8 0, ptr %arrayidx124.i, align 1, !tbaa !13
  br label %if.end125.i

if.end125.i:                                      ; preds = %if.then122.i, %if.then117.i
  %outlen.addr.2.i = phi i64 [ %dec123.i, %if.then122.i ], [ %outlen.addr.0.i, %if.then117.i ]
  br label %while.cond126.i

while.cond126.i:                                  ; preds = %while.body130.i, %if.end125.i
  %25 = phi i8 [ %.pre.i, %while.body130.i ], [ %23, %if.end125.i ]
  %cmp128.not.i = icmp eq i8 %25, 10
  br i1 %cmp128.not.i, label %while.end.i, label %while.body130.i

while.body130.i:                                  ; preds = %while.cond126.i
  %26 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #6, !srcloc !22
  %27 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %7, i64 1, i64 1) #6, !srcloc !23
  %.pre.i = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  br label %while.cond126.i, !llvm.loop !24

while.end.i:                                      ; preds = %while.cond126.i
  %cmp143.i = icmp eq i64 %outlen.addr.2.i, 0
  br i1 %cmp143.i, label %process_line.exit.thread19, label %if.end146.i

process_line.exit.thread19:                       ; preds = %while.end.i
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %sw.bb3

if.end146.i:                                      ; preds = %while.end.i
  %28 = load i8, ptr %outbuf, align 16, !tbaa !13
  %cmp149.i = icmp eq i8 %28, 99
  %29 = load i8, ptr %arrayidx151.i, align 1
  %cmp153.i = icmp eq i8 %29, 100
  %or.cond = select i1 %cmp149.i, i1 %cmp153.i, i1 false
  %30 = load i8, ptr %arrayidx156.i, align 2
  %cmp158.i = icmp eq i8 %30, 32
  %or.cond21 = select i1 %or.cond, i1 %cmp158.i, i1 false
  br i1 %or.cond21, label %if.then160.i, label %if.end165.i

if.then160.i:                                     ; preds = %if.end146.i
  %31 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %10, i64 80) #6, !srcloc !26
  br label %process_line.exit

if.end165.i:                                      ; preds = %if.end146.i
  switch i64 %outlen.addr.2.i, label %if.end227.i [
    i64 1, label %land.lhs.true168.i
    i64 4, label %land.lhs.true176.i
  ]

land.lhs.true168.i:                               ; preds = %if.end165.i
  %cmp171.i = icmp eq i8 %28, 113
  br i1 %cmp171.i, label %if.end197.i, label %if.end227.i

land.lhs.true176.i:                               ; preds = %if.end165.i
  switch i8 %28, label %if.end227.i [
    i8 101, label %land.lhs.true181.i
    i8 112, label %land.lhs.true205.i
  ]

land.lhs.true181.i:                               ; preds = %land.lhs.true176.i
  %cmp184.i = icmp eq i8 %29, 120
  %cmp189.i = icmp eq i8 %30, 105
  %or.cond22 = select i1 %cmp184.i, i1 %cmp189.i, i1 false
  %32 = load i8, ptr %arrayidx216.i, align 1
  %cmp194.i = icmp eq i8 %32, 116
  %or.cond23 = select i1 %or.cond22, i1 %cmp194.i, i1 false
  br i1 %or.cond23, label %if.end197.i, label %if.end227.i

if.end197.i:                                      ; preds = %land.lhs.true181.i, %land.lhs.true168.i
  call fastcc void @clean_exit() #7
  unreachable

land.lhs.true205.i:                               ; preds = %land.lhs.true176.i
  %cmp208.i = icmp eq i8 %29, 111
  %cmp213.i = icmp eq i8 %30, 111
  %or.cond24 = select i1 %cmp208.i, i1 %cmp213.i, i1 false
  %33 = load i8, ptr %arrayidx216.i, align 1
  %cmp218.i = icmp eq i8 %33, 102
  %or.cond25 = select i1 %or.cond24, i1 %cmp218.i, i1 false
  br i1 %or.cond25, label %land.lhs.true220.i, label %if.end227.i

land.lhs.true220.i:                               ; preds = %land.lhs.true205.i
  %34 = call i64 asm sideeffect "syscall\0A", "={ax},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 39) #6, !srcloc !27
  %cmp224.i = icmp eq i64 %34, 1
  br i1 %cmp224.i, label %process_line.exit.thread, label %if.end227.i

if.end227.i:                                      ; preds = %land.lhs.true220.i, %land.lhs.true205.i, %land.lhs.true181.i, %land.lhs.true176.i, %land.lhs.true168.i, %if.end165.i
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %tos.i14) #6
  %35 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21505, i64 %8, i64 16) #6, !srcloc !28
  %36 = load i32, ptr %c_lflag.i16, align 4, !tbaa !2
  %or.i = or i32 %36, 10
  store i32 %or.i, ptr %c_lflag.i16, align 4, !tbaa !2
  %37 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %8, i64 16) #6, !srcloc !29
  %38 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.10 to i64), i64 5, i64 1) #6, !srcloc !30
  %39 = call i64 asm sideeffect "syscall\0A", "={ax},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 57) #6, !srcloc !31
  %40 = and i64 %39, 4294967295
  %cmp250.i = icmp eq i64 %40, 0
  br i1 %cmp250.i, label %if.then252.i, label %if.end263.i

if.then252.i:                                     ; preds = %if.end227.i
  %41 = sext i32 %argc to i64
  %42 = getelementptr ptr, ptr %argv, i64 %41
  %arrayidx = getelementptr i8, ptr %42, i64 8
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %set.i15) #6
  store i64 0, ptr %set.i15, align 8, !tbaa !8
  %43 = ptrtoint ptr %set.i15 to i64
  %44 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %43, i64 0, i64 8, i64 14) #6, !srcloc !32
  call fastcc void @exec(ptr noundef nonnull %outbuf, i64 noundef %outlen.addr.2.i, ptr noundef %arrayidx) #7
  %45 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 60, i64 60) #6, !srcloc !33
  unreachable

if.end263.i:                                      ; preds = %if.end227.i
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %wstatus.i) #6
  %sext.i = shl i64 %39, 32
  %conv267.i = ashr exact i64 %sext.i, 32
  %46 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %conv267.i, i64 %9, i64 0, i64 0, i64 61) #6, !srcloc !34
  %cmp272.i = icmp slt i64 %46, 1
  br i1 %cmp272.i, label %while.cond275.i, label %if.end280.i

while.cond275.i:                                  ; preds = %if.end263.i, %while.body276.i
  %outlen.addr.3.i = phi i64 [ %dec277.i, %while.body276.i ], [ %outlen.addr.2.i, %if.end263.i ]
  %tobool.not.i = icmp eq i64 %outlen.addr.3.i, 0
  br i1 %tobool.not.i, label %cleanup.i, label %while.body276.i

while.body276.i:                                  ; preds = %while.cond275.i
  %dec277.i = add nsw i64 %outlen.addr.3.i, -1
  %arrayidx278.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec277.i
  store i8 0, ptr %arrayidx278.i, align 1, !tbaa !13
  br label %while.cond275.i, !llvm.loop !35

if.end280.i:                                      ; preds = %if.end263.i
  %47 = load i32, ptr %c_lflag.i16, align 4, !tbaa !2
  %and.i17 = and i32 %47, -11
  store i32 %and.i17, ptr %c_lflag.i16, align 4, !tbaa !2
  %48 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %8, i64 16) #6, !srcloc !36
  %49 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.11 to i64), i64 5, i64 1) #6, !srcloc !37
  %50 = load i32, ptr %wstatus.i, align 4, !tbaa !38
  %and294.i = and i32 %50, 127
  %tobool295.not.i = icmp eq i32 %and294.i, 0
  br i1 %tobool295.not.i, label %if.end303.i, label %if.then296.i

if.then296.i:                                     ; preds = %if.end280.i
  %51 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.12 to i64), i64 1, i64 1) #6, !srcloc !39
  br label %cleanup.i

if.end303.i:                                      ; preds = %if.end280.i
  %and304.i = lshr i32 %50, 8
  %shr.i = and i32 %and304.i, 255
  %conv305.i = zext nneg i32 %shr.i to i64
  br label %cleanup.i

cleanup.i:                                        ; preds = %while.cond275.i, %if.end303.i, %if.then296.i
  %retval.1.i = phi i64 [ -1, %if.then296.i ], [ %conv305.i, %if.end303.i ], [ -3, %while.cond275.i ]
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %wstatus.i) #6
  call void @llvm.lifetime.end.p0(i64 36, ptr nonnull %tos.i14) #6
  br label %process_line.exit

if.end308.i:                                      ; preds = %if.end104.i
  %cmp310.i = icmp slt i8 %23, 32
  br i1 %cmp310.i, label %if.then312.i, label %if.end319.i

if.then312.i:                                     ; preds = %if.end308.i
  %52 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.12 to i64), i64 1, i64 1) #6, !srcloc !40
  br label %process_line.exit.thread

if.end319.i:                                      ; preds = %if.end308.i
  %arrayidx320.i = getelementptr inbounds i8, ptr %outbuf, i64 %ptrlen.addr.0.i
  store i8 %23, ptr %arrayidx320.i, align 1, !tbaa !13
  %cmp321.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  %inc324.i = zext i1 %cmp321.i to i64
  %spec.select.i = add nsw i64 %outlen.addr.0.i, %inc324.i
  %inc326.i = add nsw i64 %ptrlen.addr.0.i, 1
  br label %while.body.i.backedge

while.body.i.backedge:                            ; preds = %if.end319.i, %if.end80.i, %if.then76.i, %if.end64.i, %if.then60.i, %if.then50.i, %if.then50.i, %if.then24.i, %if.end11.i, %if.end7.i, %if.end.i
  %ptrlen.addr.0.i.be = phi i64 [ %dec12.i, %if.end11.i ], [ %ptrlen.addr.0.i, %if.then24.i ], [ %dec65.i, %if.end64.i ], [ %inc.i, %if.end80.i ], [ %inc326.i, %if.end319.i ], [ 0, %if.end7.i ], [ 0, %if.then60.i ], [ %ptrlen.addr.0.i, %if.then76.i ], [ %ptrlen.addr.0.i, %if.then50.i ], [ %ptrlen.addr.0.i, %if.then50.i ], [ %ptrlen.addr.0.i, %if.end.i ]
  %outlen.addr.0.i.be = phi i64 [ %outlen.addr.1.i, %if.end11.i ], [ %outlen.addr.0.i, %if.then24.i ], [ %outlen.addr.0.i, %if.end64.i ], [ %outlen.addr.0.i, %if.end80.i ], [ %spec.select.i, %if.end319.i ], [ %outlen.addr.1.i, %if.end7.i ], [ %outlen.addr.0.i, %if.then60.i ], [ %ptrlen.addr.0.i, %if.then76.i ], [ %outlen.addr.0.i, %if.then50.i ], [ %outlen.addr.0.i, %if.then50.i ], [ %outlen.addr.0.i, %if.end.i ]
  br label %while.body.i

process_line.exit.thread:                         ; preds = %if.then50.i, %if.then40.i, %land.lhs.true220.i, %if.then312.i
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %sw.epilog

process_line.exit:                                ; preds = %if.then160.i, %cleanup.i
  %retval.2382.i = phi i64 [ %retval.1.i, %cleanup.i ], [ %31, %if.then160.i ]
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  switch i64 %retval.2382.i, label %sw.default [
    i64 -3, label %sw.epilog
    i64 -1, label %sw.bb1
    i64 60, label %sw.bb2
    i64 0, label %sw.bb3
  ]

sw.bb1:                                           ; preds = %process_line.exit
  br label %sw.epilog

sw.bb2:                                           ; preds = %process_line.exit
  br label %sw.epilog

sw.bb3:                                           ; preds = %process_line.exit.thread19, %process_line.exit
  br label %sw.epilog

sw.default:                                       ; preds = %process_line.exit
  br label %sw.epilog

sw.epilog:                                        ; preds = %process_line.exit.thread, %process_line.exit, %sw.default, %sw.bb3, %sw.bb2, %sw.bb1
  %prompt.0 = phi ptr [ @.str.5, %sw.default ], [ @.str.2, %sw.bb1 ], [ @.str.3, %sw.bb2 ], [ @.str.4, %sw.bb3 ], [ @.str.1, %process_line.exit ], [ @.str.1, %process_line.exit.thread ]
  %53 = ptrtoint ptr %prompt.0 to i64
  %54 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %53, i64 14, i64 1) #6, !srcloc !41
  br label %while.cond11

while.cond11:                                     ; preds = %while.body12, %sw.epilog
  %d.0 = phi ptr [ %outbuf, %sw.epilog ], [ %incdec.ptr, %while.body12 ]
  %55 = load i8, ptr %d.0, align 1, !tbaa !13
  %tobool.not = icmp eq i8 %55, 0
  br i1 %tobool.not, label %while.cond, label %while.body12

while.body12:                                     ; preds = %while.cond11
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %d.0, i64 1
  store i8 0, ptr %d.0, align 1, !tbaa !13
  br label %while.cond11, !llvm.loop !42
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
  call void @llvm.lifetime.start.p0(i64 800, ptr nonnull %argv) #6
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
  br label %while.cond, !llvm.loop !43

while.end:                                        ; preds = %land.lhs.true, %land.lhs.true, %while.cond
  %conv.lcssa = phi i64 [ %indvars.iv, %land.lhs.true ], [ %indvars.iv, %land.lhs.true ], [ %smax, %while.cond ]
  %s.1 = phi ptr [ %incdec.ptr, %land.lhs.true ], [ %incdec.ptr, %land.lhs.true ], [ %s.0, %while.cond ]
  %firstlen.0.lcssa = trunc i64 %conv.lcssa to i32
  store ptr %outbuf, ptr %argv, align 16, !tbaa !44
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
  br label %while.cond13, !llvm.loop !47

while.end28:                                      ; preds = %while.cond13, %while.cond13
  %inc29 = add nsw i32 %totalen.0, 1
  %idx.ext = sext i32 %inc29 to i64
  %add.ptr = getelementptr inbounds i8, ptr %outbuf, i64 %idx.ext
  %arrayidx31 = getelementptr inbounds nuw [100 x ptr], ptr %argv, i64 0, i64 %indvars.iv86
  store ptr %add.ptr, ptr %arrayidx31, align 8, !tbaa !44
  %idxprom34 = zext nneg i32 %sndlen.0 to i64
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %add.ptr, i64 %idxprom34
  store i8 0, ptr %arrayidx35, align 1, !tbaa !13
  %add = add nsw i32 %sndlen.0, %inc29
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  br label %while.cond8, !llvm.loop !48

while.end37:                                      ; preds = %while.cond8
  %idxprom38 = and i64 %indvars.iv86, 4294967295
  %arrayidx39 = getelementptr inbounds nuw [100 x ptr], ptr %argv, i64 0, i64 %idxprom38
  store ptr null, ptr %arrayidx39, align 8, !tbaa !44
  %2 = load i8, ptr %outbuf, align 1, !tbaa !13
  %cmp43.not = icmp eq i8 %2, 47
  br i1 %cmp43.not, label %if.else, label %if.then

if.then:                                          ; preds = %while.end37
  call void @llvm.lifetime.start.p0(i64 100, ptr nonnull %path) #6
  %call = call fastcc ptr @memcpy(ptr noundef %path, ptr noundef nonnull @.str.13, i64 noundef 5) #7
  %add.ptr46 = getelementptr inbounds nuw i8, ptr %path, i64 5
  %call49 = call fastcc ptr @memcpy(ptr noundef %add.ptr46, ptr noundef nonnull %outbuf, i64 noundef %conv.lcssa) #7
  %add50 = add nuw i64 %conv.lcssa, 5
  %idxprom51 = and i64 %add50, 4294967295
  %arrayidx52 = getelementptr inbounds nuw [100 x i8], ptr %path, i64 0, i64 %idxprom51
  store i8 0, ptr %arrayidx52, align 1, !tbaa !13
  %3 = ptrtoint ptr %path to i64
  %4 = ptrtoint ptr %argv to i64
  %5 = ptrtoint ptr %env to i64
  %6 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %3, i64 %4, i64 %5, i64 59) #6, !srcloc !49
  call void @llvm.lifetime.end.p0(i64 100, ptr nonnull %path) #6
  br label %if.end

if.else:                                          ; preds = %while.end37
  %7 = ptrtoint ptr %outbuf to i64
  %8 = ptrtoint ptr %argv to i64
  %9 = ptrtoint ptr %env to i64
  %10 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %7, i64 %8, i64 %9, i64 59) #6, !srcloc !50
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.lifetime.end.p0(i64 800, ptr nonnull %argv) #6
  ret void
}

; Function Attrs: inlinehint minsize noreturn nounwind optsize
define internal fastcc void @clean_exit() unnamed_addr #3 {
entry:
  %tos = alloca %struct.termios, align 4
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %tos) #6
  %0 = ptrtoint ptr %tos to i64
  %1 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21505, i64 %0, i64 16) #6, !srcloc !51
  %c_lflag = getelementptr inbounds nuw i8, ptr %tos, i64 12
  %2 = load i32, ptr %c_lflag, align 4, !tbaa !2
  %or = or i32 %2, 10
  store i32 %or, ptr %c_lflag, align 4, !tbaa !2
  %3 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %0, i64 16) #6, !srcloc !52
  %4 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 60) #6, !srcloc !53
  unreachable
}

; Function Attrs: inlinehint minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define internal fastcc noundef nonnull ptr @memcpy(ptr noundef nonnull returned writeonly captures(ret: address, provenance) %dest, ptr noundef readonly captures(none) %src, i64 noundef range(i64 -2147483648, 2147483648) %n) unnamed_addr #4 {
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
  br label %for.cond, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  ret ptr %dest
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #5

attributes #0 = { minsize noreturn nounwind optsize "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { inlinehint minsize nounwind optsize "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #3 = { inlinehint minsize noreturn nounwind optsize "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #4 = { inlinehint minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind }
attributes #7 = { minsize optsize }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i64 2147782926}
!2 = !{!3, !4, i64 12}
!3 = !{!"termios", !4, i64 0, !4, i64 4, !4, i64 8, !4, i64 12, !5, i64 16, !5, i64 17}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 2147783373}
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !5, i64 0}
!10 = !{i64 2147783860}
!11 = !{i64 2147798448}
!12 = !{i64 2147787942}
!13 = !{!5, !5, i64 0}
!14 = !{i64 2147788482}
!15 = !{i64 2147788893}
!16 = !{i64 2147789185}
!17 = !{i64 2147789612}
!18 = !{i64 2147790071}
!19 = !{i64 2147790587}
!20 = !{i64 2147791120}
!21 = !{i64 2147791582}
!22 = !{i64 2147792041}
!23 = !{i64 2147792486}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = !{i64 2147792779}
!27 = !{i64 2147792985}
!28 = !{i64 2147793364}
!29 = !{i64 2147793811}
!30 = !{i64 2147794346}
!31 = !{i64 2147794596}
!32 = !{i64 2147795029}
!33 = !{i64 2147795355}
!34 = !{i64 2147795792}
!35 = distinct !{!35, !25}
!36 = !{i64 2147796251}
!37 = !{i64 2147796786}
!38 = !{!4, !4, i64 0}
!39 = !{i64 2147797317}
!40 = !{i64 2147797875}
!41 = !{i64 2147798926}
!42 = distinct !{!42, !25}
!43 = distinct !{!43, !25}
!44 = !{!45, !45, i64 0}
!45 = !{!"p1 omnipotent char", !46, i64 0}
!46 = !{!"any pointer", !5, i64 0}
!47 = distinct !{!47, !25}
!48 = distinct !{!48, !25}
!49 = !{i64 2147787050}
!50 = !{i64 2147787475}
!51 = !{i64 2147785898}
!52 = !{i64 2147786345}
!53 = !{i64 2147786664}
!54 = distinct !{!54, !25}
