#include <stdio.h>
#include <stdlib.h>
#include "simpio.h"
#include "strlib.h"

int main()
{
    printf("Enter a your name\n");

    char *sentence = getLine();

    printf("Hello %s, I will hope you have fun, while coding :-)\n", sentence);

    return 0;
}
