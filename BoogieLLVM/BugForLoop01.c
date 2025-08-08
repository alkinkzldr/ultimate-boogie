//#Unsafe
// Author: heizmann@informatik.uni-freiburg.de
// Date: 2015-11-22

#include <assert.h>

int main() {
    for (;;1) {
        assert(0);
        break;
    }
    return 0;
}

