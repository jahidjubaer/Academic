#include<stdio.h>

int main()
{
    int n;
    printf("Enter the number of terms in the Fibonacci series: ");
    scanf("%d", &n);
    int a=0, b=1, c;
    printf("%d %d ", a, b);
    for(int i=2; i<n; i++)
    {
        c = a + b;
        printf("%d ", c);
        a = b;
        b = c;
    }
    printf("\n");
    return 0;
}