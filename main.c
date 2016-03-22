
#include "linkage.h"

int main( void )
{
    printf("This is a simple Makefile!\n\n");

    func_extern();

    printf("Variable 'var_extern' has external linkage, its value is %d!\n", var_extern);

    return 0;
}
