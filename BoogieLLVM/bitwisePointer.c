//#Safe
/*
  Author: Frank Schüssele (schuessf@informatik.uni-freiburg.de)
  Date: 2022-11-30
*/

#include <assert.h>

int main() {
    int r, x, y;
    int* p = &r;
    if (y < 0) return;
    *p = x & y;
    assert(r >= 0);
}

