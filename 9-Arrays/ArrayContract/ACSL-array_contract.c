// #Safe
/*
 * Date: 2025-01-07
 * Author: schuessf@informatik.uni-freiburg.de
 *
 */

#include <assert.h>
#include <stdlib.h>

int* a;

//@ ensures a[0] == 7;
void init() {
    a[0] = 7;
}

int main() {
    a = malloc(sizeof(int));
    init();
    assert(*a == 7);
}

