; #MiniSafe
; Nur das Nötigste: globaler Pointer + malloc + read/write
target triple = "aarch64-unknown-linux-gnu"

@a = dso_local global ptr null, align 8

; extern malloc
declare noalias ptr @malloc(i64 noundef)

define dso_local i32 @main() {
entry:
  ; 1) Heap anfordern: 4 Bytes (1 * i32)
  %p = call noalias ptr @malloc(i64 4)

  ; 2) globalen Pointer setzen: a = %p
  store ptr %p, ptr @a, align 8

  ; 3) Adresse von a[0] (i32) berechnen
  %p0 = getelementptr inbounds i32, ptr %p, i64 0

  ; 4) a[0] = 7
  store i32 7, ptr %p0, align 4

  ; 5) v = a[0]
  %v = load i32, ptr %p0, align 4

  ; 6) Rückgabe: 7
  ret i32 %v
}
