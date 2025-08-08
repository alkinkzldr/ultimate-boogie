; #Safe
; ModuleID = 'ERWX/PostfixIncrementDecrement.c'
source_filename = "ERWX/PostfixIncrementDecrement.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"y == 12\00", align 1
@.str.1 = private unnamed_addr constant [33 x i8] c"ERWX/PostfixIncrementDecrement.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"x == 8\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"z == 19\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"x == 7\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 7, ptr %x, align 4
  %0 = load i32, ptr %x, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, ptr %x, align 4
  %add = add nsw i32 %0, 5
  store i32 %add, ptr %y, align 4
  %1 = load i32, ptr %y, align 4
  %cmp = icmp eq i32 %1, 12
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 14, ptr noundef @__PRETTY_FUNCTION__.main) #3
  unreachable

if.end:                                           ; preds = %if.then
  %2 = load i32, ptr %x, align 4
  %cmp1 = icmp eq i32 %2, 8
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  br label %if.end4

if.else3:                                         ; preds = %if.end
  call void @__assert_fail(ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 15, ptr noundef @__PRETTY_FUNCTION__.main) #3
  unreachable

if.end4:                                          ; preds = %if.then2
  %3 = load i32, ptr %x, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, ptr %x, align 4
  %add5 = add nsw i32 %3, 11
  store i32 %add5, ptr %z, align 4
  %4 = load i32, ptr %z, align 4
  %cmp6 = icmp eq i32 %4, 19
  br i1 %cmp6, label %if.then7, label %if.else8

if.then7:                                         ; preds = %if.end4
  br label %if.end9

if.else8:                                         ; preds = %if.end4
  call void @__assert_fail(ptr noundef @.str.3, ptr noundef @.str.1, i32 noundef 17, ptr noundef @__PRETTY_FUNCTION__.main) #3
  unreachable

if.end9:                                          ; preds = %if.then7
  %5 = load i32, ptr %x, align 4
  %cmp10 = icmp eq i32 %5, 7
  br i1 %cmp10, label %if.then11, label %if.else12

if.then11:                                        ; preds = %if.end9
  br label %if.end13

if.else12:                                        ; preds = %if.end9
  call void @__assert_fail(ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 18, ptr noundef @__PRETTY_FUNCTION__.main) #3
  unreachable

if.end13:                                         ; preds = %if.then11
  %6 = load i32, ptr %x, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %6)
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

attributes #1 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
