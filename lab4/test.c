#include <stdio.h>
extern int sum (int x, y);

 
int main()
{
int a= 5;
int b = 7;
int c = 0;
printf ("Programm will sum two numbers");

c = sum(5,7);
printf("the result is: %d", c); 
 return 0;
}
