; #Safe
; ModuleID = 'c5/NestedDeclarators.c'
source_filename = "c5/NestedDeclarators.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@g = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [9 x i8] c"x == g-1\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"c5/NestedDeclarators.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define dso_local i32 @main() #0 {
entry:
  %x = alloca i32, align 4
  %0 = load i32, ptr @g, align 4
  store i32 %0, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %call = call i32 @increase(i32 noundef %1)
  store i32 %call, ptr @g, align 4
  %2 = load i32, ptr %x, align 4
  %3 = load i32, ptr @g, align 4
  %sub = sub nsw i32 %3, 1
  %cmp = icmp eq i32 %2, %sub
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 14, ptr noundef @__PRETTY_FUNCTION__.main) #2
  unreachable

if.end:                                           ; preds = %if.then
  ret i32 0
}

define dso_local i32 @increase(i32 noundef %a) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 %a, ptr %a.addr, align 4
  %0 = load i32, ptr %a.addr, align 4
  store i32 %0, ptr %b, align 4
  %1 = load i32, ptr %b, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, ptr %b, align 4
  %2 = load i32, ptr %b, align 4
  ret i32 %2
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
