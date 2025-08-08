//#Safe
/* 
 *Although integer character constants have type 'int', C11 says in
 * 6.4.4.4.10 that the values for single byte characters have to be in the
 * value of 'char'. This means that (as explained in C11 6.4.4.4.13) if char
 * is equivalent to unsigned char then \xFF has the value 255 and if char is
 * equivalent to signed char then \xFF has the value -1.
 * 
 * Author: heizmann@informatik.uni-freiburg.de
 * Date: 2018-03-04
 * 
 */

#include <assert.h>

int main(void) {
    int cSomeHexEscSeq = '\xFF';
    if (cSomeHexEscSeq != -1) {
        assert(0);
    }    
    return 0;
}

