#include <iostream>

using namespace std;

int main() {
    // Allocate memory for 5 integers
    int* ptr = new(nothrow) int[5]; 

    if (ptr == nullptr) {
        cout << "Memory allocation failed" << endl;
        return 1;
    }

    // Initialize the array
    for (int i = 0; i < 5; i++) {
        ptr[i] = i + 1;
    }

    // Display the values
    for (int i = 0; i < 5; i++) {
        cout << ptr[i] << " ";
    }
    cout << endl;

    // Deallocate memory
    delete[] ptr;

    return 0;
}
