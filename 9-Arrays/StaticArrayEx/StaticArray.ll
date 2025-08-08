; Statisches globales Array (4 Elemente)
@arr = global [4 x i32] [i32 1, i32 2, i32 3, i32 4], align 16

define i32 @main() {
entry:
  ; === arr[0] lesen ===
  %p0 = getelementptr inbounds [4 x i32], ptr @arr, i64 0, i64 0
  %v0 = load i32, ptr %p0, align 4

  ; === arr[1] schreiben (Wert = 42) ===
  %p1 = getelementptr inbounds [4 x i32], ptr @arr, i64 0, i64 1
  store i32 42, ptr %p1, align 4
  ; das heißt also p1 zeigt auf arr1 aber es heißt aber wir müssen trz manuell die 1. element von map mit 42 erstezen

  ; === arr[2] lesen ===
  %p2 = getelementptr inbounds [4 x i32], ptr @arr, i64 0, i64 2
  %v2 = load i32, ptr %p2, align 4

  ; testen...
  
  ret i32 0
}
