// #Safe
/*
 * Date: 2025-01-07
 * Author: schuessf@informatik.uni-freiburg.de
 *
 */

#include <assert.h>

int main() {
    unsigned x = 7;
    // assert: For all int x, (long long)x + 1 > x;
    assert(x == 7);
}

