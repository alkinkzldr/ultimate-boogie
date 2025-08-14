; #MiniSafe
; globaler Pointer + malloc + read/write mit gep != 0
target triple = "aarch64-unknown-linux-gnu"

@a = dso_local global ptr null, align 8

; extern malloc
declare noalias ptr @malloc(i64 noundef)

define dso_local i32 @main() {
entry:
  ; 1) Heap anfordern: 8 Bytes (2 * i32)
  %p = call noalias ptr @malloc(i64 8)

  ; 2) globalen Pointer setzen: a = %p
  store ptr %p, ptr @a, align 8

  ; 3) Adresse von a[1] (zweites i32) berechnen
  %p1 = getelementptr inbounds i32, ptr %p, i64 1

  ; 4) a[1] = 7
  store i32 7, ptr %p1, align 4

  ; 5) v = a[1]
  %v = load i32, ptr %p1, align 4

  ; 6) Rückgabe: 7
  ret i32 %v
}
