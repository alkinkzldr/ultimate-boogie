// ===== Globals =====
var a_base : int;

var H_valid   : [int] bool;
var H_len     : [int] int;
var H_mem_i32 : [int,int] int;

const SIZEOF_I32: int;
axiom SIZEOF_I32 == 4;

// ===== read_i32 =====
procedure {:inline 1} read_i32(b:int, byteOff:int) returns (v:int);
  requires H_valid[b];
  requires 0 <= byteOff && byteOff + SIZEOF_I32 <= H_len[b];

implementation {:inline 1} read_i32(b:int, byteOff:int) returns (v:int)
{
  var idx:int;
  idx := byteOff / SIZEOF_I32;
  v := H_mem_i32[b, idx];
  return;
}

// ===== write_i32 =====
procedure {:inline 1} write_i32(b:int, byteOff:int, v:int);
  requires H_valid[b];
  requires 0 <= byteOff && byteOff + SIZEOF_I32 <= H_len[b];
  modifies H_mem_i32;

implementation {:inline 1} write_i32(b:int, byteOff:int, v:int)
{
  var idx:int;
  idx := byteOff / SIZEOF_I32;
  H_mem_i32[b, idx] := v;
  return;
}

// ===== $malloc =====
procedure {:inline 1} $malloc(n:int) returns (b:int);
  requires n >= 0;
  ensures  b != 0 && H_valid[b] && H_len[b] == n;
  modifies H_valid, H_len;

implementation {:inline 1} $malloc(n:int) returns (b:int)
{
  havoc b; assume b != 0 && !H_valid[b];
  H_valid[b] := true;
  H_len[b]   := n;
  return;
}

// ===== main (procedure deklariert mit modifies; implementation ohne) =====
procedure main() returns (ret:int);
  modifies a_base, H_valid, H_len, H_mem_i32;

implementation main() returns (ret:int)
{
  var p:int;     // LLVM: %p
  var v:int;     // LLVM: %v
  var off:int;   // GEP-Byteoffset

  // [1] %p = malloc(4)
  call p := $malloc(4);

  // [2] store ptr %p -> @a
  a_base := p;

  // [3] gep i32, %p, 0  ⇒ Byteoffset 0
  off := 0;

  // [4] store i32 7 -> a[0]
  call write_i32(a_base, off, 7);

  // [5] v = load i32 a[0]
  call v := read_i32(a_base, off);

  // [6] ret i32 v
  ret := v;
  return;
}
