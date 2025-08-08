//#Safe
/* 
 * Check if handle escape sequence in char literals and string 
 * literals as defined in C11 6.4.4.4.
 * 
 * 
 * Author: heizmann@informatik.uni-freiburg.de
 * Date: 2018-03-04
 * 
 */

#include <assert.h>

int main(void) {
    // Escape sequences that are defined in 6.4.4.4.3
    // the exact numerical values are implementation defined
    // In Ultimate we use the values that we observed on an
    // x86 Linux machine
    unsigned char cSingleQuote = '\'';
    if (cSingleQuote != 39) {
        assert(0);
    }
    unsigned char cDoubleQuote = '\"';
    if (cDoubleQuote != 34) {
        assert(0);
    }    
    unsigned char cQuestionMark = '\?';
    if (cQuestionMark != 63) {
        assert(0);
    }    
    unsigned char cBackslash = '\\';
    if (cBackslash != 92) {
        assert(0);
    }    
    
    // the semantics of the following is defined in 5.2.2
    // the exact numerical values are implementation defined
    // In Ultimate we use the values that we observed on an
    // x86 Linux machine
    unsigned char cAlert = '\a';
    if (cAlert != 7) {
        assert(0);
    }    
    unsigned char cBackspace = '\b';
    if (cBackspace != 8) {
        assert(0);
    }    
    unsigned char cFormFeed = '\f';
    if (cFormFeed != 12) {
        assert(0);
    }    
    unsigned char cNewLine = '\n';
    if (cNewLine != 10) {
        assert(0);
    }    
    unsigned char cCarrieageReturn = '\r';
    if (cCarrieageReturn != 13) {
        assert(0);
    }    
    unsigned char cHorizontalTab = '\t';
    if (cHorizontalTab != 9) {
        assert(0);
    }    
    unsigned char cVerticalTab = '\v';
    if (cVerticalTab != 11) {
        assert(0);
    }    

    
    // octal-escape-sequence and hexadecimal-escape-sequence
    // numerical value defined in 6.4.4.4
    unsigned char cSomeOctEscSeq = '\30';
    if (cSomeOctEscSeq != 24) {
        assert(0);
    }
    unsigned char cSomeHexEscSeq = '\xFF';
    if (cSomeHexEscSeq != 255) {
        assert(0);
    }    
    
    return 0;
}

