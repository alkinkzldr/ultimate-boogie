; #Safe
; ModuleID = 'c5/StructPositiveSum-Safe.c'
source_filename = "c5/StructPositiveSum-Safe.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%struct.pair = type { i32, i32 }

@__const.main.a = private unnamed_addr constant %struct.pair { i32 23, i32 42 }, align 4
@.str = private unnamed_addr constant [19 x i8] c"a.fst + a.snd >= 0\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"c5/StructPositiveSum-Safe.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [15 x i8] c"int main(void)\00", align 1

define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.pair, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %a, ptr align 4 @__const.main.a, i64 8, i1 false)
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %call = call i32 @__VERIFIER_nondet_int()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call1 = call i32 @__VERIFIER_nondet_int()
  %tobool2 = icmp ne i32 %call1, 0
  br i1 %tobool2, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %fst = getelementptr inbounds %struct.pair, ptr %a, i32 0, i32 0
  %0 = load i32, ptr %fst, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, ptr %fst, align 4
  %snd = getelementptr inbounds %struct.pair, ptr %a, i32 0, i32 1
  %1 = load i32, ptr %snd, align 4
  %dec = add nsw i32 %1, -1
  store i32 %dec, ptr %snd, align 4
  br label %if.end

if.else:                                          ; preds = %while.body
  %fst3 = getelementptr inbounds %struct.pair, ptr %a, i32 0, i32 0
  %2 = load i32, ptr %fst3, align 4
  %dec4 = add nsw i32 %2, -1
  store i32 %dec4, ptr %fst3, align 4
  %snd5 = getelementptr inbounds %struct.pair, ptr %a, i32 0, i32 1
  %3 = load i32, ptr %snd5, align 4
  %inc6 = add nsw i32 %3, 1
  store i32 %inc6, ptr %snd5, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %fst7 = getelementptr inbounds %struct.pair, ptr %a, i32 0, i32 0
  %4 = load i32, ptr %fst7, align 4
  %snd8 = getelementptr inbounds %struct.pair, ptr %a, i32 0, i32 1
  %5 = load i32, ptr %snd8, align 4
  %add = add nsw i32 %4, %5
  %cmp = icmp sge i32 %add, 0
  br i1 %cmp, label %if.then9, label %if.else10

if.then9:                                         ; preds = %while.end
  br label %if.end11

if.else10:                                        ; preds = %while.end
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 27, ptr noundef @__PRETTY_FUNCTION__.main) #4
  unreachable

if.end11:                                         ; preds = %if.then9
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @__VERIFIER_nondet_int() #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #3

attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #3 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #4 = { noreturn nounwind }

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
