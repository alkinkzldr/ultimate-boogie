; #Safe
; ModuleID = 'c5/ShortCircuit-SideEffect-IfStatement-Safe.c'
source_filename = "c5/ShortCircuit-SideEffect-IfStatement-Safe.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"x == 2 && y == 2 && z == 0\00", align 1
@.str.1 = private unnamed_addr constant [46 x i8] c"c5/ShortCircuit-SideEffect-IfStatement-Safe.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i8, align 1
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %a3 = alloca i32, align 4
  %b7 = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 1, ptr %x, align 4
  store i32 1, ptr %y, align 4
  %0 = load i32, ptr %x, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, ptr %x, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, ptr %y, align 4
  %inc1 = add nsw i32 %1, 1
  store i32 %inc1, ptr %y, align 4
  %cmp2 = icmp eq i32 %1, 0
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, ptr %z, align 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %2 = load i32, ptr %a, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, ptr %b, align 4
  store i32 %3, ptr %a, align 4
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, ptr %z, align 1
  br label %while.cond4

while.cond4:                                      ; preds = %while.body6, %if.else
  %4 = load i32, ptr %a3, align 4
  %tobool5 = icmp ne i32 %4, 0
  br i1 %tobool5, label %while.body6, label %while.end8

while.body6:                                      ; preds = %while.cond4
  %5 = load i32, ptr %b7, align 4
  store i32 %5, ptr %a3, align 4
  br label %while.cond4, !llvm.loop !8

while.end8:                                       ; preds = %while.cond4
  br label %if.end

if.end:                                           ; preds = %while.end8, %while.end
  %6 = load i32, ptr %x, align 4
  %cmp9 = icmp eq i32 %6, 2
  br i1 %cmp9, label %land.lhs.true, label %if.else16

land.lhs.true:                                    ; preds = %if.end
  %7 = load i32, ptr %y, align 4
  %cmp10 = icmp eq i32 %7, 2
  br i1 %cmp10, label %land.lhs.true11, label %if.else16

land.lhs.true11:                                  ; preds = %land.lhs.true
  %8 = load i8, ptr %z, align 1
  %tobool12 = trunc i8 %8 to i1
  %conv = zext i1 %tobool12 to i32
  %cmp13 = icmp eq i32 %conv, 0
  br i1 %cmp13, label %if.then15, label %if.else16

if.then15:                                        ; preds = %land.lhs.true11
  br label %if.end17

if.else16:                                        ; preds = %land.lhs.true11, %land.lhs.true, %if.end
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 18, ptr noundef @__PRETTY_FUNCTION__.main) #2
  unreachable

if.end17:                                         ; preds = %if.then15
  %9 = load i32, ptr %retval, align 4
  ret i32 %9
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
