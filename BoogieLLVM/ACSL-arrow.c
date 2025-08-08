// #Safe
/*
 * Date: 2024-01-29
 * Author: schuessf@informatik.uni-freiburg.de
 *
 */

#include <assert.h>

struct str {
    int x;
};

int main() {
    struct str s = { 5 };
    struct str *p = &s;
    assert(p->x == 5);
}

