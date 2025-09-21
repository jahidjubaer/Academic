#include <iostream>
#include <fstream>

using namespace std;

int main() {
    // Create an output file stream to write to the file
    ofstream outFile("file.txt");
    if (!outFile) {
        cerr << "Error opening file for writing!" << endl;
        return 1;
    }

    outFile << "Hello, world!" << endl;
    outFile.close();

    // Create an input file stream to read from the file
    ifstream inFile("file.txt");
    if (!inFile) {
        cerr << "Error opening file for reading!" << endl;
        return 1;
    }

    char ch;
    while (inFile.get(ch)) {
        cout << ch; // Output each character
    }
    inFile.close();

    return 0;
}
