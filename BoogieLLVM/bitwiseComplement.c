//#Safe
/*
  Author: Frank Schüssele (schuessf@informatik.uni-freiburg.de)
  Date: 2022-11-30
*/

#include <assert.h>

int main() {
    int i;
    unsigned int u;

    i = ~(-5);
    i = ~i;
    assert(i == -5);
    
    u = ~(3U);
    u = ~u;
    assert(u == 3);
}

