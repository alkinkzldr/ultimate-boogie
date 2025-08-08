; #Safe
; ModuleID = 'output_folder/structFlexibleArray02.ll'
source_filename = "c5/structFlexibleArray02.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%struct.str = type { i32, [0 x i32] }

@.str = private unnamed_addr constant [10 x i8] c"res == 42\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"c5/structFlexibleArray02.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define dso_local i32 @main() {
entry:
  %call = call noalias ptr @malloc(i64 noundef 12) #2
  %d = getelementptr inbounds %struct.str, ptr %call, i32 0, i32 1
  %arrayidx = getelementptr inbounds [0 x i32], ptr %d, i64 0, i64 0
  store i32 42, ptr %arrayidx, align 4
  %d1 = getelementptr inbounds %struct.str, ptr %call, i32 0, i32 1
  %arrayidx2 = getelementptr inbounds [0 x i32], ptr %d1, i64 0, i64 0
  %0 = load i32, ptr %arrayidx2, align 4
  %cmp = icmp eq i32 %0, 42
  br i1 %cmp, label %if.end, label %if.else

if.else:                                          ; preds = %entry
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 20, ptr noundef @__PRETTY_FUNCTION__.main) #3
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #0

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #1

attributes #0 = { nounwind allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #1 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #2 = { nounwind allocsize(0) }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
