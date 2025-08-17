#include <stdio.h>

int main() {
    
    int id1, id2;
    printf("Enter two integers: ");
    scanf("%d %d", &id1, &id2);
    int mul = id1 * id2;
    printf("The product of %d and %d is %d\n", id1, id2, mul);

    return 0;
}