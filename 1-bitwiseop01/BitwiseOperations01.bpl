procedure ULTIMATE.init() returns (){
}

procedure main() returns (retval : int){    
    var gand: int;
    var gor: int;
    var gxor: int;
    var gshl: int;
    var gshr: int;
    var gand1: int;
    var gor2: int;
    var gxor3: int;
    var gshl4: int;
    var gshr5: int;
    //var gcall: int;
    var gcmp: int;

    var undef: int;

    call gand := and(undef, 1);
    call gor := or(gand, 1);
    call gxor := xor(gor, 1);
    call gshl := shl(gxor, 1);
    call gshr := shr(gshl, 1);

    //TODO: 
    if (0 != gshr) {
        assert false;
    } 
    return;

}

procedure and(x: int, y: int) returns (result: int){
    var t: int;
    //havoc t;
    if (0 == x || 0 == y) { //Wenn einer der beiden Operanden 0 ist, ist das Ergebnis 0.
        t := 0;
    } else if (x == y) { //Wenn beide Operanden gleich sind, ist das Ergebnis der Operand.
        t := x;
    } else {
        atomic {
            havoc t; //erstmal beliebig, damit wir die Annahmen machen können.
            //die contraints bestimmen, also was t sein darf, damit die Annahmen erfüllt sind.
            assume (((((x < 0 && y >= 0) || t <= x) && //Wenn x negativ und y nicht-negativ, dann alles ok, sonst muss result <= x sein.
            ((x >= 0 && y < 0) || t <= y)) && //Wenn x nicht-negativ und y negativ, dann alles ok, sonst muss result <= y sein.
            ((x < 0 && y < 0) || t >= 0)) &&  //Wenn beide negativ, alles erlaubt. Sonst muss das Ergebnis mindestens 0 sein (Bit-AND zweier positiver Zahlen kann nie negativ werden).
            ((x >= 0 && y >= 0) || t > x + y)) && //Wenn beide positiv, egal. Sonst muss das Ergebnis größer als die Summe von x und y sein (sehr schwache Approximation von "keine falschen Werte").
            t >= -2147483648; // t darf nie weniger als i32 min sein (aber idk vllt sollte man das ändern für i64 usw.)
        }
    }
    result := t;
}

procedure or(x: int, y: int) returns (result: int){
    var t: int;
    //havoc t;
    if (0 == x || x == y) { //Wenn einer der beiden Operanden 0 ist oder beide gleich sind, ist das Ergebnis der andere Operand.
        t := y;
    } else if (0 == y) {
        t := x; // Wenn y 0 ist, ist das Ergebnis x.
    } else {
        atomic {
            havoc t; 
            assume (((((x < 0 && y >= 0) || t >= y) && //Wenn x negativ und y nicht-negativ, dann alles ok, sonst muss result >= y sein.
            ((x >= 0 && y < 0) || t >= x)) && //Wenn x nicht-negativ und y negativ, dann alles ok, sonst muss result >= x sein.
            ((x < 0 || y < 0) || t <= x + y)) && //Wenn beide negativ, alles erlaubt. Sonst muss das Ergebnis höchstens die Summe von x und y sein (Bit-OR zweier positiver Zahlen kann nie größer werden).
            ((x >= 0 && y >= 0) || t < 0)) && //Wenn beide positiv, egal.
            t <= 2147483647;
        }
    }
    result := t;
}

procedure xor(x: int, y: int) returns (result: int){
    var t: int;
    //havoc t; //bin mir nicht ganz sicher
    if (0 == x) {
        t := y; // Wenn x 0 ist, ist das Ergebnis y.
    } else if (0 == y) {
        t := x; // Wenn y 0 ist, ist das Ergebnis x.
    } else {
        atomic {
            havoc t; 
            assume (((((((x < 0 && y < 0) || t > 0) && //Wenn x negativ und y nicht-negativ, dann alles ok, sonst muss result >= y sein.
            ((x > 0 && y > 0) || t > 0)) && //Wenn x nicht-negativ und y negativ, dann alles ok, sonst muss result >= x sein.
            ((x < 0 || y >= 0) || t < 0)) && //Wenn x negativ und y nicht-negativ, dann alles ok, sonst muss result < 0 sein.
            ((x >= 0 || y < 0) || t < 0)) && //Wenn x nicht-negativ und y negativ, dann alles ok, sonst muss result < 0 sein.
            ((x < 0 || y < 0) || t <= x + y)) && //Wenn beide negativ, alles erlaubt. Sonst muss das Ergebnis höchstens die Summe von x und y sein (Bit-XOR zweier positiver Zahlen kann nie größer werden).
            t >= -2147483648) && 
            t <= 2147483647; 
        }
    }
    result := t; 
}

procedure shl(x: int, y: int) returns (result:int) {
    var t : int;
    //havoc t;
    if (0 == x || 0 == y) { //Wenn einer der beiden Operanden 0 ist, ist das Ergebnis 0.
        t := x;
    } else {
        atomic {
            havoc t; 
            assume t > x;
        }
    }
    result := t;
}

procedure shr(x: int, y: int) returns (result:int) {
    var t: int;
    //havoc t;
    if (0 == x || 0 == y) { //Wenn einer der beiden Operanden 0 ist, ist das Ergebnis x.
        t := x;
    } else {
        atomic {
            havoc t; 
            assume t < x;
        }
    }
    result := t;
}