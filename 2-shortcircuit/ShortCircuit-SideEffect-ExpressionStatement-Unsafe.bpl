procedure main() returns (ret: int)
{
    var inc: int;
    var cmp: int;
    var cmp2: int;
    var spec_select: int;
    var lor_ext: int;

entry:
    inc := 1 + 1;
    cmp := if 1 != 0 then 1 else 0;
    cmp2 := if 1 == 0 then 1 else 0;

    // select i1 %cmp, i1 true, i1 %cmp2
    if (cmp != 0) {
        spec_select := 1; // true
    } else {
        spec_select := cmp2;
    }

    //option 2
    //spec_select := if cmp != 0 then 1 else cmp2; // i1 %spec.select

    // zext i1 %spec.select to i32
    lor_ext := spec_select;  // i1 → i32: In Boogie alles int, Werte 0/1 bleiben 0/1

    return;
}

// oder 2. option die spec_select als bool nehmen und zext anders machen
// ich empfehle aber 1. option, auch wenn wir i32, i64 usw. mit havoc assume begrenzen auf integer max...
