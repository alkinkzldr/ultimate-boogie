; #Safe
; ModuleID = './ACSL-at.c'
source_filename = "./ACSL-at.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@g = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [6 x i8] c"g < x\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"./ACSL-at.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define dso_local void @div() #0 {
entry:
  %0 = load i32, ptr @g, align 4
  %div = sdiv i32 %0, 2
  store i32 %div, ptr @g, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %call = call i32 @__VERIFIER_nondet_int()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, ptr @g, align 4
  %div1 = sdiv i32 %1, 2
  store i32 %div1, ptr @g, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

declare i32 @__VERIFIER_nondet_int(...) #1

define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  %call = call i32 @__VERIFIER_nondet_int()
  store i32 %call, ptr %x, align 4
  %0 = load i32, ptr %x, align 4
  store i32 %0, ptr @g, align 4
  %1 = load i32, ptr @g, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  call void @div()
  %2 = load i32, ptr @g, align 4
  %3 = load i32, ptr %x, align 4
  %cmp1 = icmp slt i32 %2, %3
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  br label %if.end

if.else:                                          ; preds = %if.then
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 30, ptr noundef @__PRETTY_FUNCTION__.main) #3
  unreachable

if.end:                                           ; preds = %if.then2
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  %4 = load i32, ptr %retval, align 4
  ret i32 %4
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #2 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
