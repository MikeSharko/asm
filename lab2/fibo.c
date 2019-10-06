#include <stdio.h>
#include <stdlib.h>



int main()
{
    int last =1;
    int last1 = 0;
    int n;
    int fibo = 0;
    printf ("Enter Fibonacci term: n\ ");
    scanf("%d", &n);

     for (int i=0; i<n; i++) {
     last1 = last;
     last = fibo;
     fibo = last + last1;
     printf ("%d \n", fibo);
    }
    printf ("The %dth Fibonacci number is: %d", n, fibo);


    return 0;
}
