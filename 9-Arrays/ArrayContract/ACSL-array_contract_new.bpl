// Also die kommentare die mit (!) markiert sind, sind von mir
var a_base : int;                 // globaler Pointer @a → Block-ID

var H_valid  : [int] bool;        // Block existiert?
var H_len    : [int] int;         // Blockgröße in BYTES
var H_mem_i32: [int,int] int;     // i32-Speicher: (base, idx) -> Wert

const SIZEOF_I32: int;            // (!) ich glaube somit ist die Größe von i32 (4 bytes) wichtig, maybe kann man das mit Parser automatisch generieren lassen?
axiom SIZEOF_I32 == 4;

// i32 lesen
procedure {:inline 1} read_i32(b:int, byteOff:int) returns (v:int)
  requires H_valid[b];
  requires 0 <= byteOff && byteOff + SIZEOF_I32 <= H_len[b];
{
  var idx:int;
  idx := byteOff / SIZEOF_I32;
  v := H_mem_i32[b, idx];
  return;
}

// i32 schreiben
procedure {:inline 1} write_i32(b:int, byteOff:int, v:int)
  requires H_valid[b];
  requires 0 <= byteOff && byteOff + SIZEOF_I32 <= H_len[b];
  modifies H_mem_i32;
{
  var idx:int;
  idx := byteOff / SIZEOF_I32;
  H_mem_i32[b, idx] := v;
  return;
}

// malloc(n Bytes) -> frischer Block
procedure {:inline 1} $malloc(n:int) returns (b:int)
  requires n >= 0;
  ensures  b != 0 && H_valid[b] && H_len[b] == n;
  modifies H_valid, H_len;
{
  havoc b; assume b != 0 && !H_valid[b];
  H_valid[b] := true;
  H_len[b]   := n;
  return;
}


// main zum übersetzen
procedure init() returns (ret:int)
  modifies a_base, H_valid, H_len, H_mem_i32;

implementation init() returns (ret:int)
  modifies a_base, H_valid, H_len, H_mem_i32
{
    var p:int;     // entspricht %0 in LLVM
    var off:int;   // entspricht Byteoffset vom GEP

    // %0 = load ptr, ptr @a
    p := a_base;

    // %arrayidx = gep i32, ptr %0, 0  ⇒ offset = 0
    off := 0 * SIZEOF_I32;

    // store i32 7, ptr %arrayidx
    call write_i32(p, off, 7);

    return;
}

// main zum übersetzen
procedure main() returns (ret:int)
  modifies a_base, H_valid, H_len, H_mem_i32;

implementation main() returns (ret:int)
  modifies a_base, H_valid, H_len, H_mem_i32
{
    var call_ptr:int;    // %call
    var p0:int;          // %0
    var v1:int;          // %1
    var off:int;
    var cmp:bool;

    // %call = call malloc(4)
    call call_ptr := $malloc(4);

    // store ptr %call, ptr @a
    a_base := call_ptr;

    // call void @init()
    call init();

    // %0 = load ptr, ptr @a
    p0 := a_base;

    // %1 = load i32, ptr %0
    off := 0;
    call v1 := read_i32(p0, off);

    // %cmp = icmp eq i32 %1, 7
    cmp := (v1 == 7);

    // br i1 %cmp, label %if.end, label %if.else
    if (!cmp) {
        // if.else: assert fail (hier einfach Assertion)
        assert false;
    }

    // if.end:
    ret := 0;
    return;
}



procedure ULTIMATE.start() 
{
	call init();
	call main();
}