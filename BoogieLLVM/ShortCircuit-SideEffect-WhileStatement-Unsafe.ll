; #Unsafe
; ModuleID = 'c5/ShortCircuit-SideEffect-WhileStatement-Unsafe.c'
source_filename = "c5/ShortCircuit-SideEffect-WhileStatement-Unsafe.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"y >= 2\00", align 1
@.str.1 = private unnamed_addr constant [51 x i8] c"c5/ShortCircuit-SideEffect-WhileStatement-Unsafe.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %a6 = alloca i32, align 4
  %b10 = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 1, ptr %x, align 4
  store i32 1, ptr %y, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end, %entry
  %0 = load i32, ptr %x, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, ptr %x, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %1 = load i32, ptr %y, align 4
  %inc1 = add nsw i32 %1, 1
  store i32 %inc1, ptr %y, align 4
  %cmp2 = icmp eq i32 %1, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %2 = phi i1 [ false, %while.cond ], [ %cmp2, %land.rhs ]
  br i1 %2, label %while.body, label %while.end5

while.body:                                       ; preds = %land.end
  br label %while.cond3

while.cond3:                                      ; preds = %while.body4, %while.body
  %3 = load i32, ptr %a, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %while.body4, label %while.end

while.body4:                                      ; preds = %while.cond3
  %4 = load i32, ptr %b, align 4
  store i32 %4, ptr %a, align 4
  br label %while.cond3, !llvm.loop !6

while.end:                                        ; preds = %while.cond3
  br label %while.cond, !llvm.loop !8

while.end5:                                       ; preds = %land.end
  br label %while.cond7

while.cond7:                                      ; preds = %while.body9, %while.end5
  %5 = load i32, ptr %a6, align 4
  %tobool8 = icmp ne i32 %5, 0
  br i1 %tobool8, label %while.body9, label %while.end11

while.body9:                                      ; preds = %while.cond7
  %6 = load i32, ptr %b10, align 4
  store i32 %6, ptr %a6, align 4
  br label %while.cond7, !llvm.loop !9

while.end11:                                      ; preds = %while.cond7
  %7 = load i32, ptr %y, align 4
  %cmp12 = icmp sge i32 %7, 2
  br i1 %cmp12, label %if.then, label %if.else

if.then:                                          ; preds = %while.end11
  br label %if.end

if.else:                                          ; preds = %while.end11
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 16, ptr noundef @__PRETTY_FUNCTION__.main) #2
  unreachable

if.end:                                           ; preds = %if.then
  %8 = load i32, ptr %retval, align 4
  ret i32 %8
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #1

attributes #1 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #2 = { noreturn nounwind }

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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
