; #Unsafe
; ModuleID = 'output_folder/ShortCircuit-SideEffect-ForStatement-Unsafe.ll'
source_filename = "c5/ShortCircuit-SideEffect-ForStatement-Unsafe.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"y >= 2\00", align 1
@.str.1 = private unnamed_addr constant [49 x i8] c"c5/ShortCircuit-SideEffect-ForStatement-Unsafe.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define dso_local i32 @main() {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.inc ]
  %y.0 = phi i32 [ 1, %entry ], [ %y.1, %for.inc ]
  %x.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ]
  %inc = add nsw i32 %x.0, 1
  %cmp = icmp ne i32 %x.0, 0
  %inc1 = add nsw i32 %y.0, 1
  %cmp2 = icmp ne i32 %y.0, 0
  %y.1 = select i1 %cmp, i32 %y.0, i32 %inc1
  %0 = select i1 %cmp, i1 true, i1 %cmp2
  br i1 %0, label %while.cond, label %for.end

while.cond:                                       ; preds = %while.cond, %for.cond
  %tobool = icmp ne i32 undef, 0
  br i1 %tobool, label %while.cond, label %while.end, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %cmp3 = icmp sge i32 %y.1, 2
  br i1 %cmp3, label %for.inc, label %if.else

if.else:                                          ; preds = %while.end
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 14, ptr noundef @__PRETTY_FUNCTION__.main) #1
  unreachable

for.inc:                                          ; preds = %while.end
  %inc4 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
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
!8 = distinct !{!8, !7}
