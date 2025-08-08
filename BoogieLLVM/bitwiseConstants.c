//#Safe
/*
  Author: Frank Schüssele (schuessf@informatik.uni-freiburg.de)
  Date: 2022-11-29
*/

#include <assert.h>

int main() {
    int r;

    r = 2 & 3;
    assert(r == 2);
}

