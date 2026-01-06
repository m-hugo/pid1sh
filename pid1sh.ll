; ModuleID = 'pid1sh.c'
source_filename = "pid1sh.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

module asm ".global _start"
module asm "_start:"
module asm "movq 0(%rsp),%rdi"
module asm "lea 8(%rsp),%rsi"
module asm "call main"

%struct.__sigset_t = type { [16 x i64] }
%struct.termios = type { i32, i32, i32, i32, i8, [19 x i8] }

@.str = private unnamed_addr constant [11 x i8] c" \E2\9D\AF \1B[5 q\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"\1B[35m\E2\98\A0>\1B[0m \00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"\1B[34m!\E2\9D\AF\1B[0m \00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"\1B[33m?\E2\9D\AF\1B[0m \00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"\1B[32m \E2\9D\AF\1B[0m \00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"\1B[31mx\E2\9D\AF\1B[0m \00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"\1B[D \1B[D\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"\1B[D\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"\1B[C\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"/bin/\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"\1B[0 q\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"\1B[5 q\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

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
  %set.i = alloca %struct.__sigset_t, align 8
  %argv.i = alloca [100 x ptr], align 16
  %binbuf.i = alloca [100 x i8], align 16
  %tos.i14 = alloca %struct.termios, align 4
  %wstatus.i = alloca i32, align 4
  %tos.i = alloca %struct.termios, align 4
  %outbuf = alloca [1000 x i8], align 16
  %0 = sext i32 %argc to i64
  %1 = getelementptr ptr, ptr %argv, i64 %0
  %arrayidx = getelementptr i8, ptr %1, i64 8
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %tos.i) #5
  %2 = ptrtoint ptr %tos.i to i64
  %3 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21505, i64 %2, i64 16) #5, !srcloc !6
  %c_lflag.i = getelementptr inbounds nuw i8, ptr %tos.i, i64 12
  %4 = load i32, ptr %c_lflag.i, align 4, !tbaa !7
  %and.i = and i32 %4, -12
  store i32 %and.i, ptr %c_lflag.i, align 4, !tbaa !7
  %5 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %2, i64 16) #5, !srcloc !10
  call void @llvm.lifetime.end.p0(i64 36, ptr nonnull %tos.i) #5
  call void @llvm.lifetime.start.p0(i64 1000, ptr nonnull %outbuf) #5
  %6 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str to i64), i64 10, i64 1) #5, !srcloc !11
  %7 = ptrtoint ptr %inbuf.addr.i to i64
  %invariant.gep = getelementptr i8, ptr %outbuf, i64 -1
  %arrayidx142.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 1
  %arrayidx147.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 2
  %arrayidx211.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 3
  %8 = ptrtoint ptr %set.i to i64
  %9 = ptrtoint ptr %tos.i14 to i64
  %c_lflag.i15 = getelementptr inbounds nuw i8, ptr %tos.i14, i64 12
  %10 = ptrtoint ptr %wstatus.i to i64
  %11 = ptrtoint ptr %arrayidx211.i to i64
  br label %while.cond

while.cond:                                       ; preds = %while.cond11, %entry
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i.backedge, %while.cond
  %ptrlen.addr.0.i = phi i64 [ 0, %while.cond ], [ %ptrlen.addr.0.i.be, %while.body.i.backedge ]
  %outlen.addr.0.i = phi i64 [ 0, %while.cond ], [ %outlen.addr.0.i.be, %while.body.i.backedge ]
  %12 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #5, !srcloc !12
  %cmp.i = icmp slt i64 %12, 1
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %while.body.i
  %13 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 60) #5, !srcloc !13
  unreachable

if.end.i:                                         ; preds = %while.body.i
  %14 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !1
  switch i8 %14, label %if.end96.i [
    i8 127, label %if.then7.i
    i8 9, label %while.body.i.backedge
    i8 27, label %if.then32.i
    i8 3, label %while.body.i.backedge
  ]

if.then7.i:                                       ; preds = %if.end.i
  %cmp8.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  %dec.i = sext i1 %cmp8.i to i64
  %spec.select.i = add nsw i64 %outlen.addr.0.i, %dec.i
  %cmp12.i = icmp eq i64 %ptrlen.addr.0.i, 0
  br i1 %cmp12.i, label %while.body.i.backedge, label %if.end15.i

if.end15.i:                                       ; preds = %if.then7.i
  %dec16.i = add nsw i64 %ptrlen.addr.0.i, -1
  %arrayidx.i = getelementptr inbounds i8, ptr %outbuf, i64 %dec16.i
  store i8 32, ptr %arrayidx.i, align 1, !tbaa !1
  %15 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.6 to i64), i64 7, i64 1) #5, !srcloc !14
  br label %while.body.i.backedge

if.then32.i:                                      ; preds = %if.end.i
  %16 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #5, !srcloc !15
  %17 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !1
  %cmp40.i = icmp eq i8 %17, 91
  br i1 %cmp40.i, label %if.then42.i, label %process_line.exit.thread

if.then42.i:                                      ; preds = %if.then32.i
  %18 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #5, !srcloc !16
  %19 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !1
  switch i8 %19, label %process_line.exit.thread [
    i8 68, label %if.then52.i
    i8 67, label %if.then68.i
    i8 65, label %while.body.i.backedge
    i8 66, label %while.body.i.backedge
  ]

if.then52.i:                                      ; preds = %if.then42.i
  %cmp53.i = icmp eq i64 %ptrlen.addr.0.i, 0
  br i1 %cmp53.i, label %while.body.i.backedge, label %if.end56.i

if.end56.i:                                       ; preds = %if.then52.i
  %dec57.i = add nsw i64 %ptrlen.addr.0.i, -1
  %20 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.7 to i64), i64 3, i64 1) #5, !srcloc !17
  br label %while.body.i.backedge

if.then68.i:                                      ; preds = %if.then42.i
  %cmp69.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  br i1 %cmp69.i, label %while.body.i.backedge, label %if.end72.i

if.end72.i:                                       ; preds = %if.then68.i
  %inc.i = add nsw i64 %ptrlen.addr.0.i, 1
  %21 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.8 to i64), i64 3, i64 1) #5, !srcloc !18
  br label %while.body.i.backedge

if.end96.i:                                       ; preds = %if.end.i
  %22 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %7, i64 1, i64 1) #5, !srcloc !19
  %23 = load i8, ptr %inbuf.addr.i, align 1, !tbaa !1
  switch i8 %23, label %if.end384.i [
    i8 35, label %if.then109.i
    i8 10, label %if.then109.i
  ]

if.then109.i:                                     ; preds = %if.end96.i, %if.end96.i
  %gep = getelementptr i8, ptr %invariant.gep, i64 %outlen.addr.0.i
  %24 = load i8, ptr %gep, align 1, !tbaa !1
  %cmp112.i = icmp eq i8 %24, 32
  %dec115.i = sext i1 %cmp112.i to i64
  %spec.select464.i = add nsw i64 %outlen.addr.0.i, %dec115.i
  %cmp117.i = icmp eq i64 %spec.select464.i, 0
  br i1 %cmp117.i, label %process_line.exit.thread18, label %while.cond121.i

process_line.exit.thread18:                       ; preds = %if.then109.i
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %sw.bb3

while.cond121.i:                                  ; preds = %if.then109.i, %while.body125.i
  %25 = phi i8 [ %.pre.i, %while.body125.i ], [ %23, %if.then109.i ]
  %cmp123.not.i = icmp eq i8 %25, 10
  br i1 %cmp123.not.i, label %while.end.i, label %while.body125.i

while.body125.i:                                  ; preds = %while.cond121.i
  %26 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %7, i64 1, i64 0) #5, !srcloc !20
  %27 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %7, i64 1, i64 1) #5, !srcloc !21
  %.pre.i = load i8, ptr %inbuf.addr.i, align 1, !tbaa !1
  br label %while.cond121.i, !llvm.loop !22

while.end.i:                                      ; preds = %while.cond121.i
  %28 = load i8, ptr %outbuf, align 16, !tbaa !1
  %cmp140.i = icmp eq i8 %28, 99
  %29 = load i8, ptr %arrayidx142.i, align 1
  %cmp144.i = icmp eq i8 %29, 100
  %or.cond = select i1 %cmp140.i, i1 %cmp144.i, i1 false
  %30 = load i8, ptr %arrayidx147.i, align 2
  %cmp149.i = icmp eq i8 %30, 32
  %or.cond20 = select i1 %or.cond, i1 %cmp149.i, i1 false
  br i1 %or.cond20, label %if.then151.i, label %if.end156.i

if.then151.i:                                     ; preds = %while.end.i
  %31 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %11, i64 80) #5, !srcloc !23
  br label %process_line.exit

if.end156.i:                                      ; preds = %while.end.i
  switch i64 %spec.select464.i, label %if.end222.i [
    i64 1, label %land.lhs.true159.i
    i64 4, label %land.lhs.true167.i
  ]

land.lhs.true159.i:                               ; preds = %if.end156.i
  %cmp162.i = icmp eq i8 %28, 113
  br i1 %cmp162.i, label %if.then187.i, label %if.end222.i

land.lhs.true167.i:                               ; preds = %if.end156.i
  switch i8 %28, label %if.end222.i [
    i8 101, label %land.lhs.true172.i
    i8 112, label %land.lhs.true200.i
  ]

land.lhs.true172.i:                               ; preds = %land.lhs.true167.i
  %cmp175.i = icmp eq i8 %29, 120
  %cmp180.i = icmp eq i8 %30, 105
  %or.cond21 = select i1 %cmp175.i, i1 %cmp180.i, i1 false
  %32 = load i8, ptr %arrayidx211.i, align 1
  %cmp185.i = icmp eq i8 %32, 116
  %or.cond22 = select i1 %or.cond21, i1 %cmp185.i, i1 false
  br i1 %or.cond22, label %if.then187.i, label %if.end222.i

if.then187.i:                                     ; preds = %land.lhs.true172.i, %land.lhs.true159.i
  %33 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 60) #5, !srcloc !24
  unreachable

land.lhs.true200.i:                               ; preds = %land.lhs.true167.i
  %cmp203.i = icmp eq i8 %29, 111
  %cmp208.i = icmp eq i8 %30, 111
  %or.cond23 = select i1 %cmp203.i, i1 %cmp208.i, i1 false
  %34 = load i8, ptr %arrayidx211.i, align 1
  %cmp213.i = icmp eq i8 %34, 102
  %or.cond24 = select i1 %or.cond23, i1 %cmp213.i, i1 false
  br i1 %or.cond24, label %land.lhs.true215.i, label %if.end222.i

land.lhs.true215.i:                               ; preds = %land.lhs.true200.i
  %35 = call i64 asm sideeffect "syscall\0A", "={ax},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 39) #5, !srcloc !25
  %cmp219.i = icmp eq i64 %35, 1
  br i1 %cmp219.i, label %process_line.exit.thread, label %if.end222.i

if.end222.i:                                      ; preds = %land.lhs.true215.i, %land.lhs.true200.i, %land.lhs.true172.i, %land.lhs.true167.i, %land.lhs.true159.i, %if.end156.i
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %set.i) #5
  store i64 0, ptr %set.i, align 8, !tbaa !26
  %36 = call i64 asm sideeffect "syscall\0A", "={ax},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 57) #5, !srcloc !28
  %37 = and i64 %36, 4294967295
  %cmp227.i = icmp eq i64 %37, 0
  br i1 %cmp227.i, label %if.then229.i, label %if.end318.i

if.then229.i:                                     ; preds = %if.end222.i
  %38 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %8, i64 0, i64 8, i64 14) #5, !srcloc !29
  call void @llvm.lifetime.start.p0(i64 800, ptr nonnull %argv.i) #5
  %smax.i = call i64 @llvm.smax.i64(i64 %spec.select464.i, i64 1)
  br label %while.cond236.i

while.cond236.i:                                  ; preds = %while.body245.i, %if.then229.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %while.body245.i ], [ 1, %if.then229.i ]
  %s.0.i = phi ptr [ %incdec.ptr.i, %while.body245.i ], [ %outbuf, %if.then229.i ]
  %cmp238.i = icmp sgt i64 %spec.select464.i, %indvars.iv.i
  br i1 %cmp238.i, label %land.lhs.true240.i, label %while.end247.i

land.lhs.true240.i:                               ; preds = %while.cond236.i
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %s.0.i, i64 1
  %39 = load i8, ptr %incdec.ptr.i, align 1, !tbaa !1
  switch i8 %39, label %while.body245.i [
    i8 0, label %while.end247.i
    i8 32, label %while.end247.i
  ]

while.body245.i:                                  ; preds = %land.lhs.true240.i
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  br label %while.cond236.i, !llvm.loop !30

while.end247.i:                                   ; preds = %land.lhs.true240.i, %land.lhs.true240.i, %while.cond236.i
  %conv237.lcssa.i = phi i64 [ %indvars.iv.i, %land.lhs.true240.i ], [ %indvars.iv.i, %land.lhs.true240.i ], [ %smax.i, %while.cond236.i ]
  %s.1.i = phi ptr [ %incdec.ptr.i, %land.lhs.true240.i ], [ %incdec.ptr.i, %land.lhs.true240.i ], [ %s.0.i, %while.cond236.i ]
  %firstlen.0.lcssa.i = trunc i64 %conv237.lcssa.i to i32
  store ptr %outbuf, ptr %argv.i, align 16, !tbaa !31
  %arrayidx250.i = getelementptr inbounds nuw i8, ptr %outbuf, i64 %conv237.lcssa.i
  store i8 0, ptr %arrayidx250.i, align 1, !tbaa !1
  br label %while.cond251.i

while.cond251.i:                                  ; preds = %while.end271.i, %while.end247.i
  %indvars.iv485.i = phi i64 [ %indvars.iv.next486.i, %while.end271.i ], [ 1, %while.end247.i ]
  %totalen.0.i = phi i32 [ %add.i, %while.end271.i ], [ %firstlen.0.lcssa.i, %while.end247.i ]
  %s.2.i = phi ptr [ %incdec.ptr261.i, %while.end271.i ], [ %s.1.i, %while.end247.i ]
  %conv252.i = sext i32 %totalen.0.i to i64
  %cmp253.i = icmp sgt i64 %spec.select464.i, %conv252.i
  br i1 %cmp253.i, label %while.cond256.i, label %while.end281.i

while.cond256.i:                                  ; preds = %while.cond251.i, %while.body269.i
  %sndlen.0.i = phi i32 [ %inc270.i, %while.body269.i ], [ 0, %while.cond251.i ]
  %s.3.i = phi ptr [ %incdec.ptr261.i, %while.body269.i ], [ %s.2.i, %while.cond251.i ]
  %incdec.ptr261.i = getelementptr inbounds nuw i8, ptr %s.3.i, i64 1
  %40 = load i8, ptr %incdec.ptr261.i, align 1, !tbaa !1
  switch i8 %40, label %while.body269.i [
    i8 0, label %while.end271.i
    i8 32, label %while.end271.i
  ]

while.body269.i:                                  ; preds = %while.cond256.i
  %inc270.i = add nuw nsw i32 %sndlen.0.i, 1
  br label %while.cond256.i, !llvm.loop !34

while.end271.i:                                   ; preds = %while.cond256.i, %while.cond256.i
  %inc272.i = add nsw i32 %totalen.0.i, 1
  %idx.ext.i = sext i32 %inc272.i to i64
  %add.ptr273.i = getelementptr inbounds i8, ptr %outbuf, i64 %idx.ext.i
  %arrayidx275.i = getelementptr inbounds nuw [100 x ptr], ptr %argv.i, i64 0, i64 %indvars.iv485.i
  store ptr %add.ptr273.i, ptr %arrayidx275.i, align 8, !tbaa !31
  %idxprom278.i = zext nneg i32 %sndlen.0.i to i64
  %arrayidx279.i = getelementptr inbounds nuw i8, ptr %add.ptr273.i, i64 %idxprom278.i
  store i8 0, ptr %arrayidx279.i, align 1, !tbaa !1
  %add.i = add nsw i32 %sndlen.0.i, %inc272.i
  %indvars.iv.next486.i = add nuw nsw i64 %indvars.iv485.i, 1
  br label %while.cond251.i, !llvm.loop !35

while.end281.i:                                   ; preds = %while.cond251.i
  %idxprom282.i = and i64 %indvars.iv485.i, 4294967295
  %arrayidx283.i = getelementptr inbounds nuw [100 x ptr], ptr %argv.i, i64 0, i64 %idxprom282.i
  store ptr null, ptr %arrayidx283.i, align 8, !tbaa !31
  %41 = load i8, ptr %outbuf, align 16, !tbaa !1
  %cmp287.not.i = icmp eq i8 %41, 47
  br i1 %cmp287.not.i, label %if.else.i, label %if.then289.i

if.then289.i:                                     ; preds = %while.end281.i
  call void @llvm.lifetime.start.p0(i64 100, ptr nonnull %binbuf.i) #5
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(5) %binbuf.i, ptr noundef nonnull align 1 dereferenceable(5) @.str.9, i64 5, i1 false)
  %add.ptr291.i = getelementptr inbounds nuw i8, ptr %binbuf.i, i64 5
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(1) %add.ptr291.i, ptr noundef nonnull align 16 dereferenceable(1) %outbuf, i64 %conv237.lcssa.i, i1 false)
  %add294.i = add nuw i64 %conv237.lcssa.i, 5
  %idxprom295.i = and i64 %add294.i, 4294967295
  %arrayidx296.i = getelementptr inbounds nuw [100 x i8], ptr %binbuf.i, i64 0, i64 %idxprom295.i
  store i8 0, ptr %arrayidx296.i, align 1, !tbaa !1
  %42 = ptrtoint ptr %binbuf.i to i64
  %43 = ptrtoint ptr %argv.i to i64
  %44 = ptrtoint ptr %arrayidx to i64
  %45 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %42, i64 %43, i64 %44, i64 59) #5, !srcloc !36
  call void @llvm.lifetime.end.p0(i64 100, ptr nonnull %binbuf.i) #5
  br label %if.end313.i

if.else.i:                                        ; preds = %while.end281.i
  %46 = ptrtoint ptr %outbuf to i64
  %47 = ptrtoint ptr %argv.i to i64
  %48 = ptrtoint ptr %arrayidx to i64
  %49 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %46, i64 %47, i64 %48, i64 59) #5, !srcloc !37
  br label %if.end313.i

if.end313.i:                                      ; preds = %if.else.i, %if.then289.i
  %50 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 60, i64 60) #5, !srcloc !38
  unreachable

if.end318.i:                                      ; preds = %if.end222.i
  store i64 2, ptr %set.i, align 8, !tbaa !26
  %51 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %8, i64 0, i64 8, i64 14) #5, !srcloc !39
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %tos.i14) #5
  %52 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21505, i64 %9, i64 16) #5, !srcloc !40
  %53 = load i32, ptr %c_lflag.i15, align 4, !tbaa !7
  %or.i = or i32 %53, 11
  store i32 %or.i, ptr %c_lflag.i15, align 4, !tbaa !7
  %54 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %9, i64 16) #5, !srcloc !41
  %55 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.10 to i64), i64 5, i64 1) #5, !srcloc !42
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %wstatus.i) #5
  %sext.i = shl i64 %36, 32
  %conv347.i = ashr exact i64 %sext.i, 32
  %56 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{r10},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %conv347.i, i64 %10, i64 0, i64 0, i64 61) #5, !srcloc !43
  %cmp352.i = icmp slt i64 %56, 1
  br i1 %cmp352.i, label %cleanup.i, label %if.end355.i

if.end355.i:                                      ; preds = %if.end318.i
  %57 = load i32, ptr %c_lflag.i15, align 4, !tbaa !7
  %and.i16 = and i32 %57, -12
  store i32 %and.i16, ptr %c_lflag.i15, align 4, !tbaa !7
  %58 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 21506, i64 %9, i64 16) #5, !srcloc !44
  %59 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.11 to i64), i64 5, i64 1) #5, !srcloc !45
  %60 = load i32, ptr %wstatus.i, align 4, !tbaa !46
  %and369.i = and i32 %60, 127
  %tobool370.not.i = icmp eq i32 %and369.i, 0
  br i1 %tobool370.not.i, label %if.end378.i, label %if.then371.i

if.then371.i:                                     ; preds = %if.end355.i
  %61 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.12 to i64), i64 1, i64 1) #5, !srcloc !47
  br label %cleanup.i

if.end378.i:                                      ; preds = %if.end355.i
  %and379.i = lshr i32 %60, 8
  %shr.i = and i32 %and379.i, 255
  %conv380.i = zext nneg i32 %shr.i to i64
  br label %cleanup.i

cleanup.i:                                        ; preds = %if.end378.i, %if.then371.i, %if.end318.i
  %retval.1.i = phi i64 [ -1, %if.then371.i ], [ %conv380.i, %if.end378.i ], [ -3, %if.end318.i ]
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %wstatus.i) #5
  call void @llvm.lifetime.end.p0(i64 36, ptr nonnull %tos.i14) #5
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %set.i) #5
  br label %process_line.exit

if.end384.i:                                      ; preds = %if.end96.i
  %cmp386.i = icmp slt i8 %23, 32
  br i1 %cmp386.i, label %if.then388.i, label %if.end395.i

if.then388.i:                                     ; preds = %if.end384.i
  %62 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 ptrtoint (ptr @.str.12 to i64), i64 1, i64 1) #5, !srcloc !48
  br label %process_line.exit.thread

if.end395.i:                                      ; preds = %if.end384.i
  %arrayidx396.i = getelementptr inbounds i8, ptr %outbuf, i64 %ptrlen.addr.0.i
  store i8 %23, ptr %arrayidx396.i, align 1, !tbaa !1
  %cmp397.i = icmp eq i64 %ptrlen.addr.0.i, %outlen.addr.0.i
  %inc400.i = zext i1 %cmp397.i to i64
  %spec.select465.i = add nsw i64 %outlen.addr.0.i, %inc400.i
  %inc402.i = add nsw i64 %ptrlen.addr.0.i, 1
  br label %while.body.i.backedge

while.body.i.backedge:                            ; preds = %if.end395.i, %if.end72.i, %if.then68.i, %if.end56.i, %if.then52.i, %if.then42.i, %if.then42.i, %if.end15.i, %if.then7.i, %if.end.i, %if.end.i
  %ptrlen.addr.0.i.be = phi i64 [ %dec16.i, %if.end15.i ], [ %dec57.i, %if.end56.i ], [ %inc.i, %if.end72.i ], [ %inc402.i, %if.end395.i ], [ 0, %if.then7.i ], [ %ptrlen.addr.0.i, %if.end.i ], [ 0, %if.then52.i ], [ %ptrlen.addr.0.i, %if.then68.i ], [ %ptrlen.addr.0.i, %if.then42.i ], [ %ptrlen.addr.0.i, %if.then42.i ], [ %ptrlen.addr.0.i, %if.end.i ]
  %outlen.addr.0.i.be = phi i64 [ %spec.select.i, %if.end15.i ], [ %outlen.addr.0.i, %if.end56.i ], [ %outlen.addr.0.i, %if.end72.i ], [ %spec.select465.i, %if.end395.i ], [ %spec.select.i, %if.then7.i ], [ %outlen.addr.0.i, %if.end.i ], [ %outlen.addr.0.i, %if.then52.i ], [ %ptrlen.addr.0.i, %if.then68.i ], [ %outlen.addr.0.i, %if.then42.i ], [ %outlen.addr.0.i, %if.then42.i ], [ %outlen.addr.0.i, %if.end.i ]
  br label %while.body.i

process_line.exit.thread:                         ; preds = %if.then42.i, %if.then32.i, %land.lhs.true215.i, %if.then388.i
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  br label %sw.epilog

process_line.exit:                                ; preds = %if.then151.i, %cleanup.i
  %retval.2474.i = phi i64 [ %retval.1.i, %cleanup.i ], [ %31, %if.then151.i ]
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %inbuf.addr.i)
  switch i64 %retval.2474.i, label %sw.default [
    i64 -3, label %sw.epilog
    i64 -1, label %sw.bb1
    i64 60, label %sw.bb2
    i64 0, label %sw.bb3
  ]

sw.bb1:                                           ; preds = %process_line.exit
  br label %sw.epilog

sw.bb2:                                           ; preds = %process_line.exit
  br label %sw.epilog

sw.bb3:                                           ; preds = %process_line.exit.thread18, %process_line.exit
  br label %sw.epilog

sw.default:                                       ; preds = %process_line.exit
  br label %sw.epilog

sw.epilog:                                        ; preds = %process_line.exit.thread, %process_line.exit, %sw.default, %sw.bb3, %sw.bb2, %sw.bb1
  %prompt.0 = phi ptr [ @.str.5, %sw.default ], [ @.str.2, %sw.bb1 ], [ @.str.3, %sw.bb2 ], [ @.str.4, %sw.bb3 ], [ @.str.1, %process_line.exit ], [ @.str.1, %process_line.exit.thread ]
  %63 = ptrtoint ptr %prompt.0 to i64
  %64 = call i64 asm sideeffect "syscall\0A", "={ax},{rdi},{rsi},{rdx},{rax},~{rcx},~{r11},~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %63, i64 14, i64 1) #5, !srcloc !49
  br label %while.cond11

while.cond11:                                     ; preds = %while.body12, %sw.epilog
  %d.0 = phi ptr [ %outbuf, %sw.epilog ], [ %incdec.ptr, %while.body12 ]
  %65 = load i8, ptr %d.0, align 1, !tbaa !1
  %tobool.not = icmp eq i8 %65, 0
  br i1 %tobool.not, label %while.cond, label %while.body12

while.body12:                                     ; preds = %while.cond11
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %d.0, i64 1
  store i8 0, ptr %d.0, align 1, !tbaa !1
  br label %while.cond11, !llvm.loop !50
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #4

attributes #0 = { minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { minsize noreturn nounwind optsize "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{i64 2147748151}
!7 = !{!8, !9, i64 12}
!8 = !{!"termios", !9, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !2, i64 16, !2, i64 17}
!9 = !{!"int", !2, i64 0}
!10 = !{i64 2147749277}
!11 = !{i64 2147783172}
!12 = !{i64 2147754769}
!13 = !{i64 2147755712}
!14 = !{i64 2147756814}
!15 = !{i64 2147757923}
!16 = !{i64 2147759007}
!17 = !{i64 2147760110}
!18 = !{i64 2147761230}
!19 = !{i64 2147762335}
!20 = !{i64 2147763419}
!21 = !{i64 2147764507}
!22 = distinct !{!22, !5}
!23 = !{i64 2147765431}
!24 = !{i64 2147766372}
!25 = !{i64 2147767177}
!26 = !{!27, !27, i64 0}
!27 = !{!"long", !2, i64 0}
!28 = !{i64 2147767914}
!29 = !{i64 2147768943}
!30 = distinct !{!30, !5}
!31 = !{!32, !32, i64 0}
!32 = !{!"p1 omnipotent char", !33, i64 0}
!33 = !{!"any pointer", !2, i64 0}
!34 = distinct !{!34, !5}
!35 = distinct !{!35, !5}
!36 = !{i64 2147769978}
!37 = !{i64 2147771016}
!38 = !{i64 2147771966}
!39 = !{i64 2147773066}
!40 = !{i64 2147774165}
!41 = !{i64 2147775291}
!42 = !{i64 2147776403}
!43 = !{i64 2147777530}
!44 = !{i64 2147778657}
!45 = !{i64 2147779769}
!46 = !{!9, !9, i64 0}
!47 = !{i64 2147780891}
!48 = !{i64 2147782040}
!49 = !{i64 2147784292}
!50 = distinct !{!50, !5}
