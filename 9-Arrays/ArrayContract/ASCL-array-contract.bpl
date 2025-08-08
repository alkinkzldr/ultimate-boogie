implementation ULTIMATE.init() returns (){
    assume 0 == #valid[0];
    assume 0 < #StackHeapBarrier;
    ~a~0 := { base: 0, offset: 0 };
}

implementation ULTIMATE.start() returns (){
    var #t~ret2 : int;

    call ULTIMATE.init();
    call #t~ret2 := main();
}

implementation init() returns (){
    call write~int(7, { base: ~a~0!base, offset: ~a~0!offset }, 4);
}

implementation main() returns (#res : int){
    var #t~malloc0 : $Pointer$;
    var #t~mem1 : int;

    call #t~malloc0 := #Ultimate.allocOnHeap(4);
    ~a~0 := #t~malloc0;
    havoc #t~malloc0;
    call init();
    call #t~mem1 := read~int(~a~0, 4);
    assume 7 == #t~mem1;
    havoc #t~mem1;
}

var ~a~0 : $Pointer$;

var #valid : [int]int;

var #length : [int]int;

var #memory_int : [$Pointer$]int;

var #StackHeapBarrier : int;

type $Pointer$ = { base : int, offset : int };
procedure init() returns ();
ensures 7 == #memory_int[{ base: ~a~0!base, offset: ~a~0!offset }];
modifies #memory_int;

procedure write~int(#value : int, #ptr : $Pointer$, #sizeOfWrittenType : int) returns ();
requires 1 == #valid[#ptr!base];
requires #sizeOfWrittenType + #ptr!offset <= #length[#ptr!base] && 0 <= #ptr!offset;
ensures #memory_int == old(#memory_int)[#ptr := #value];
modifies #memory_int;

procedure main() returns (#res : int);
modifies ~a~0, #valid, #length, #memory_int;

procedure #Ultimate.allocOnHeap(~size : int) returns (#res : $Pointer$);
ensures 0 == old(#valid)[#res!base];
ensures #valid == old(#valid)[#res!base := 1];
ensures 0 == #res!offset;
ensures 0 != #res!base;
ensures #res!base < #StackHeapBarrier;
ensures #length == old(#length)[#res!base := ~size];
modifies #valid, #length;

procedure read~int(#ptr : $Pointer$, #sizeOfReadType : int) returns (#value : int);
requires 1 == #valid[#ptr!base];
requires #sizeOfReadType + #ptr!offset <= #length[#ptr!base] && 0 <= #ptr!offset;
ensures #value == #memory_int[#ptr];
modifies ;

procedure ULTIMATE.init() returns ();
modifies ~a~0;

procedure ULTIMATE.start() returns ();
modifies ~a~0, #valid, #length, #memory_int;

procedure ULTIMATE.dealloc(~addr : $Pointer$) returns ();
free ensures #valid == old(#valid)[~addr!base := 0];
modifies #valid;

