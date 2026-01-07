; ModuleID = 'pid1sh.c'
source_filename = "pid1sh.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

module asm ".global _start"
module asm "_start:"
module asm "movq 0(%rsp),%rdi"
module asm "lea 8(%rsp),%rsi"
module asm "call main"

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

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define dso_local noundef ptr @memcpy(ptr noundef returned writeonly captures(ret: address, provenance) %dest, ptr noundef readonly captures(none) %src, i64 noundef %n) local_unnamed_addr #0 {
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
  %0 = load i8, ptr %s.0, align 1, !tbaa !1
  %incdec.ptr1 = getelementptr inbounds nuw i8, ptr %d.0, i64 1
  store i8 %0, ptr %d.0, align 1, !tbaa !1
  %dec = add i64 %n.addr.0, -1
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  ret ptr %dest
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: minsize noreturn nounwind optsize
define dso_local noundef i32 @main(i32 noundef %argc, ptr noundef %argv) local_unnamed_addr #2 {
entry:
  %inbuf.addr.i = alloca i8, align 1
  %tos.i14 = alloca %struct.termios, align 4
  %set.i15 = alloca %struct.__sigset_t, align 8
  %wstatus.i = alloca i32, align 4
  %tos.i = alloca %struct.termios, align 4
  %set.i = alloca %struct.__sigset_t, align 8
  %outbuf = alloca [1000 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %tos.i) #7
  %0 = ptrtoint ptr %tos.i to i64
  %1 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21505, i64 %0, i64 16) #7, !srcloc !6
  %c_lflag.i = getelementptr inbounds nuw i8, ptr %tos.i, i64 12
  %2 = load i32, ptr %c_lflag.i, align 4, !tbaa !7
  %and.i = and i32 %2, -11
  store i32 %and.i, ptr %c_lflag.i, align 4, !tbaa !7
  %3 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %0, i64 16) #7, !srcloc !10
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %set.i) #7
  store i64 2, ptr %set.i, align 8, !tbaa !11
  %4 = ptrtoint ptr %set.i to i64
  %5 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %4, i64 0, i64 8, i64 14) #7, !srcloc !13
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %set.i) #7
  call void @llvm.lifetime.end.p0(i64 36, ptr nonnull %tos.i) #7
  call void @llvm.lifetime.start.p0(i64 1000, ptr nonnull %outbuf) #7
  %6 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str to i64), i64 10, i64 1) #7, !srcloc !14
  %7 = ptrtoint ptr %inbuf.addr.i to i64
  %invariant.gep = getelementptr i8, ptr %outbuf, i64 -1
  %arrayidx140.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 1
  %arrayidx145.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 2
  %arrayidx205.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 3
  %8 = ptrtoint ptr %tos.i14 to i64
  %c_lflag.i16 = getelementptr inbounds nuw i8, ptr %tos.i14, i64 12
  %9 = ptrtoint ptr %wstatus.i to i64
  %10 = ptrtoint ptr %arrayidx205.i to i64
  br label %while.cond

while.cond:                                       ; preds = %while.cond11, %entry
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i.backedge, %while.cond
  %ptrlen.addr.0.i = phi i64 [ 0, %while.cond ], [ %ptrlen.addr.0.i.be, %while.body.i.backedge ]
  %outlen.addr.0.i = phi i64 [ 0, %while.cond ], [ %outlen.addr.0.i.be, %while.body.i.backedge ]
  %11 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #7, !srcloc !15
  %cmp.i = icmp slt i64 %11, 1
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @clean_exit() #8
  unreachable

if.end.i:                                         ; preds = %while.body.i
  %12 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !1
  switch i8 %12, label %if.end93.i [
    i8 127, label %if.then3.i
    i8 9, label %while.body.i.backedge
    i8 27, label %if.then29.i
    i8 3, label %while.body.i.backedge
  ]

if.then3.i:                                       ; preds = %if.end.i
  %cmp4.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  br i1 %cmp4.i, label %if.then6.i, label %if.end7.i

if.then6.i:                                       ; preds = %if.then3.i
  %dec.i = add nsw i64 %ptrlen.addr.0.i, -1
  %arrayidx.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec.i
  store i8 0, ptr %arrayidx.i, align 1, !tbaa !1
  br label %if.end7.i

if.end7.i:                                        ; preds = %if.then6.i, %if.then3.i
  %outlen.addr.1.i = phi i64 [ %dec.i, %if.then6.i ], [ %outlen.addr.0.i, %if.then3.i ]
  %cmp8.i = icmp eq i64 %ptrlen.addr.0.i, 0
  br i1 %cmp8.i, label %while.body.i.backedge, label %if.end11.i

if.end11.i:                                       ; preds = %if.end7.i
  %dec12.i = add nsw i64 %ptrlen.addr.0.i, -1
  %arrayidx13.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec12.i
  store i8 32, ptr %arrayidx13.i, align 1, !tbaa !1
  %13 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.6 to i64), i64 7, i64 1) #7, !srcloc !16
  br label %while.body.i.backedge

if.then29.i:                                      ; preds = %if.end.i
  %14 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #7, !srcloc !17
  %15 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !1
  %cmp37.i = icmp eq i8 %15, 91
  br i1 %cmp37.i, label %if.then39.i, label %process_line.exit.thread

if.then39.i:                                      ; preds = %if.then29.i
  %16 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #7, !srcloc !18
  %17 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !1
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
  %18 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.7 to i64), i64 3, i64 1) #7, !srcloc !19
  br label %while.body.i.backedge

if.then65.i:                                      ; preds = %if.then39.i
  %cmp66.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  br i1 %cmp66.i, label %while.body.i.backedge, label %if.end69.i

if.end69.i:                                       ; preds = %if.then65.i
  %inc.i = add nsw i64 %ptrlen.addr.0.i, 1
  %19 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.8 to i64), i64 3, i64 1) #7, !srcloc !20
  br label %while.body.i.backedge

if.end93.i:                                       ; preds = %if.end.i
  %20 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %7, i64 1, i64 1) #7, !srcloc !21
  %21 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !1
  switch i8 %21, label %if.end297.i [
    i8 35, label %if.then106.i
    i8 10, label %if.then106.i
  ]

if.then106.i:                                     ; preds = %if.end93.i, %if.end93.i
  %gep = getelementptr i8, ptr %invariant.gep, i64 %outlen.addr.0.i
  %22 = load i8, ptr %gep, align 1, !tbaa !1
  %cmp109.i = icmp eq i8 %22, 32
  br i1 %cmp109.i, label %if.then111.i, label %if.end114.i

if.then111.i:                                     ; preds = %if.then106.i
  %dec112.i = add nsw i64 %outlen.addr.0.i, -1
  %arrayidx113.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec112.i
  store i8 0, ptr %arrayidx113.i, align 1, !tbaa !1
  br label %if.end114.i

if.end114.i:                                      ; preds = %if.then111.i, %if.then106.i
  %outlen.addr.2.i = phi i64 [ %dec112.i, %if.then111.i ], [ %outlen.addr.0.i, %if.then106.i ]
  br label %while.cond115.i

while.cond115.i:                                  ; preds = %while.body119.i, %if.end114.i
  %23 = phi i8 [ %.pre.i, %while.body119.i ], [ %21, %if.end114.i ]
  %cmp117.not.i = icmp eq i8 %23, 10
  br i1 %cmp117.not.i, label %while.end.i, label %while.body119.i

while.body119.i:                                  ; preds = %while.cond115.i
  %24 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #7, !srcloc !22
  %25 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %7, i64 1, i64 1) #7, !srcloc !23
  %.pre.i = load i8, ptr %inbuf.addr.i, align 1, !tbaa !1
  br label %while.cond115.i, !llvm.loop !24

while.end.i:                                      ; preds = %while.cond115.i
  %cmp132.i = icmp eq i64 %outlen.addr.2.i, 0
  br i1 %cmp132.i, label %process_line.exit.thread19, label %if.end135.i

process_line.exit.thread19:                       ; preds = %while.end.i
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %sw.bb3

if.end135.i:                                      ; preds = %while.end.i
  %26 = load i8, ptr %outbuf, align 16, !tbaa !1
  %cmp138.i = icmp eq i8 %26, 99
  %27 = load i8, ptr %arrayidx140.i, align 1
  %cmp142.i = icmp eq i8 %27, 100
  %or.cond = select i1 %cmp138.i, i1 %cmp142.i, i1 false
  %28 = load i8, ptr %arrayidx145.i, align 2
  %cmp147.i = icmp eq i8 %28, 32
  %or.cond21 = select i1 %or.cond, i1 %cmp147.i, i1 false
  br i1 %or.cond21, label %if.then149.i, label %if.end154.i

if.then149.i:                                     ; preds = %if.end135.i
  %29 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %10, i64 80) #7, !srcloc !25
  br label %process_line.exit

if.end154.i:                                      ; preds = %if.end135.i
  switch i64 %outlen.addr.2.i, label %if.end216.i [
    i64 1, label %land.lhs.true157.i
    i64 4, label %land.lhs.true165.i
  ]

land.lhs.true157.i:                               ; preds = %if.end154.i
  %cmp160.i = icmp eq i8 %26, 113
  br i1 %cmp160.i, label %if.end186.i, label %if.end216.i

land.lhs.true165.i:                               ; preds = %if.end154.i
  switch i8 %26, label %if.end216.i [
    i8 101, label %land.lhs.true170.i
    i8 112, label %land.lhs.true194.i
  ]

land.lhs.true170.i:                               ; preds = %land.lhs.true165.i
  %cmp173.i = icmp eq i8 %27, 120
  %cmp178.i = icmp eq i8 %28, 105
  %or.cond22 = select i1 %cmp173.i, i1 %cmp178.i, i1 false
  %30 = load i8, ptr %arrayidx205.i, align 1
  %cmp183.i = icmp eq i8 %30, 116
  %or.cond23 = select i1 %or.cond22, i1 %cmp183.i, i1 false
  br i1 %or.cond23, label %if.end186.i, label %if.end216.i

if.end186.i:                                      ; preds = %land.lhs.true170.i, %land.lhs.true157.i
  call fastcc void @clean_exit() #8
  unreachable

land.lhs.true194.i:                               ; preds = %land.lhs.true165.i
  %cmp197.i = icmp eq i8 %27, 111
  %cmp202.i = icmp eq i8 %28, 111
  %or.cond24 = select i1 %cmp197.i, i1 %cmp202.i, i1 false
  %31 = load i8, ptr %arrayidx205.i, align 1
  %cmp207.i = icmp eq i8 %31, 102
  %or.cond25 = select i1 %or.cond24, i1 %cmp207.i, i1 false
  br i1 %or.cond25, label %land.lhs.true209.i, label %if.end216.i

land.lhs.true209.i:                               ; preds = %land.lhs.true194.i
  %32 = call i64 asm sideeffect "syscall\0A", "={ax},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 39) #7, !srcloc !26
  %cmp213.i = icmp eq i64 %32, 1
  br i1 %cmp213.i, label %process_line.exit.thread, label %if.end216.i

if.end216.i:                                      ; preds = %land.lhs.true209.i, %land.lhs.true194.i, %land.lhs.true170.i, %land.lhs.true165.i, %land.lhs.true157.i, %if.end154.i
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %tos.i14) #7
  %33 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21505, i64 %8, i64 16) #7, !srcloc !27
  %34 = load i32, ptr %c_lflag.i16, align 4, !tbaa !7
  %or.i = or i32 %34, 10
  store i32 %or.i, ptr %c_lflag.i16, align 4, !tbaa !7
  %35 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %8, i64 16) #7, !srcloc !28
  %36 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.9 to i64), i64 5, i64 1) #7, !srcloc !29
  %37 = call i64 asm sideeffect "syscall\0A", "={ax},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 57) #7, !srcloc !30
  %38 = and i64 %37, 4294967295
  %cmp239.i = icmp eq i64 %38, 0
  br i1 %cmp239.i, label %if.then241.i, label %if.end252.i

if.then241.i:                                     ; preds = %if.end216.i
  %39 = sext i32 %argc to i64
  %40 = getelementptr ptr, ptr %argv, i64 %39
  %arrayidx = getelementptr i8, ptr %40, i64 8
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %set.i15) #7
  store i64 0, ptr %set.i15, align 8, !tbaa !11
  %41 = ptrtoint ptr %set.i15 to i64
  %42 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %41, i64 0, i64 8, i64 14) #7, !srcloc !31
  call fastcc void @exec(ptr noundef nonnull %outbuf, i64 noundef %outlen.addr.2.i, ptr noundef %arrayidx) #8
  %43 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 60, i64 60) #7, !srcloc !32
  unreachable

if.end252.i:                                      ; preds = %if.end216.i
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %wstatus.i) #7
  %sext.i = shl i64 %37, 32
  %conv256.i = ashr exact i64 %sext.i, 32
  %44 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %conv256.i, i64 %9, i64 0, i64 0, i64 61) #7, !srcloc !33
  %cmp261.i = icmp slt i64 %44, 1
  br i1 %cmp261.i, label %while.cond264.i, label %if.end269.i

while.cond264.i:                                  ; preds = %if.end252.i, %while.body265.i
  %outlen.addr.3.i = phi i64 [ %dec266.i, %while.body265.i ], [ %outlen.addr.2.i, %if.end252.i ]
  %tobool.not.i = icmp eq i64 %outlen.addr.3.i, 0
  br i1 %tobool.not.i, label %cleanup.i, label %while.body265.i

while.body265.i:                                  ; preds = %while.cond264.i
  %dec266.i = add nsw i64 %outlen.addr.3.i, -1
  %arrayidx267.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec266.i
  store i8 0, ptr %arrayidx267.i, align 1, !tbaa !1
  br label %while.cond264.i, !llvm.loop !34

if.end269.i:                                      ; preds = %if.end252.i
  %45 = load i32, ptr %c_lflag.i16, align 4, !tbaa !7
  %and.i17 = and i32 %45, -11
  store i32 %and.i17, ptr %c_lflag.i16, align 4, !tbaa !7
  %46 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %8, i64 16) #7, !srcloc !35
  %47 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.10 to i64), i64 5, i64 1) #7, !srcloc !36
  %48 = load i32, ptr %wstatus.i, align 4, !tbaa !37
  %and283.i = and i32 %48, 127
  %tobool284.not.i = icmp eq i32 %and283.i, 0
  br i1 %tobool284.not.i, label %if.end292.i, label %if.then285.i

if.then285.i:                                     ; preds = %if.end269.i
  %49 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.11 to i64), i64 1, i64 1) #7, !srcloc !38
  br label %cleanup.i

if.end292.i:                                      ; preds = %if.end269.i
  %and293.i = lshr i32 %48, 8
  %shr.i = and i32 %and293.i, 255
  %conv294.i = zext nneg i32 %shr.i to i64
  br label %cleanup.i

cleanup.i:                                        ; preds = %while.cond264.i, %if.end292.i, %if.then285.i
  %retval.1.i = phi i64 [ -1, %if.then285.i ], [ %conv294.i, %if.end292.i ], [ -3, %while.cond264.i ]
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %wstatus.i) #7
  call void @llvm.lifetime.end.p0(i64 36, ptr nonnull %tos.i14) #7
  br label %process_line.exit

if.end297.i:                                      ; preds = %if.end93.i
  %cmp299.i = icmp slt i8 %21, 32
  br i1 %cmp299.i, label %if.then301.i, label %if.end308.i

if.then301.i:                                     ; preds = %if.end297.i
  %50 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.11 to i64), i64 1, i64 1) #7, !srcloc !39
  br label %process_line.exit.thread

if.end308.i:                                      ; preds = %if.end297.i
  %arrayidx309.i = getelementptr inbounds i8, ptr %outbuf, i64 %ptrlen.addr.0.i
  store i8 %21, ptr %arrayidx309.i, align 1, !tbaa !1
  %cmp310.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  %inc313.i = zext i1 %cmp310.i to i64
  %spec.select.i = add nsw i64 %outlen.addr.0.i, %inc313.i
  %inc315.i = add nsw i64 %ptrlen.addr.0.i, 1
  br label %while.body.i.backedge

while.body.i.backedge:                            ; preds = %if.end308.i, %if.end69.i, %if.then65.i, %if.end53.i, %if.then49.i, %if.then39.i, %if.then39.i, %if.end11.i, %if.end7.i, %if.end.i, %if.end.i
  %ptrlen.addr.0.i.be = phi i64 [ %dec12.i, %if.end11.i ], [ %dec54.i, %if.end53.i ], [ %inc.i, %if.end69.i ], [ %inc315.i, %if.end308.i ], [ 0, %if.end7.i ], [ %ptrlen.addr.0.i, %if.end.i ], [ 0, %if.then49.i ], [ %ptrlen.addr.0.i, %if.then65.i ], [ %ptrlen.addr.0.i, %if.then39.i ], [ %ptrlen.addr.0.i, %if.then39.i ], [ %ptrlen.addr.0.i, %if.end.i ]
  %outlen.addr.0.i.be = phi i64 [ %outlen.addr.1.i, %if.end11.i ], [ %outlen.addr.0.i, %if.end53.i ], [ %outlen.addr.0.i, %if.end69.i ], [ %spec.select.i, %if.end308.i ], [ %outlen.addr.1.i, %if.end7.i ], [ %outlen.addr.0.i, %if.end.i ], [ %outlen.addr.0.i, %if.then49.i ], [ %ptrlen.addr.0.i, %if.then65.i ], [ %outlen.addr.0.i, %if.then39.i ], [ %outlen.addr.0.i, %if.then39.i ], [ %outlen.addr.0.i, %if.end.i ]
  br label %while.body.i

process_line.exit.thread:                         ; preds = %if.then39.i, %if.then29.i, %land.lhs.true209.i, %if.then301.i
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %sw.epilog

process_line.exit:                                ; preds = %if.then149.i, %cleanup.i
  %retval.2370.i = phi i64 [ %retval.1.i, %cleanup.i ], [ %29, %if.then149.i ]
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  switch i64 %retval.2370.i, label %sw.default [
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
  %51 = ptrtoint ptr %prompt.0 to i64
  %52 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %51, i64 14, i64 1) #7, !srcloc !40
  br label %while.cond11

while.cond11:                                     ; preds = %while.body12, %sw.epilog
  %d.0 = phi ptr [ %outbuf, %sw.epilog ], [ %incdec.ptr, %while.body12 ]
  %53 = load i8, ptr %d.0, align 1, !tbaa !1
  %tobool.not = icmp eq i8 %53, 0
  br i1 %tobool.not, label %while.cond, label %while.body12

while.body12:                                     ; preds = %while.cond11
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %d.0, i64 1
  store i8 0, ptr %d.0, align 1, !tbaa !1
  br label %while.cond11, !llvm.loop !41
}

; Function Attrs: inlinehint minsize nounwind optsize
define internal fastcc void @exec(ptr noundef nonnull %outbuf, i64 noundef %outlen, ptr noundef %env) unnamed_addr #3 {
entry:
  %argv = alloca [100 x ptr], align 16
  %binbuf = alloca [100 x i8], align 16
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
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !1
  switch i8 %0, label %while.body [
    i8 0, label %while.end
    i8 32, label %while.end
  ]

while.body:                                       ; preds = %land.lhs.true
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %while.cond, !llvm.loop !42

while.end:                                        ; preds = %land.lhs.true, %land.lhs.true, %while.cond
  %conv.lcssa = phi i64 [ %indvars.iv, %land.lhs.true ], [ %indvars.iv, %land.lhs.true ], [ %smax, %while.cond ]
  %s.1 = phi ptr [ %incdec.ptr, %land.lhs.true ], [ %incdec.ptr, %land.lhs.true ], [ %s.0, %while.cond ]
  %firstlen.0.lcssa = trunc i64 %conv.lcssa to i32
  store ptr %outbuf, ptr %argv, align 16, !tbaa !43
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %outbuf, i64 %conv.lcssa
  store i8 0, ptr %arrayidx7, align 1, !tbaa !1
  br label %while.cond8

while.cond8:                                      ; preds = %while.end28, %while.end
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %while.end28 ], [ 1, %while.end ]
  %totalen.0 = phi i32 [ %add, %while.end28 ], [ %firstlen.0.lcssa, %while.end ]
  %s.2 = phi ptr [ %incdec.ptr18, %while.end28 ], [ %s.1, %while.end ]
  %conv9 = sext i32 %totalen.0 to i64
  %cmp10 = icmp sgt i64 %outlen, %conv9
  br i1 %cmp10, label %while.cond13, label %while.end37

while.cond13:                                     ; preds = %while.cond8, %while.body26
  %sndlen.0 = phi i32 [ %inc27, %while.body26 ], [ 0, %while.cond8 ]
  %s.3 = phi ptr [ %incdec.ptr18, %while.body26 ], [ %s.2, %while.cond8 ]
  %incdec.ptr18 = getelementptr inbounds nuw i8, ptr %s.3, i64 1
  %1 = load i8, ptr %incdec.ptr18, align 1, !tbaa !1
  switch i8 %1, label %while.body26 [
    i8 0, label %while.end28
    i8 32, label %while.end28
  ]

while.body26:                                     ; preds = %while.cond13
  %inc27 = add nuw nsw i32 %sndlen.0, 1
  br label %while.cond13, !llvm.loop !46

while.end28:                                      ; preds = %while.cond13, %while.cond13
  %inc29 = add nsw i32 %totalen.0, 1
  %idx.ext = sext i32 %inc29 to i64
  %add.ptr = getelementptr inbounds i8, ptr %outbuf, i64 %idx.ext
  %arrayidx31 = getelementptr inbounds nuw [100 x ptr], ptr %argv, i64 0, i64 %indvars.iv85
  store ptr %add.ptr, ptr %arrayidx31, align 8, !tbaa !43
  %idxprom34 = zext nneg i32 %sndlen.0 to i64
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %add.ptr, i64 %idxprom34
  store i8 0, ptr %arrayidx35, align 1, !tbaa !1
  %add = add nsw i32 %sndlen.0, %inc29
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  br label %while.cond8, !llvm.loop !47

while.end37:                                      ; preds = %while.cond8
  %idxprom38 = and i64 %indvars.iv85, 4294967295
  %arrayidx39 = getelementptr inbounds nuw [100 x ptr], ptr %argv, i64 0, i64 %idxprom38
  store ptr null, ptr %arrayidx39, align 8, !tbaa !43
  %2 = load i8, ptr %outbuf, align 1, !tbaa !1
  %cmp43.not = icmp eq i8 %2, 47
  br i1 %cmp43.not, label %if.else, label %if.then

if.then:                                          ; preds = %while.end37
  call void @llvm.lifetime.start.p0(i64 100, ptr nonnull %binbuf) #7
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(5) %binbuf, ptr noundef nonnull align 1 dereferenceable(5) @.str.12, i64 5, i1 false)
  %add.ptr46 = getelementptr inbounds nuw i8, ptr %binbuf, i64 5
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(1) %add.ptr46, ptr noundef nonnull align 1 dereferenceable(1) %outbuf, i64 %conv.lcssa, i1 false)
  %add49 = add nuw i64 %conv.lcssa, 5
  %idxprom50 = and i64 %add49, 4294967295
  %arrayidx51 = getelementptr inbounds nuw [100 x i8], ptr %binbuf, i64 0, i64 %idxprom50
  store i8 0, ptr %arrayidx51, align 1, !tbaa !1
  %3 = ptrtoint ptr %binbuf to i64
  %4 = ptrtoint ptr %argv to i64
  %5 = ptrtoint ptr %env to i64
  %6 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %3, i64 %4, i64 %5, i64 59) #7, !srcloc !48
  call void @llvm.lifetime.end.p0(i64 100, ptr nonnull %binbuf) #7
  br label %if.end

if.else:                                          ; preds = %while.end37
  %7 = ptrtoint ptr %outbuf to i64
  %8 = ptrtoint ptr %argv to i64
  %9 = ptrtoint ptr %env to i64
  %10 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %7, i64 %8, i64 %9, i64 59) #7, !srcloc !49
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.lifetime.end.p0(i64 800, ptr nonnull %argv) #7
  ret void
}

; Function Attrs: inlinehint minsize noreturn nounwind optsize
define internal fastcc void @clean_exit() unnamed_addr #4 {
entry:
  %tos = alloca %struct.termios, align 4
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %tos) #7
  %0 = ptrtoint ptr %tos to i64
  %1 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21505, i64 %0, i64 16) #7, !srcloc !50
  %c_lflag = getelementptr inbounds nuw i8, ptr %tos, i64 12
  %2 = load i32, ptr %c_lflag, align 4, !tbaa !7
  %or = or i32 %2, 10
  store i32 %or, ptr %c_lflag, align 4, !tbaa !7
  %3 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %0, i64 16) #7, !srcloc !51
  %4 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 60) #7, !srcloc !52
  unreachable
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #6

attributes #0 = { minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { minsize noreturn nounwind optsize "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #3 = { inlinehint minsize nounwind optsize "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #4 = { inlinehint minsize noreturn nounwind optsize "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { nounwind }
attributes #8 = { minsize optsize }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{i64 2147748512}
!7 = !{!8, !9, i64 12}
!8 = !{!"termios", !9, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !2, i64 16, !2, i64 17}
!9 = !{!"int", !2, i64 0}
!10 = !{i64 2147749630}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !2, i64 0}
!13 = !{i64 2147750743}
!14 = !{i64 2147784795}
!15 = !{i64 2147761463}
!16 = !{i64 2147762574}
!17 = !{i64 2147763683}
!18 = !{i64 2147764767}
!19 = !{i64 2147765870}
!20 = !{i64 2147766990}
!21 = !{i64 2147768095}
!22 = !{i64 2147769179}
!23 = !{i64 2147770267}
!24 = distinct !{!24, !5}
!25 = !{i64 2147771191}
!26 = !{i64 2147772003}
!27 = !{i64 2147773023}
!28 = !{i64 2147774141}
!29 = !{i64 2147775253}
!30 = !{i64 2147776088}
!31 = !{i64 2147777117}
!32 = !{i64 2147778063}
!33 = !{i64 2147779161}
!34 = distinct !{!34, !5}
!35 = !{i64 2147780280}
!36 = !{i64 2147781392}
!37 = !{!9, !9, i64 0}
!38 = !{i64 2147782514}
!39 = !{i64 2147783663}
!40 = !{i64 2147785915}
!41 = distinct !{!41, !5}
!42 = distinct !{!42, !5}
!43 = !{!44, !44, i64 0}
!44 = !{!"p1 omnipotent char", !45, i64 0}
!45 = !{!"any pointer", !2, i64 0}
!46 = distinct !{!46, !5}
!47 = distinct !{!47, !5}
!48 = !{i64 2147759335}
!49 = !{i64 2147760373}
!50 = !{i64 2147756245}
!51 = !{i64 2147757363}
!52 = !{i64 2147758311}
