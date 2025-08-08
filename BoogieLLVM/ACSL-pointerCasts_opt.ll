; #Safe
; ModuleID = 'output_folder/ACSL-pointerCasts.ll'
source_filename = "erw/ACSL-pointerCasts.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [28 x i8] c"(unsigned long long) p == 0\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"erw/ACSL-pointerCasts.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"p == (int*) 0\00", align 1

define dso_local i32 @main() {
entry:
  %0 = ptrtoint ptr null to i64
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.end4, label %if.else

if.else:                                          ; preds = %entry
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 9, ptr noundef @__PRETTY_FUNCTION__.main) #1
  unreachable

if.end4:                                          ; preds = %entry
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
