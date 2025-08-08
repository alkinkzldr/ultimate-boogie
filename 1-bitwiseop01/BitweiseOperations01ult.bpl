implementation ULTIMATE.init() returns (){
}

implementation ULTIMATE.start() returns (){
    var #t~ret11 : int;

    call ULTIMATE.init();
    call #t~ret11 := main();
}

implementation main() returns (#res : int){
    var #t~bitwise0 : int; //and
    var #t~bitwise1 : int; //or
    var #t~bitwise2 : int; //xor
    var #t~bitwise3 : int; //shl
    var #t~bitwise4 : int; //shr
    var #t~bitwise5 : int; //and1
    var #t~bitwise6 : int; //or2
    var #t~bitwise7 : int; //xor3
    var #t~bitwise8 : int; //shl4
    var #t~bitwise9 : int; //shr5
    var #t~ret10 : int; //call
    var ~x~0 : int;
    var ~y~0 : int;
    var ~z~0 : int;

    havoc ~x~0;
    havoc ~y~0;
    havoc ~z~0;
    ~y~0 := 1;
    ~z~0 := 2;
    if (0 == ~x~0 || 0 == ~y~0) { //and
        #t~bitwise0 := 0;
    } else if (~x~0 == ~y~0) {
        #t~bitwise0 := ~x~0;
    } else {
        atomic {
            havoc #t~bitwise0;
            assume (((((~x~0 < 0 && ~y~0 >= 0) || #t~bitwise0 <= ~x~0) &&  //
            ((~x~0 >= 0 && ~y~0 < 0) || #t~bitwise0 <= ~y~0)) && 
            ((~x~0 < 0 && ~y~0 < 0) || #t~bitwise0 >= 0)) && 
            ((~x~0 >= 0 && ~y~0 >= 0) || #t~bitwise0 > ~x~0 + ~y~0)) && 
            #t~bitwise0 >= -2147483648;
        }
    }
    ~x~0 := #t~bitwise0;
    havoc #t~bitwise0;
    if (0 == ~x~0 || ~x~0 == ~y~0) { //or
        #t~bitwise1 := ~y~0;
    } else if (0 == ~y~0) {
        #t~bitwise1 := ~x~0;
    } else {
        atomic {
            havoc #t~bitwise1;
            assume (((((~x~0 < 0 && ~y~0 >= 0) || #t~bitwise1 >= ~y~0) && 
            ((~x~0 >= 0 && ~y~0 < 0) || #t~bitwise1 >= ~x~0)) && 
            ((~x~0 < 0 || ~y~0 < 0) || #t~bitwise1 <= ~x~0 + ~y~0)) && 
            ((~x~0 >= 0 && ~y~0 >= 0) || #t~bitwise1 < 0)) && 
            #t~bitwise1 <= 2147483647;
        }
    }
    ~x~0 := #t~bitwise1;
    havoc #t~bitwise1;
    if (0 == ~x~0) { //xor
        #t~bitwise2 := ~y~0;
    } else if (0 == ~y~0) {
        #t~bitwise2 := ~x~0;
    } else if (~x~0 == ~y~0) {
        #t~bitwise2 := 0;
    } else {
        atomic {
            havoc #t~bitwise2;
            assume (((((((~x~0 < 0 || ~y~0 < 0) || #t~bitwise2 > 0) && 
            ((~x~0 > 0 || ~y~0 > 0) || #t~bitwise2 > 0)) && 
            ((~x~0 < 0 || ~y~0 >= 0) || #t~bitwise2 < 0)) && 
            ((~x~0 >= 0 || ~y~0 < 0) || #t~bitwise2 < 0)) &&
            ((~x~0 < 0 || ~y~0 < 0) || #t~bitwise2 <= ~x~0 + ~y~0)) && 
            #t~bitwise2 >= -2147483648) && 
            #t~bitwise2 <= 2147483647;
        }
    }
    ~x~0 := #t~bitwise2;
    havoc #t~bitwise2; 
    if (0 == ~x~0 || 0 == ~y~0) { //shl
        #t~bitwise3 := ~x~0;
    } else {
        atomic {
            havoc #t~bitwise3;
            assume #t~bitwise3 > ~x~0;
        }
    }
    ~x~0 := #t~bitwise3;
    havoc #t~bitwise3;
    if (0 == ~x~0 || 0 == ~y~0) { //shr
        #t~bitwise4 := ~x~0;
    } else {
        atomic {
            havoc #t~bitwise4;
            assume #t~bitwise4 < ~x~0;
        }
    }
    ~x~0 := #t~bitwise4;
    havoc #t~bitwise4;
    if (0 == ~x~0 || 0 == ~y~0) {
        #t~bitwise5 := 0;
    } else if (~x~0 == ~y~0) {
        #t~bitwise5 := ~x~0;
    } else {
        atomic {
            havoc #t~bitwise5;
            assume (((((~x~0 < 0 && ~y~0 >= 0) || #t~bitwise5 <= ~x~0) && ((~x~0 >= 0 && ~y~0 < 0) || #t~bitwise5 <= ~y~0)) && ((~x~0 < 0 && ~y~0 < 0) || #t~bitwise5 >= 0)) && ((~x~0 >= 0 && ~y~0 >= 0) || #t~bitwise5 > ~x~0 + ~y~0)) && #t~bitwise5 >= -2147483648;
        }
    }
    ~x~0 := #t~bitwise5;
    havoc #t~bitwise5;
    if (0 == ~x~0 || ~x~0 == ~y~0) {
        #t~bitwise6 := ~y~0;
    } else if (0 == ~y~0) {
        #t~bitwise6 := ~x~0;
    } else {
        atomic {
            havoc #t~bitwise6;
            assume (((((~x~0 < 0 && ~y~0 >= 0) || #t~bitwise6 >= ~y~0) && ((~x~0 >= 0 && ~y~0 < 0) || #t~bitwise6 >= ~x~0)) && ((~x~0 < 0 || ~y~0 < 0) || #t~bitwise6 <= ~x~0 + ~y~0)) && ((~x~0 >= 0 && ~y~0 >= 0) || #t~bitwise6 < 0)) && #t~bitwise6 <= 2147483647;
        }
    }
    ~x~0 := #t~bitwise6;
    havoc #t~bitwise6;
    if (0 == ~x~0) {
        #t~bitwise7 := ~y~0;
    } else if (0 == ~y~0) {
        #t~bitwise7 := ~x~0;
    } else if (~x~0 == ~y~0) {
        #t~bitwise7 := 0;
    } else {
        atomic {
            havoc #t~bitwise7;
            assume (((((((~x~0 < 0 || ~y~0 < 0) || #t~bitwise7 > 0) && ((~x~0 > 0 || ~y~0 > 0) || #t~bitwise7 > 0)) && ((~x~0 < 0 || ~y~0 >= 0) || #t~bitwise7 < 0)) && ((~x~0 >= 0 || ~y~0 < 0) || #t~bitwise7 < 0)) && ((~x~0 < 0 || ~y~0 < 0) || #t~bitwise7 <= ~x~0 + ~y~0)) && #t~bitwise7 >= -2147483648) && #t~bitwise7 <= 2147483647;
        }
    }
    ~x~0 := #t~bitwise7;
    havoc #t~bitwise7;
    if (0 == ~x~0 || 0 == ~y~0) {
        #t~bitwise8 := ~x~0;
    } else {
        atomic {
            havoc #t~bitwise8;
            assume #t~bitwise8 > ~x~0;
        }
    }
    ~x~0 := #t~bitwise8;
    havoc #t~bitwise8;
    if (0 == ~x~0 || 0 == ~y~0) {
        #t~bitwise9 := ~x~0;
    } else {
        atomic {
            havoc #t~bitwise9;
            assume #t~bitwise9 < ~x~0;
        }
    }
    ~x~0 := #t~bitwise9;
    havoc #t~bitwise9;
    havoc #t~ret10;
    havoc #t~ret10;
    if (0 != ~x~0) {
        assert false;
    }
}

type $Pointer$ = { base : int, offset : int };
procedure main() returns (#res : int);
modifies ;

procedure ULTIMATE.init() returns ();
modifies ;

procedure ULTIMATE.start() returns ();
modifies ;

