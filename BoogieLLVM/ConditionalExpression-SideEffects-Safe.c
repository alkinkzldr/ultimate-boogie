//#Safe
// Author: heizmann@informatik.uni-freiburg.de
// Date: 27.2.2013

#include <assert.h>

int foo(int a, int b, int c) {
    int x = a;
    int y = b;
    int z = c;
    int n = (x++ == 0) ? y++ : z++;
    assert(x == a + 1);
    assert(a == 0 ? n == b : 1);
    assert(a == 0 ? y == b + 1 : 1);
    assert(a != 0 ? n == c : 1);
    assert(a != 0 ? z == c + 1 : 1);
    return n;
}

int main() {
    int a, b, c;
    int res = foo(a, b, c);
    return 0;
}

