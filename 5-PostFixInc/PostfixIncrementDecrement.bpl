procedure main() returns (gret: int)
{
    var ginc: int;
    var gadd: int;
    var gcmp: int;
    var gdec: int;
    var gadd5: int;
    var gcmp6: int;
    var gcmp1: int;
    var gcmp10: int;
    var gprintf_result: int;

entry:
    ginc := (7 + 1) % 4294967296;         // gx++ (8)
    gadd := (7 + 5) % 4294967296;         // 7 + 5 = 12
    gcmp := if gadd == 12 then 1 else 0;
    if (gcmp != 0) {
        goto gif_end;
    } else {
        assert false; // gy == 12
        return;
    }

gif_end:
    gcmp1 := if ginc == 8 then 1 else 0;
    if (gcmp1 != 0) {
        goto gif_end4;
    } else {
        assert false; // gx == 8
        return;
    }

gif_end4:
    gdec := (ginc + (-1) + 4294967296) % 4294967296;    // gx-- (7)
    gadd5 := (ginc + 11 + 4294967296) % 4294967296;     // ginc + 11 = 19
    gcmp6 := if gadd5 == 19 then 1 else 0;
    if (gcmp6 != 0) {
        goto gif_end9;
    } else {
        assert false; // gz == 19
        return;
    }

gif_end9:
    gcmp10 := if gdec == 7 then 1 else 0;
    if (gcmp10 != 0) {
        goto gif_end13;
    } else {
        assert false; // gx == 7
        return;
    }

gif_end13:
    // printf ignorieren
    gret := 0;
    return;
}
