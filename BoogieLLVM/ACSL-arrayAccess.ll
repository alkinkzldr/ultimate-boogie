; #Safe
; ModuleID = 'c5/ACSL-arrayAccess.c'
source_filename = "c5/ACSL-arrayAccess.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@__const.main.a = private unnamed_addr constant [2 x i32] [i32 1, i32 2], align 4
@.str = private unnamed_addr constant [24 x i8] c"p[0] == 42 && a[1] == 2\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"c5/ACSL-arrayAccess.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define dso_local i32 @main() #0 {
entry:
  %p = alloca ptr, align 8
  %a = alloca [2 x i32], align 4
  %call = call noalias ptr @malloc(i64 noundef 4) #4
  store ptr %call, ptr %p, align 8
  %0 = load ptr, ptr %p, align 8
  store i32 42, ptr %0, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %a, ptr align 4 @__const.main.a, i64 8, i1 false)
  %1 = load ptr, ptr %p, align 8
  %arrayidx = getelementptr inbounds i32, ptr %1, i64 0
  %2 = load i32, ptr %arrayidx, align 4
  %cmp = icmp eq i32 %2, 42
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %arrayidx1 = getelementptr inbounds [2 x i32], ptr %a, i64 0, i64 1
  %3 = load i32, ptr %arrayidx1, align 4
  %cmp2 = icmp eq i32 %3, 2
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 15, ptr noundef @__PRETTY_FUNCTION__.main) #5
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
