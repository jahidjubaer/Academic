#include <iostream>
#include <cstring>
using namespace std;

// Function to check if a process can be allocated resources
bool canAllocate(int need[], int available[], int numResources) {
    for (int i = 0; i < numResources; i++) {
        if (need[i] > available[i]) return false;
    }
    return true;
}

// Function to check if the system is in a safe state
bool isSafeState(int max[][10], int allocation[][10], int available[], int numProcesses, int numResources, int safeSequence[]) {
    int need[10][10];
    bool finish[10] = {false};
    int work[10];

    // Calculate the Need matrix
    for (int i = 0; i < numProcesses; i++) {
        for (int j = 0; j < numResources; j++) {
            need[i][j] = max[i][j] - allocation[i][j];
        }
    }

    // Initialize the work array with available resources
    for (int i = 0; i < numResources; i++) {
        work[i] = available[i];
    }

    int count = 0; // Count for safe sequence
    while (count < numProcesses) {
        bool foundProcess = false;

        for (int i = 0; i < numProcesses; i++) {
            if (!finish[i] && canAllocate(need[i], work, numResources)) {
                // If we can allocate to process i, simulate the allocation
                for (int j = 0; j < numResources; j++) {
                    work[j] += allocation[i][j];
                }
                safeSequence[count++] = i; // Record the process index
                finish[i] = true;          // Mark process as finished
                foundProcess = true;
            }
        }

        // If no process could be allocated in this iteration, the system is not in a safe state
        if (!foundProcess) return false;
    }

    return true;
}

int main() {
    int numProcesses, numResources;
    int max[10][10], allocation[10][10], available[10], safeSequence[10];

    //cout << "Enter the number of processes: ";
    cin >> numProcesses;
    //cout << "Enter the number of resources: ";
    cin >> numResources;

    //cout << "Enter the Max matrix:\n";
    for (int i = 0; i < numProcesses; i++) {
        for (int j = 0; j < numResources; j++) {
            cin >> max[i][j];
        }
    }

    //cout << "Enter the Allocation matrix:\n";
    for (int i = 0; i < numProcesses; i++) {
        for (int j = 0; j < numResources; j++) {
            cin >> allocation[i][j];
        }
    }

    //cout << "Enter the Available resources vector:\n";
    for (int i = 0; i < numResources; i++) {
        cin >> available[i];
    }

    if (isSafeState(max, allocation, available, numProcesses, numResources, safeSequence)) {
        cout << "The system is in a safe state.\nSafe sequence is: ";
        for (int i = 0; i < numProcesses; i++) {
            
            cout << "P" << safeSequence[i] << " ";
        }
        cout << endl;
    } else {
        cout << "The system is not in a safe state.\n";
    }

    return 0;
}
