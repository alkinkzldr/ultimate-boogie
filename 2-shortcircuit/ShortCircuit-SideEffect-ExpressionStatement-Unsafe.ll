; #Unsafe
; ModuleID = 'cfolder/ShortCircuit-SideEffect-ExpressionStatement-Unsafe.c'
source_filename = "cfolder/ShortCircuit-SideEffect-ExpressionStatement-Unsafe.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 1, ptr %x, align 4
  store i32 1, ptr %y, align 4
  %0 = load i32, ptr %x, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, ptr %x, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %1 = load i32, ptr %y, align 4
  %inc1 = add nsw i32 %1, 1
  store i32 %inc1, ptr %y, align 4
  %cmp2 = icmp eq i32 %1, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %2 = phi i1 [ true, %entry ], [ %cmp2, %lor.rhs ]
  %lor.ext = zext i1 %2 to i32
  %3 = load i32, ptr %retval, align 4
  ret i32 %3
}


!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
