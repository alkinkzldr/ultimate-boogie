; #Unsafe
; ModuleID = 'output_folder/VariableDeclarationInLoops.ll'
source_filename = "c5/VariableDeclarationInLoops.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"y != 0\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"c5/VariableDeclarationInLoops.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"x == 0\00", align 1
@__PRETTY_FUNCTION__.test = private unnamed_addr constant [11 x i8] c"int test()\00", align 1

define dso_local i32 @main() {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %cmp = icmp sgt i32 5, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %cmp1 = icmp ne i32 undef, 0
  br i1 %cmp1, label %while.cond, label %if.else, !llvm.loop !6

if.else:                                          ; preds = %while.body
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 16, ptr noundef @__PRETTY_FUNCTION__.main) #1
  unreachable

while.end:                                        ; preds = %while.cond
  %call = call i32 @test()
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #0

define dso_local i32 @test() {
entry:
  br label %MY_LABEL

MY_LABEL:                                         ; preds = %MY_LABEL, %entry
  %cmp = icmp ne i32 undef, 0
  br i1 %cmp, label %MY_LABEL, label %if.end3

if.end3:                                          ; preds = %MY_LABEL
  ret i32 undef
}

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
