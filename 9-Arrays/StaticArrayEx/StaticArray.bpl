// @StaticArray.ll to @StaticArray.bpl

const #ARR_DIM: int;
axiom #ARR_DIM == 4;

procedure main() returns (ret:int) {
    var #arr: [int]int; //eigentlich global definieren
    
    var #p0: int;
    var #v0: int;
    var #p1: int;
    var #p2: int;
    var #v2: int;
    var #p3: int;
    var #v3: int;

    var #t1: int;
    
    // initialisiere die array (bin mir nicht sicher, ob das hier initialisiert werden muss oder oben wie globale)
    // wichtig ist: hier kontrollieren wir die index > 0 und index < array_länge
    assert 0 >= 0; assert 0 < #ARR_DIM; #arr := #arr[0 := 1];
    assert 1 >= 0; assert 1 < #ARR_DIM; #arr := #arr[1 := 2];
    assert 2 >= 0; assert 2 < #ARR_DIM; #arr := #arr[2 := 3];
    assert 3 >= 0; assert 3 < #ARR_DIM; #arr := #arr[3 := 4];

    //arr[0] lesen
    assert 0 >= 0; assert 0 < #ARR_DIM; #p0 := #arr[0];
    #v0 := #p0;

    //arr[1] schreiben mit 42
    #p1 := 1; //welche stelle wir schreiben wollen
    assert #p1 >= 0; assert #p1 < #ARR_DIM;
    #arr := #arr[#p1 := 42]; // hier schreiben wir 42 an die stelle 1

    #t1 := #arr[1]; // hier lesen wir die stelle 1, die wir gerade geschrieben haben


    //arr[2] lesen
    assert 2 >= 0; assert 2 < #ARR_DIM; #p2 := #arr[2];
    #v2 := #p2;

    //testen 
    assert #v2 == 3; // hier testen wir, ob der wert an der stelle 2 immer noch 3 ist
    assert #v0 == 1; // hier testen wir, ob der wert an der
    assert #t1 == 42; // hier testen wir, ob der wert an der stelle 1 jetzt 42 ist

}