// #Safe
/*
 * Date: 2024-01-29
 * Author: schuessf@informatik.uni-freiburg.de
 *
 */
#include <assert.h>

int main() {
    int x;
    int *p = &x;
    assert(p == &x);
}

