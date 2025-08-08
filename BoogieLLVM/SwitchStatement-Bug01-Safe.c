//#Safe
// Author: heizmann@informatik.uni-freiburg.de
// Date: 2015-03-14
// Bug in CACSL2Boogie translation in revision 13768.
// The assignment x = 2; is executed before(!) the switch statement.
//

#include <assert.h>

int main() {
    int x = 1;
    int a = 5;
    switch(a) {
        case 0: {
            x = 2;
        }
        break;
        case 1: {
            x = 23;
        }
        break;
    }
    assert(x == 1);
}

