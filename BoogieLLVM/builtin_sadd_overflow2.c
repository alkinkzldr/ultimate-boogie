//#Safe
/*
 * Author: Frank Schüssele (schuessf@informatik.uni-freiburg.de)
 * Date: 2024-07-02
 */

#include <assert.h>

extern short __VERIFIER_nondet_short();

int main() {
    int r;
    int x = __VERIFIER_nondet_short();
    int y = __VERIFIER_nondet_short();
    _Bool overflow = __builtin_sadd_overflow(x, y, &r);
    assert(!overflow);
    assert(r == x + y);
}

