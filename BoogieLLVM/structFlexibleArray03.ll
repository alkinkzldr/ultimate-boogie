; #Safe
; ModuleID = 'c5/structFlexibleArray03.c'
source_filename = "c5/structFlexibleArray03.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%struct.str = type { i32, [0 x i32] }

@.str = private unnamed_addr constant [10 x i8] c"res == 42\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"c5/structFlexibleArray03.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define dso_local i32 @main() #0 {
entry:
  %s1 = alloca ptr, align 8
  %s2 = alloca ptr, align 8
  %dp = alloca ptr, align 8
  %res = alloca i32, align 4
  %call = call noalias ptr @malloc(i64 noundef 12) #4
  store ptr %call, ptr %s1, align 8
  %call1 = call noalias ptr @malloc(i64 noundef 6) #4
  store ptr %call1, ptr %s2, align 8
  %0 = load ptr, ptr %s1, align 8
  %d = getelementptr inbounds %struct.str, ptr %0, i32 0, i32 1
  %arrayidx = getelementptr inbounds [0 x i32], ptr %d, i64 0, i64 0
  store ptr %arrayidx, ptr %dp, align 8
  %1 = load ptr, ptr %dp, align 8
  store i32 42, ptr %1, align 4
  %2 = load ptr, ptr %s1, align 8
  %3 = load ptr, ptr %s2, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 %3, i64 4, i1 false)
  %4 = load ptr, ptr %s1, align 8
  %d2 = getelementptr inbounds %struct.str, ptr %4, i32 0, i32 1
  %arrayidx3 = getelementptr inbounds [0 x i32], ptr %d2, i64 0, i64 0
  %5 = load i32, ptr %arrayidx3, align 4
  store i32 %5, ptr %res, align 4
  %6 = load i32, ptr %res, align 4
  %cmp = icmp eq i32 %6, 42
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 22, ptr noundef @__PRETTY_FUNCTION__.main) #5
  unreachable

if.end:                                           ; preds = %if.then
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #3

attributes #1 = { nounwind allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
