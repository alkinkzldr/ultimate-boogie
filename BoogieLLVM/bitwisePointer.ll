; #Safe
; ModuleID = './bitwisePointer.c'
source_filename = "./bitwisePointer.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"r >= 0\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"./bitwisePointer.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %r = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %p = alloca ptr, align 8
  store i32 0, ptr %retval, align 4
  store ptr %r, ptr %p, align 8
  %0 = load i32, ptr %y, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end3

if.end:                                           ; preds = %entry
  %1 = load i32, ptr %x, align 4
  %2 = load i32, ptr %y, align 4
  %and = and i32 %1, %2
  %3 = load ptr, ptr %p, align 8
  store i32 %and, ptr %3, align 4
  %4 = load i32, ptr %r, align 4
  %cmp1 = icmp sge i32 %4, 0
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  br label %if.end3

if.else:                                          ; preds = %if.end
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 14, ptr noundef @__PRETTY_FUNCTION__.main) #2
  unreachable

if.end3:                                          ; preds = %if.then, %if.then2
  %5 = load i32, ptr %retval, align 4
  ret i32 %5
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #1

attributes #1 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #2 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
