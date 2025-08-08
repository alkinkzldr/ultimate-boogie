implementation ULTIMATE.init() returns (){
}

implementation ULTIMATE.start() returns (){
    var #t~ret3 : int;

    call ULTIMATE.init();
    call #t~ret3 := main();
}

implementation main() returns (#res : int){
    var #t~post0 : int;
    var #t~post1 : int;
    var #t~short2 : bool;
    var ~x~0 : int;
    var ~y~0 : int;

    ~x~0 := 1;
    ~y~0 := 1;
    #t~post0 := ~x~0;
    ~x~0 := 1 + #t~post0;
    #t~short2 := 0 != #t~post0;
    if (#t~short2) {
    } else {
        #t~post1 := ~y~0;
        ~y~0 := 1 + #t~post1;
        #t~short2 := 0 == #t~post1;
    }
    assert 2 == ~y~0;
    havoc #t~post0;
    havoc #t~post1;
    havoc #t~short2;
}

type $Pointer$ = { base : int, offset : int };
procedure main() returns (#res : int);
modifies ;

procedure ULTIMATE.init() returns ();
modifies ;

procedure ULTIMATE.start() returns ();
modifies ;

