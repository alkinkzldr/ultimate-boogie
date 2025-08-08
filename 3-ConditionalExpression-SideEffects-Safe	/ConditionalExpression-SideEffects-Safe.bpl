procedure foo(a: int, b: int, c: int) returns (ret: int)
{
    var inc: int;
    var cmp: int;
    var inc1: int;
    var inc2: int;
    var y_0: int;
    var z_0: int;
    var cond: int;
    var add: int;
    var cmp3: int;
    var cond15: int;
    var cond16: int;
    var cond17: int;
    var cmp6: int;
    var add13: int;
    var cmp14: int;
    var cmp21: int;
    var cmp26: int;
    var add28: int;
    var cmp29: int;
    var or_cond: int;

entry:
    inc := (a + 1 + 4294967296) % 4294967296;
    cmp := if a == 0 then 1 else 0;
    inc1 := (b + 1 + 4294967296) % 4294967296;
    inc2 := (c + 1 + 4294967296) % 4294967296;

    // select i1 %cmp, i32 %inc1, i32 %b
    if (cmp != 0) {
        y_0 := inc1;
    } else {
        y_0 := b;
    }

    // select i1 %cmp, i32 %c, i32 %inc2
    if (cmp != 0) {
        z_0 := c;
    } else {
        z_0 := inc2;
    }

    // select i1 %cmp, i32 %b, i32 %c
    if (cmp != 0) {
        cond := b;
    } else {
        cond := c;
    }

    add := (a + 1 + 4294967296) % 4294967296;
    cmp3 := if inc == add then 1 else 0;

    if (cmp3 != 0) {
        goto if_end;
    } else {
        // assert_fail: x == a + 1
        assert false;
        return;
    }

if_end:
    cond15 := if a == 0 then 1 else 0;
    if (cond15 != 0) {
        goto cond_true5;
    } else {
        goto cond_true20;
    }

cond_true5:
    cmp6 := if cond == b then 1 else 0;
    if (cmp6 != 0) {
        goto if_end10;
    } else {
        // assert_fail: a == 0 ? n == b : 1
        assert false;
        return;
    }

if_end10:
    cond16 := if a == 0 then 1 else 0;
    if (cond16 != 0) {
        goto cond_true12;
    } else {
        goto cond_true20;
    }

cond_true12:
    add13 := (b + 1 + 4294967296) % 4294967296;
    cmp14 := if y_0 == add13 then 1 else 0;
    if (cmp14 != 0) {
        goto if_end18;
    } else {
        // assert_fail: a == 0 ? y == b + 1 : 1
        assert false;
        return;
    }

if_end18:
    cond17 := if a == 0 then 1 else 0;
    if (cond17 != 0) {
        goto if_end33;
    } else {
        goto cond_true20;
    }

cond_true20:
    cmp21 := if cond == c then 1 else 0;
    if (cmp21 != 0) {
        goto if_end25;
    } else {
        // assert_fail: a != 0 ? n == c : 1
        assert false;
        return;
    }

if_end25:
    cmp26 := if a == 0 then 1 else 0;
    add28 := (c + 1 + 4294967296) % 4294967296;
    cmp29 := if z_0 == add28 then 1 else 0;

    // or_cond = select i1 cmp26, i1 true, i1 cmp29
    if (cmp26 != 0) {
        or_cond := 1;
    } else {
        or_cond := cmp29;
    }
    if (or_cond != 0) {
        goto if_end33;
    } else {
        // assert_fail: a != 0 ? z == c + 1 : 1
        assert false;
        return;
    }

if_end33:
    ret := cond;
    return;
}

procedure main() returns (ret: int){
    var gcall: int;
    var gundef1: int;
    var gundef2: int;
    var gundef3: int;
    
entry:
    
    // einmal oder mehrmals undef??
    havoc gundef1;
    havoc gundef2;
    havoc gundef3;
    call gcall:= foo(gundef1, gundef2, gundef3);
    return;
}