; #Safe
; ModuleID = 'output_folder/PrefixIncrementDecrement.ll'
source_filename = "ERWX/PrefixIncrementDecrement.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"y == 13\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERWX/PrefixIncrementDecrement.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"x == 8\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"z == 18\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"x == 7\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define dso_local i32 @main() {
entry:
  %inc = add nsw i32 7, 1
  %add = add nsw i32 %inc, 5
  %cmp = icmp eq i32 %add, 13
  br i1 %cmp, label %if.end, label %if.else

if.else:                                          ; preds = %entry
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 14, ptr noundef @__PRETTY_FUNCTION__.main) #2
  unreachable

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i32 %inc, 8
  br i1 %cmp1, label %if.end4, label %if.else3

if.else3:                                         ; preds = %if.end
  call void @__assert_fail(ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 15, ptr noundef @__PRETTY_FUNCTION__.main) #2
  unreachable

if.end4:                                          ; preds = %if.end
  %dec = add nsw i32 %inc, -1
  %add5 = add nsw i32 %dec, 11
  %cmp6 = icmp eq i32 %add5, 18
  br i1 %cmp6, label %if.end9, label %if.else8

if.else8:                                         ; preds = %if.end4
  call void @__assert_fail(ptr noundef @.str.3, ptr noundef @.str.1, i32 noundef 17, ptr noundef @__PRETTY_FUNCTION__.main) #2
  unreachable

if.end9:                                          ; preds = %if.end4
  %cmp10 = icmp eq i32 %dec, 7
  br i1 %cmp10, label %if.end13, label %if.else12

if.else12:                                        ; preds = %if.end9
  call void @__assert_fail(ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 18, ptr noundef @__PRETTY_FUNCTION__.main) #2
  unreachable

if.end13:                                         ; preds = %if.end9
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %dec)
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #0

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #2 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
