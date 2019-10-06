#include <stdio.h>

int main(){
int num1 = 5, num2 = 10, sum;
sum = num1+num2;
printf("The sum is %d\n", sum);
printf("The multiplication is %d\n", mult(num1,num2));
return 0;
}

int mult(arg1,arg2) {
return arg1*arg2;
}
