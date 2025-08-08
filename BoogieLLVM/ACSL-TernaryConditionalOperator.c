//#Safe
// Author: heizmann@informatik.uni-freiburg.de
// Date: 2016-08-19

#include <assert.h>

int main() {
    assert((1 ? 255 : 0) == 255);
    return 0;
}

