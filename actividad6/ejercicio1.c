#include <stdio.h>
#include <unistd.h>

int main ()
{
    /* fork a child process */
    fork();

    /* fork another child proess */
    fork();

    /* and fork another */
    fork();

    return 0;
}