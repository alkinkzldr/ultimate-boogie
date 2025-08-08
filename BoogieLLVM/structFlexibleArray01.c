// #Safe
/*
 * Date: 2023-11-14
 * Author: schuessf@informatik.uni-freiburg.de
 */

#include <assert.h>

struct str {
    int n;
    int d[];
};

int main() {
    struct str s = { 42 };
    int res = s.n;
    assert(res == 42);
}

