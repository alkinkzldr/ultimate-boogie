; #Safe
; ModuleID = 'output_folder/ACSL-arrayAccess.ll'
source_filename = "c5/ACSL-arrayAccess.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@__const.main.a = private unnamed_addr constant [2 x i32] [i32 1, i32 2], align 4
@.str = private unnamed_addr constant [24 x i8] c"p[0] == 42 && a[1] == 2\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"c5/ACSL-arrayAccess.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define dso_local i32 @main() {
entry:
  %call = call noalias ptr @malloc(i64 noundef 4) #3
  store i32 42, ptr %call, align 4
  %a.sroa.0.0.copyload = load i32, ptr @__const.main.a, align 4
  %a.sroa.1.0.copyload = load i32, ptr getelementptr inbounds (i8, ptr @__const.main.a, i64 4), align 4
  %arrayidx = getelementptr inbounds i32, ptr %call, i64 0
  %0 = load i32, ptr %arrayidx, align 4
  %cmp = icmp eq i32 %0, 42
  %cmp2 = icmp eq i32 %a.sroa.1.0.copyload, 2
  %or.cond = select i1 %cmp, i1 %cmp2, i1 false
  br i1 %or.cond, label %if.end, label %if.else

if.else:                                          ; preds = %entry
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 15, ptr noundef @__PRETTY_FUNCTION__.main) #4
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #0

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

attributes #0 = { nounwind allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
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
