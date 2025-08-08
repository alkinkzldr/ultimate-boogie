; #Unsafe
; ModuleID = 'output_folder/NondeterministicLocalVarInitialValues.ll'
source_filename = "c5/NondeterministicLocalVarInitialValues.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"x == a\00", align 1
@.str.1 = private unnamed_addr constant [43 x i8] c"c5/NondeterministicLocalVarInitialValues.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define dso_local i32 @main() {
entry:
  br label %while.cond

while.cond:                                       ; preds = %if.end5, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %if.end5 ]
  %cmp = icmp slt i32 %i.0, 2
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %cmp1 = icmp eq i32 %i.0, 0
  %cmp2 = icmp eq i32 0, undef
  %or.cond = or i1 %cmp1, %cmp2
  br i1 %or.cond, label %if.end5, label %if.else4

if.else4:                                         ; preds = %while.body
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 21, ptr noundef @__PRETTY_FUNCTION__.main) #1
  unreachable

if.end5:                                          ; preds = %while.body
  %inc = add nsw i32 %i.0, 1
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #0

attributes #0 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #1 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
