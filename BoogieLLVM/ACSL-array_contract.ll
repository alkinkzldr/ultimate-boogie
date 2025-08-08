; #Safe
; ModuleID = 'c5/ACSL-array_contract.c'
source_filename = "c5/ACSL-array_contract.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@a = dso_local global ptr null, align 8
@.str = private unnamed_addr constant [8 x i8] c"*a == 7\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"c5/ACSL-array_contract.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define dso_local void @init() #0 {
entry:
  %0 = load ptr, ptr @a, align 8
  %arrayidx = getelementptr inbounds i32, ptr %0, i64 0
  store i32 7, ptr %arrayidx, align 4
  ret void
}

define dso_local i32 @main() #0 {
entry:
  %call = call noalias ptr @malloc(i64 noundef 4) #3
  store ptr %call, ptr @a, align 8
  call void @init()
  %0 = load ptr, ptr @a, align 8
  %1 = load i32, ptr %0, align 4
  %cmp = icmp eq i32 %1, 7
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 21, ptr noundef @__PRETTY_FUNCTION__.main) #4
  unreachable

if.end:                                           ; preds = %if.then
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

attributes #1 = { nounwind allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #2 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #3 = { nounwind allocsize(0) }
attributes #4 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
