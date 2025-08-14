//ultimate automizer - safe
// ====== Pointer-Typ & Heap-Modell ======
type $Pointer$ = { base:int, offset:int };

var a : $Pointer$;

var H_valid    : [int] bool;         // gültiger Block?
var H_len      : [int] int;          // Blockgröße in BYTES
var H_mem_i32  : [$Pointer$] int;    // i32-Speicher: (Pointer) -> Wert

const SIZEOF_I32 : int;
axiom SIZEOF_I32 == 4;

// ===== read_i32 / write_i32 (Spezifikationen) =====
procedure read_i32(p:$Pointer$) returns (v:int);
  requires H_valid[p!base];
  requires 0 <= p!offset && p!offset + SIZEOF_I32 <= H_len[p!base];
  ensures  v == H_mem_i32[p];

procedure write_i32(p:$Pointer$, v:int);
  requires H_valid[p!base];
  requires 0 <= p!offset && p!offset + SIZEOF_I32 <= H_len[p!base];
  modifies H_mem_i32;
  ensures  H_mem_i32 == old(H_mem_i32)[p := v];

// ===== $malloc (Spezifikation) =====
procedure $malloc(n:int) returns (p:$Pointer$);
  requires n >= 0;
  ensures  p!base != 0;
  ensures  p!offset == 0;
  ensures  H_valid[p!base];
  ensures  H_len[p!base] == n;
  modifies H_valid, H_len;

// ===== main (Deklaration mit modifies; Implementation ohne modifies) =====
procedure main() returns (ret:int);
  modifies a, H_valid, H_len, H_mem_i32;

implementation main() returns (ret:int)
{
  var p  : $Pointer$;  // LLVM: %p
  var v  : int;        // LLVM: %v

  // [1] %p = malloc(4)
  call p := $malloc(SIZEOF_I32);

  // [2] store ptr %p -> @a
  a := p;

  // [3] gep i32, a, 0  ⇒ gleicher Pointer (offset + 0 * sizeof(i32))
  p := { base: a!base, offset: a!offset + 0 * SIZEOF_I32 }; 

  // [4] store i32 7 -> *a
  call write_i32(a, 7);

  // [5] v = load i32 *a
  call v := read_i32(a);

  // [6] ret i32 v
  ret := v;
  return;
}
