//nur GEP ist hier anders, cehck it out!
//ultimate automizer - safe

// ====== Pointer-Typ & Heap-Modell ======
type $Pointer$ = { base:int, offset:int };

var a : $Pointer$;

var H_valid    : [int] bool;         // gültiger Block?
var H_len      : [int] int;          // Blockgröße in BYTES
var H_mem_i32  : [$Pointer$] int;    // i32-Speicher: (Pointer) -> Wert

const SIZEOF_I32 : int;
axiom SIZEOF_I32 == 4;

// ====== Typisierte Speicher-Operationen (Spezifikationen) ======
procedure read_i32(p:$Pointer$) returns (v:int);
  requires H_valid[p!base];
  requires 0 <= p!offset && p!offset + SIZEOF_I32 <= H_len[p!base];
  ensures  v == H_mem_i32[p];

procedure write_i32(p:$Pointer$, v:int);
  requires H_valid[p!base];
  requires 0 <= p!offset && p!offset + SIZEOF_I32 <= H_len[p!base];
  modifies H_mem_i32;
  ensures  H_mem_i32 == old(H_mem_i32)[p := v];

// ====== Heap-Allocation (Spezifikation) ======
procedure $malloc(n:int) returns (p:$Pointer$);
  requires n >= 0;
  ensures  p!base != 0;
  ensures  p!offset == 0;
  ensures  H_valid[p!base];
  ensures  H_len[p!base] == n;
  modifies H_valid, H_len;

// ====== main(): malloc(8), a := p, gep +1, store 7, load, ret ======
procedure main() returns (ret:int);
  modifies a, H_valid, H_len, H_mem_i32;

implementation main() returns (ret:int)
{
  var p   : $Pointer$;  // %p
  var p1  : $Pointer$;  // %p1 = gep i32, p, 1
  var v   : int;        // %v

  // 1) %p = malloc(8)  -- zwei i32
  call p := $malloc(2 * SIZEOF_I32);

  // 2) a = %p
  a := p;

  // 3) %p1 = getelementptr i32, p, 1  -- Offset + 1 * sizeof(i32)
  p1 := { base: p!base, offset: p!offset + 1 * SIZEOF_I32 };

  // 4) store i32 7, ptr %p1
  call write_i32(p1, 7);

  // 5) %v = load i32, ptr %p1
  call v := read_i32(p1);

  // 6) ret i32 %v
  ret := v;
  return;
}
