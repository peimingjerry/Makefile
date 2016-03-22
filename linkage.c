
#include "linkage.h"

static int var_static = 0;
int var_extern = 1;

static void func_static( void )
{
    printf("\tFunction 'func_static' has internal linkage!\n");
}

void func_extern( void )
{
    printf("Function 'func_extern' has extern linkage!\n");
    func_static();
    printf("\tVariable 'var_static' has internal linkage, its value is %d!\n", var_static);
}

