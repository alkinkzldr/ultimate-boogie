procedure main() {
    var divident: int;
    var divRes: int;
    var sdivRes: int;
    var modRes: int;
    var smodRes: int;
    var ginput1: int;
    var ginput2: int;
    var guinput1: int;
    var guinput2: int;

    entry:

    havoc ginput1;
    assume ginput1 >= 0;
    assume ginput1 < 256; // 2^N, N = 8

    havoc ginput2;
    assume ginput2 >= 0;
    assume ginput2 < 256; // 2^N, N = 8
    
    //sdiv + +
    ginput1 := 32; // Beispielwert
    ginput2 := 13;  // Beispielwert
    
    divRes := ginput1 / ginput2; // 32 / 13 = 2 in Boogie und 32 / 13 = 2 in C
    modRes := ginput1 % ginput2; // 32 % 13 = 6 in Boogie und 32 % 13 = 6 in C
    assert divRes == 2; // 32 / 13 = 2 in C
    assert modRes == 6; // 32 % 13 = 6 in C
    // also man muss nichts machen

    //-------------------------------------------------------------------
    //sdiv + -
    ginput1 := 32; // Beispielwert
    ginput2 := -13;  // Beispielwert
    gUinput1 := ginput1; // Umwandlung in unsigned - positiv
    gUinput2 := ginput2 - 256; // Umwandlung in unsigned - negativ

    sdivRes := gUinput1 / gUinput2;
    if (gUinput1 % gUinput2 != 0) {
        sdivRes := sdivRes + 1; // Ergebnis muss wieder +1
    }
    divRes := sdivRes % 256; // 2^N, N = 8
    assert divRes == 3; // 32 / -13 = 3 in C
    //-------------------------------------------------------------------
    //sdiv - +
    ginput1 := -32; // Beispielwert
    ginput2 := 13;  // Beispielwert
    gUinput1 := (ginput1 % 256) + 256; // Umwandlung in unsigned
    gUinput2 := ginput2; // Umwandlung in unsigned - positiv

    sdivRes := gUinput1 / gUinput2;
    if (gUinput1 % gUinput2 != 0) {
        sdivRes := sdivRes + 1; // Ergebnis muss wieder +1
    }
    divRes := sdivRes % 256; // 2^N, N = 8
    assert divRes == 3; // 32 / -13 = 3 in C
    //-------------------------------------------------------------------
    //sdiv - -
    ginput1 := -32; // Beispielwert
    ginput2 := -13;  // Beispielwert
    gUinput1 := ginput1 - 256; // Umwandlung in unsigned
    gUinput2 := ginput2 - 256; // Umwandlung in unsigned

    sdivRes := gUinput1 / gUinput2;
    if (gUinput1 % gUinput2 != 0) {








}
