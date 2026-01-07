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
@.str.7 = private unnamed_addr constant [4 x i8] c"\1B[D\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"\1B[C\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"\1B[0 q\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"\1B[5 q\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"/bin/\00", align 1

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
  %arrayidx140.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 1
  %arrayidx145.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 2
  %arrayidx181.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 3
  %8 = ptrtoint ptr %tos.i14 to i64
  %c_lflag.i16 = getelementptr inbounds nuw i8, ptr %tos.i14, i64 12
  %9 = ptrtoint ptr %wstatus.i to i64
  %10 = ptrtoint ptr %arrayidx181.i to i64
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
  switch i8 %12, label %if.end93.i [
    i8 127, label %if.then3.i
    i8 9, label %while.body.i.backedge
    i8 27, label %if.then29.i
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
  %13 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.6 to i64), i64 7, i64 1) #6, !srcloc !14
  br label %while.body.i.backedge

if.then29.i:                                      ; preds = %if.end.i
  %14 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #6, !srcloc !15
  %15 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  %cmp37.i = icmp eq i8 %15, 91
  br i1 %cmp37.i, label %if.then39.i, label %process_line.exit.thread

if.then39.i:                                      ; preds = %if.then29.i
  %16 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #6, !srcloc !16
  %17 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  switch i8 %17, label %process_line.exit.thread [
    i8 68, label %if.then49.i
    i8 67, label %if.then65.i
    i8 65, label %while.body.i.backedge
    i8 66, label %while.body.i.backedge
  ]

if.then49.i:                                      ; preds = %if.then39.i
  %cmp50.i = icmp eq i64 %ptrlen.addr.0.i, 0
  br i1 %cmp50.i, label %while.body.i.backedge, label %if.end53.i

if.end53.i:                                       ; preds = %if.then49.i
  %dec54.i = add nsw i64 %ptrlen.addr.0.i, -1
  %18 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.7 to i64), i64 3, i64 1) #6, !srcloc !17
  br label %while.body.i.backedge

if.then65.i:                                      ; preds = %if.then39.i
  %cmp66.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  br i1 %cmp66.i, label %while.body.i.backedge, label %if.end69.i

if.end69.i:                                       ; preds = %if.then65.i
  %inc.i = add nsw i64 %ptrlen.addr.0.i, 1
  %19 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.8 to i64), i64 3, i64 1) #6, !srcloc !18
  br label %while.body.i.backedge

if.end93.i:                                       ; preds = %if.end.i
  %20 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %7, i64 1, i64 1) #6, !srcloc !19
  %21 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  switch i8 %21, label %if.end267.i [
    i8 35, label %if.then106.i
    i8 10, label %if.then106.i
  ]

if.then106.i:                                     ; preds = %if.end93.i, %if.end93.i
  %gep = getelementptr i8, ptr %invariant.gep, i64 %outlen.addr.0.i
  %22 = load i8, ptr %gep, align 1, !tbaa !13
  %cmp109.i = icmp eq i8 %22, 32
  br i1 %cmp109.i, label %if.then111.i, label %if.end114.i

if.then111.i:                                     ; preds = %if.then106.i
  %dec112.i = add nsw i64 %outlen.addr.0.i, -1
  %arrayidx113.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec112.i
  store i8 0, ptr %arrayidx113.i, align 1, !tbaa !13
  br label %if.end114.i

if.end114.i:                                      ; preds = %if.then111.i, %if.then106.i
  %outlen.addr.2.i = phi i64 [ %dec112.i, %if.then111.i ], [ %outlen.addr.0.i, %if.then106.i ]
  br label %while.cond115.i

while.cond115.i:                                  ; preds = %while.body119.i, %if.end114.i
  %23 = phi i8 [ %.pre.i, %while.body119.i ], [ %21, %if.end114.i ]
  %cmp117.not.i = icmp eq i8 %23, 10
  br i1 %cmp117.not.i, label %while.end.i, label %while.body119.i

while.body119.i:                                  ; preds = %while.cond115.i
  %24 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #6, !srcloc !20
  %25 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %7, i64 1, i64 1) #6, !srcloc !21
  %.pre.i = load i8, ptr %inbuf.addr.i, align 1, !tbaa !13
  br label %while.cond115.i, !llvm.loop !22

while.end.i:                                      ; preds = %while.cond115.i
  %cmp132.i = icmp eq i64 %outlen.addr.2.i, 0
  br i1 %cmp132.i, label %process_line.exit.thread19, label %if.end135.i

process_line.exit.thread19:                       ; preds = %while.end.i
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %sw.bb3

if.end135.i:                                      ; preds = %while.end.i
  %26 = load i8, ptr %outbuf, align 16, !tbaa !13
  %cmp138.i = icmp eq i8 %26, 99
  %27 = load i8, ptr %arrayidx140.i, align 1
  %cmp142.i = icmp eq i8 %27, 100
  %or.cond = select i1 %cmp138.i, i1 %cmp142.i, i1 false
  %28 = load i8, ptr %arrayidx145.i, align 2
  %cmp147.i = icmp eq i8 %28, 32
  %or.cond21 = select i1 %or.cond, i1 %cmp147.i, i1 false
  br i1 %or.cond21, label %if.then149.i, label %if.end154.i

if.then149.i:                                     ; preds = %if.end135.i
  %29 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %10, i64 80) #6, !srcloc !24
  br label %process_line.exit

if.end154.i:                                      ; preds = %if.end135.i
  switch i64 %outlen.addr.2.i, label %if.end186.i [
    i64 1, label %land.lhs.true157.i
    i64 4, label %land.lhs.true165.i
  ]

land.lhs.true157.i:                               ; preds = %if.end154.i
  %cmp160.i = icmp eq i8 %26, 113
  br i1 %cmp160.i, label %if.then185.i, label %if.end186.i

land.lhs.true165.i:                               ; preds = %if.end154.i
  %cmp168.i = icmp eq i8 %26, 101
  %cmp173.i = icmp eq i8 %27, 120
  %or.cond22 = select i1 %cmp168.i, i1 %cmp173.i, i1 false
  %cmp178.i = icmp eq i8 %28, 105
  %or.cond23 = select i1 %or.cond22, i1 %cmp178.i, i1 false
  %30 = load i8, ptr %arrayidx181.i, align 1
  %cmp183.i = icmp eq i8 %30, 116
  %or.cond24 = select i1 %or.cond23, i1 %cmp183.i, i1 false
  br i1 %or.cond24, label %if.then185.i, label %if.end186.i

if.then185.i:                                     ; preds = %land.lhs.true165.i, %land.lhs.true157.i
  call fastcc void @clean_exit() #7
  unreachable

if.end186.i:                                      ; preds = %land.lhs.true165.i, %land.lhs.true157.i, %if.end154.i
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %tos.i14) #6
  %31 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21505, i64 %8, i64 16) #6, !srcloc !25
  %32 = load i32, ptr %c_lflag.i16, align 4, !tbaa !2
  %or.i = or i32 %32, 10
  store i32 %or.i, ptr %c_lflag.i16, align 4, !tbaa !2
  %33 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %8, i64 16) #6, !srcloc !26
  %34 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.9 to i64), i64 5, i64 1) #6, !srcloc !27
  %35 = call i64 asm sideeffect "syscall\0A", "={ax},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 57) #6, !srcloc !28
  %36 = and i64 %35, 4294967295
  %cmp209.i = icmp eq i64 %36, 0
  br i1 %cmp209.i, label %if.then211.i, label %if.end222.i

if.then211.i:                                     ; preds = %if.end186.i
  %37 = sext i32 %argc to i64
  %38 = getelementptr ptr, ptr %argv, i64 %37
  %arrayidx = getelementptr i8, ptr %38, i64 8
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %set.i15) #6
  store i64 0, ptr %set.i15, align 8, !tbaa !8
  %39 = ptrtoint ptr %set.i15 to i64
  %40 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %39, i64 0, i64 8, i64 14) #6, !srcloc !29
  call fastcc void @exec(ptr noundef nonnull %outbuf, i64 noundef %outlen.addr.2.i, ptr noundef %arrayidx) #7
  %41 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 60, i64 60) #6, !srcloc !30
  unreachable

if.end222.i:                                      ; preds = %if.end186.i
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %wstatus.i) #6
  %sext.i = shl i64 %35, 32
  %conv226.i = ashr exact i64 %sext.i, 32
  %42 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %conv226.i, i64 %9, i64 0, i64 0, i64 61) #6, !srcloc !31
  %cmp231.i = icmp slt i64 %42, 1
  br i1 %cmp231.i, label %while.cond234.i, label %if.end239.i

while.cond234.i:                                  ; preds = %if.end222.i, %while.body235.i
  %outlen.addr.3.i = phi i64 [ %dec236.i, %while.body235.i ], [ %outlen.addr.2.i, %if.end222.i ]
  %tobool.not.i = icmp eq i64 %outlen.addr.3.i, 0
  br i1 %tobool.not.i, label %cleanup.i, label %while.body235.i

while.body235.i:                                  ; preds = %while.cond234.i
  %dec236.i = add nsw i64 %outlen.addr.3.i, -1
  %arrayidx237.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec236.i
  store i8 0, ptr %arrayidx237.i, align 1, !tbaa !13
  br label %while.cond234.i, !llvm.loop !32

if.end239.i:                                      ; preds = %if.end222.i
  %43 = load i32, ptr %c_lflag.i16, align 4, !tbaa !2
  %and.i17 = and i32 %43, -11
  store i32 %and.i17, ptr %c_lflag.i16, align 4, !tbaa !2
  %44 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %8, i64 16) #6, !srcloc !33
  %45 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.10 to i64), i64 5, i64 1) #6, !srcloc !34
  %46 = load i32, ptr %wstatus.i, align 4, !tbaa !35
  %and253.i = and i32 %46, 127
  %tobool254.not.i = icmp eq i32 %and253.i, 0
  br i1 %tobool254.not.i, label %if.end262.i, label %if.then255.i

if.then255.i:                                     ; preds = %if.end239.i
  %47 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.11 to i64), i64 1, i64 1) #6, !srcloc !36
  br label %cleanup.i

if.end262.i:                                      ; preds = %if.end239.i
  %and263.i = lshr i32 %46, 8
  %shr.i = and i32 %and263.i, 255
  %conv264.i = zext nneg i32 %shr.i to i64
  br label %cleanup.i

cleanup.i:                                        ; preds = %while.cond234.i, %if.end262.i, %if.then255.i
  %retval.1.i = phi i64 [ -1, %if.then255.i ], [ %conv264.i, %if.end262.i ], [ -3, %while.cond234.i ]
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %wstatus.i) #6
  call void @llvm.lifetime.end.p0(i64 36, ptr nonnull %tos.i14) #6
  br label %process_line.exit

if.end267.i:                                      ; preds = %if.end93.i
  %cmp269.i = icmp slt i8 %21, 32
  br i1 %cmp269.i, label %if.then271.i, label %if.end278.i

if.then271.i:                                     ; preds = %if.end267.i
  %48 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.11 to i64), i64 1, i64 1) #6, !srcloc !37
  br label %process_line.exit.thread

if.end278.i:                                      ; preds = %if.end267.i
  %arrayidx279.i = getelementptr inbounds i8, ptr %outbuf, i64 %ptrlen.addr.0.i
  store i8 %21, ptr %arrayidx279.i, align 1, !tbaa !13
  %cmp280.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  %inc283.i = zext i1 %cmp280.i to i64
  %spec.select.i = add nsw i64 %outlen.addr.0.i, %inc283.i
  %inc285.i = add nsw i64 %ptrlen.addr.0.i, 1
  br label %while.body.i.backedge

while.body.i.backedge:                            ; preds = %if.end278.i, %if.end69.i, %if.then65.i, %if.end53.i, %if.then49.i, %if.then39.i, %if.then39.i, %if.end7.i, %if.then3.i, %if.end.i, %if.end.i
  %ptrlen.addr.0.i.be = phi i64 [ %dec.i, %if.end7.i ], [ %dec54.i, %if.end53.i ], [ %inc.i, %if.end69.i ], [ %inc285.i, %if.end278.i ], [ 0, %if.then3.i ], [ %ptrlen.addr.0.i, %if.end.i ], [ 0, %if.then49.i ], [ %ptrlen.addr.0.i, %if.then65.i ], [ %ptrlen.addr.0.i, %if.then39.i ], [ %ptrlen.addr.0.i, %if.then39.i ], [ %ptrlen.addr.0.i, %if.end.i ]
  %outlen.addr.0.i.be = phi i64 [ %spec.select, %if.end7.i ], [ %outlen.addr.0.i, %if.end53.i ], [ %outlen.addr.0.i, %if.end69.i ], [ %spec.select.i, %if.end278.i ], [ %outlen.addr.0.i, %if.then3.i ], [ %outlen.addr.0.i, %if.end.i ], [ %outlen.addr.0.i, %if.then49.i ], [ %ptrlen.addr.0.i, %if.then65.i ], [ %outlen.addr.0.i, %if.then39.i ], [ %outlen.addr.0.i, %if.then39.i ], [ %outlen.addr.0.i, %if.end.i ]
  br label %while.body.i

process_line.exit.thread:                         ; preds = %if.then39.i, %if.then29.i, %if.then271.i
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %sw.epilog

process_line.exit:                                ; preds = %if.then149.i, %cleanup.i
  %retval.2334.i = phi i64 [ %retval.1.i, %cleanup.i ], [ %29, %if.then149.i ]
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  switch i64 %retval.2334.i, label %sw.default [
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
  %49 = ptrtoint ptr %prompt.0 to i64
  %50 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %49, i64 14, i64 1) #6, !srcloc !38
  br label %while.cond11

while.cond11:                                     ; preds = %while.body12, %sw.epilog
  %d.0 = phi ptr [ %outbuf, %sw.epilog ], [ %incdec.ptr, %while.body12 ]
  %51 = load i8, ptr %d.0, align 1, !tbaa !13
  %tobool.not = icmp eq i8 %51, 0
  br i1 %tobool.not, label %while.cond, label %while.body12

while.body12:                                     ; preds = %while.cond11
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %d.0, i64 1
  store i8 0, ptr %d.0, align 1, !tbaa !13
  br label %while.cond11, !llvm.loop !39
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
  br label %while.cond, !llvm.loop !40

while.end:                                        ; preds = %land.lhs.true, %land.lhs.true, %while.cond
  %conv.lcssa = phi i64 [ %indvars.iv, %land.lhs.true ], [ %indvars.iv, %land.lhs.true ], [ %smax, %while.cond ]
  %s.1 = phi ptr [ %incdec.ptr, %land.lhs.true ], [ %incdec.ptr, %land.lhs.true ], [ %s.0, %while.cond ]
  %firstlen.0.lcssa = trunc i64 %conv.lcssa to i32
  store ptr %outbuf, ptr %argv, align 16, !tbaa !41
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
  br label %while.cond13, !llvm.loop !44

while.end28:                                      ; preds = %while.cond13, %while.cond13
  %inc29 = add nsw i32 %totalen.0, 1
  %idx.ext = sext i32 %inc29 to i64
  %add.ptr = getelementptr inbounds i8, ptr %outbuf, i64 %idx.ext
  %arrayidx31 = getelementptr inbounds nuw [100 x ptr], ptr %argv, i64 0, i64 %indvars.iv86
  store ptr %add.ptr, ptr %arrayidx31, align 8, !tbaa !41
  %idxprom34 = zext nneg i32 %sndlen.0 to i64
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %add.ptr, i64 %idxprom34
  store i8 0, ptr %arrayidx35, align 1, !tbaa !13
  %add = add nsw i32 %sndlen.0, %inc29
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  br label %while.cond8, !llvm.loop !45

while.end37:                                      ; preds = %while.cond8
  %idxprom38 = and i64 %indvars.iv86, 4294967295
  %arrayidx39 = getelementptr inbounds nuw [100 x ptr], ptr %argv, i64 0, i64 %idxprom38
  store ptr null, ptr %arrayidx39, align 8, !tbaa !41
  %2 = load i8, ptr %outbuf, align 1, !tbaa !13
  %cmp43.not = icmp eq i8 %2, 47
  br i1 %cmp43.not, label %if.else, label %if.then

if.then:                                          ; preds = %while.end37
  call void @llvm.lifetime.start.p0(i64 100, ptr nonnull %path) #6
  %call = call fastcc ptr @memcpy(ptr noundef %path, ptr noundef nonnull @.str.12, i64 noundef 5) #7
  %add.ptr46 = getelementptr inbounds nuw i8, ptr %path, i64 5
  %call49 = call fastcc ptr @memcpy(ptr noundef %add.ptr46, ptr noundef nonnull %outbuf, i64 noundef %conv.lcssa) #7
  %add50 = add nuw i64 %conv.lcssa, 5
  %idxprom51 = and i64 %add50, 4294967295
  %arrayidx52 = getelementptr inbounds nuw [100 x i8], ptr %path, i64 0, i64 %idxprom51
  store i8 0, ptr %arrayidx52, align 1, !tbaa !13
  %3 = ptrtoint ptr %path to i64
  %4 = ptrtoint ptr %argv to i64
  %5 = ptrtoint ptr %env to i64
  %6 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %3, i64 %4, i64 %5, i64 59) #6, !srcloc !46
  call void @llvm.lifetime.end.p0(i64 100, ptr nonnull %path) #6
  br label %if.end

if.else:                                          ; preds = %while.end37
  %7 = ptrtoint ptr %outbuf to i64
  %8 = ptrtoint ptr %argv to i64
  %9 = ptrtoint ptr %env to i64
  %10 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %7, i64 %8, i64 %9, i64 59) #6, !srcloc !47
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
  %1 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21505, i64 %0, i64 16) #6, !srcloc !48
  %c_lflag = getelementptr inbounds nuw i8, ptr %tos, i64 12
  %2 = load i32, ptr %c_lflag, align 4, !tbaa !2
  %or = or i32 %2, 10
  store i32 %or, ptr %c_lflag, align 4, !tbaa !2
  %3 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %0, i64 16) #6, !srcloc !49
  %4 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 60) #6, !srcloc !50
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
  br label %for.cond, !llvm.loop !51

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
!1 = !{i64 2147783925}
!2 = !{!3, !4, i64 12}
!3 = !{!"termios", !4, i64 0, !4, i64 4, !4, i64 8, !4, i64 12, !5, i64 16, !5, i64 17}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 2147784372}
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !5, i64 0}
!10 = !{i64 2147784859}
!11 = !{i64 2147797015}
!12 = !{i64 2147787340}
!13 = !{!5, !5, i64 0}
!14 = !{i64 2147787880}
!15 = !{i64 2147788364}
!16 = !{i64 2147788823}
!17 = !{i64 2147789339}
!18 = !{i64 2147789872}
!19 = !{i64 2147790334}
!20 = !{i64 2147790793}
!21 = !{i64 2147791238}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = !{i64 2147791531}
!25 = !{i64 2147791931}
!26 = !{i64 2147792378}
!27 = !{i64 2147792913}
!28 = !{i64 2147793163}
!29 = !{i64 2147793596}
!30 = !{i64 2147793922}
!31 = !{i64 2147794359}
!32 = distinct !{!32, !23}
!33 = !{i64 2147794818}
!34 = !{i64 2147795353}
!35 = !{!4, !4, i64 0}
!36 = !{i64 2147795884}
!37 = !{i64 2147796442}
!38 = !{i64 2147797493}
!39 = distinct !{!39, !23}
!40 = distinct !{!40, !23}
!41 = !{!42, !42, i64 0}
!42 = !{!"p1 omnipotent char", !43, i64 0}
!43 = !{!"any pointer", !5, i64 0}
!44 = distinct !{!44, !23}
!45 = distinct !{!45, !23}
!46 = !{i64 2147786448}
!47 = !{i64 2147786873}
!48 = !{i64 2147785296}
!49 = !{i64 2147785743}
!50 = !{i64 2147786062}
!51 = distinct !{!51, !23}
