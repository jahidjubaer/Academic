#include<stdio.h>

int main() {
    int id1, id2;
    printf("Enter two integers: ");
    scanf("%d %d", &id1, &id2);
    float div = (float)id1 / id2;
    printf("The division of %d and %d is %f\n", id1, id2, div);

    return 0;
}