#include <bits/stdc++.h>

using namespace std;

const int MAX_SIZE = 100; // Maximum number of data points

// Function to construct the divided difference table
void dividedDifferenceTable(double x[], double y[], double table[][MAX_SIZE], int n) {
    for (int i = 0; i < n; i++) {
        table[i][0] = y[i];  // First column is y values
    }

    for (int j = 1; j < n; j++) {
        for (int i = 0; i < n - j; i++) {
            table[i][j] = (table[i + 1][j - 1] - table[i][j - 1]) / (x[i + j] - x[i]);
        }
    }
}

// Function to evaluate Newton's Interpolation Polynomial
double newtonInterpolation(double x[], double table[][MAX_SIZE], double value, int n) {
    double result = table[0][0]; // First term of the polynomial

    for (int i = 1; i < n; i++) {
        double term = table[0][i]; // Coefficient from divided difference table
        for (int j = 0; j < i; j++) {
            term *= (value - x[j]); // Multiply by (x - x_0), (x - x_1), ...
        }
        result += term; // Add term to final result
    }

    return result;
}

int main() {
    int n;
    double x[MAX_SIZE], y[MAX_SIZE], table[MAX_SIZE][MAX_SIZE];

    cout << "Enter number of data points: ";
    cin >> n;

    cout << "Enter x and y values:\n";
    for (int i = 0; i < n; i++) {
        cin >> x[i] >> y[i];
    }

    // Construct divided difference table
    dividedDifferenceTable(x, y, table, n);

    double value;
    cout << "Enter the value to interpolate: ";
    cin >> value;

    // Compute interpolated value
    double result = newtonInterpolation(x, table, value, n);
    cout << "Interpolated value at " << value << " is: " << fixed << setprecision(3) << result << endl;

    return 0;
}
