//#Safe
/*
  Author: Frank Schüssele (schuessf@informatik.uni-freiburg.de)
  Date: 2022-11-29
*/

#include <assert.h>

int main() {
    int r, x, y;

    if (x < 0 || y < 0) return;
    r = (x & y) - 1;
    assert(r < x && r < y);
}

