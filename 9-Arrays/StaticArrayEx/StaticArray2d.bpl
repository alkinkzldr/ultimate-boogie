var arr2D : [int,int]int;

procedure main2D() returns (ret:int)
  modifies arr2D;

implementation main2D() returns (ret:int)
  modifies arr2D
{
  var r, c, x, y, a00, a01, a10, a11, sum: int;

  // Dimensionen (direkt konstant benutzt: ROWS=2, COLS=2)
  // Init: [[1,2],[3,4]]
  assert 0 >= 0; assert 0 < 2; assert 0 >= 0; assert 0 < 2; arr2D := arr2D[0,0 := 1];
  assert 0 >= 0; assert 0 < 2; assert 1 >= 0; assert 1 < 2; arr2D := arr2D[0,1 := 2];
  assert 1 >= 0; assert 1 < 2; assert 0 >= 0; assert 0 < 2; arr2D := arr2D[1,0 := 3];
  assert 1 >= 0; assert 1 < 2; assert 1 >= 0; assert 1 < 2; arr2D := arr2D[1,1 := 4];

  // Lesen
  assert 0 >= 0; assert 0 < 2; assert 0 >= 0; assert 0 < 2; a00 := arr2D[0,0];
  assert 0 >= 0; assert 0 < 2; assert 1 >= 0; assert 1 < 2; a01 := arr2D[0,1];
  assert 1 >= 0; assert 1 < 2; assert 0 >= 0; assert 0 < 2; a10 := arr2D[1,0];
  assert 1 >= 0; assert 1 < 2; assert 1 >= 0; assert 1 < 2; a11 := arr2D[1,1];

  // Schreiben: arr2D[0,1] = 42
  r := 0; c := 1; x := 42;
  assert r >= 0; assert r < 2; assert c >= 0; assert c < 2;
  arr2D := arr2D[r, c := x];

  // Summe bilden (mit erneuten Bounds-Checks)
  assert 0 >= 0; assert 0 < 2; assert 0 >= 0; assert 0 < 2; a00 := arr2D[0,0];
  assert 0 >= 0; assert 0 < 2; assert 1 >= 0; assert 1 < 2; a01 := arr2D[0,1];
  assert 1 >= 0; assert 1 < 2; assert 0 >= 0; assert 0 < 2; a10 := arr2D[1,0];
  assert 1 >= 0; assert 1 < 2; assert 1 >= 0; assert 1 < 2; a11 := arr2D[1,1];

  sum := a00 + a01 + a10 + a11;

  // Sanity
  assert a01 == 42;
  assert sum == 1 + 42 + 3 + 4;

  ret := 0;
  return;
}
