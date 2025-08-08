; #Unsafe
; ModuleID = 'output_folder/ShortCircuit-SideEffect-ExpressionStatement-Unsafe.ll'
source_filename = "cfolder/ShortCircuit-SideEffect-ExpressionStatement-Unsafe.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

define dso_local i32 @main() {
entry:
  %inc = add nsw i32 1, 1
  %cmp = icmp ne i32 1, 0
  %cmp2 = icmp eq i32 1, 0
  %spec.select = select i1 %cmp, i1 true, i1 %cmp2
  %lor.ext = zext i1 %spec.select to i32
  ret i32 0
}

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
