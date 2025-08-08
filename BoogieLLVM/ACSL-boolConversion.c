//#Safe
/*
 * Date: 2024-12-16
 * Author: schuessf@informatik.uni-freiburg.de
 *
 * Show that the boolean conversion for ACSL is
 * performed properly for asserts and loop invariants
 */

#include <assert.h>

extern int __VERIFIER_nondet_int();

int main() {
    int x = 2;
    // loop invariant: 1
    while (__VERIFIER_nondet_int());
    assert(x);
}

