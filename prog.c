/* 
 * Rohit Kumar Saxena AIDS-B (G1)
 * 
 * write a program to find sum of n natural number using for loop
 * WAP to find factorial of a number using for loop
 * WAP to print 10 natural number in reverse
 * print odd number upto 10
 * print even number upto 10
 * find sum of digits of a five digit number without using for loop (h/w)
 * find the reverse of a five digit number without loop
 */

/* // 1
#include <stdio.h>
int main(){
	int sum, n, i;
	sum =0;
	printf("Enter the n number to get sum of n natural number");
	scanf("%d", &n);
	for(i=1; i<=n; i++) {
		sum = sum + i;
	}
	printf("Sum of %d natural number = %d", n, sum);
	return 0;
}
*/

/* // 2
#include <stdio.h>
int main(){
	int fact, n, i;
	fact = 1;
	printf("Enter the number to get factorial of : ");
	scanf("%d", &n);
	for(i=1; i<=n; i++) {
		fact= fact *i;
	}
	printf("factorial of %d = %d", n, fact);
	return 0;
}
*/

/* // 3
#include <stdio.h>
int main(){
	int n, i;
	scanf("%d", &n);
	for(i=n; i>=1; i--) {
		printf("%d\n", i);
	}
	return 0;
}
*/ 

/* // 4
#include <stdio.h>
int main(){
	int i;
	printf("Odd number up to 10 : ");
	for(i=1; i<=10; i+=2) {
		printf("%d\n", i);
	}
	return 0;
}
*/

/* // 5
#include <stdio.h>
int main(){
	int i;
	printf("Even number up to 10 : ");
	for(i=2; i<=10; i+=2) {
		printf("%d\n", i);
	}
	return 0;
}
*/

#include <stdio.h>
int main(){
	int num, rnum;
	
	printf("Enter 5 Digit Number : "); 	
	scanf("%d",  &num);
	int a,b,c,d,e;
	
	a = num / 10000;
	num = num % 10000;
	b = num / 1000;
	num = num % 1000;
	c = num / 100;
	num = num % 100;
	d = num / 10;
	num = num % 10;
	e = num;
	rnum = (e*10000) + (d*1000) + (c*100) + (b*10) + (a*1);
	
	printf("Sum = %d\n Reverse =  %d", a+b+c+d+e, rnum);
	
	return 0;
}


/* // multiple of 5
#include <stdio.h>
int main(){
	int i, n;
	printf("Enter the number to get multiple of : ");
	scanf("%d", &n);
	for(i=1; i<=5; i++) {
		printf("%d x %d =  %d\n", n, i, n*i);
	}
	return 0;
}
*/


