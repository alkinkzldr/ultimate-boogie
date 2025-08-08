// #Safe
/*
 * Date: 2025-02-12
 * Author: schuessf@informatik.uni-freiburg.de
 */

#include <assert.h>
#include <stdlib.h>

int main() {
    int* p = malloc(sizeof(int));
    assert(p != NULL);
}

