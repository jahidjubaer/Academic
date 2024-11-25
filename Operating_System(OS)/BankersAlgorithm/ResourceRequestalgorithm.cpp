#include <iostream>
#include <cstring> // For memset and memcpy

using namespace std;

#define MAX_PROCESSES 10
#define MAX_RESOURCES 10

// Function to calculate the Need matrix
void calculateNeed(int need[MAX_PROCESSES][MAX_RESOURCES],
                   int max[MAX_PROCESSES][MAX_RESOURCES],
                   int allocation[MAX_PROCESSES][MAX_RESOURCES],
                   int numProcesses, int numResources) {
    for (int i = 0; i < numProcesses; i++) {
        for (int j = 0; j < numResources; j++) {
            need[i][j] = max[i][j] - allocation[i][j];
        }
    }
}

// Function to check if resources can be allocated to a process
bool canAllocate(int process, int need[MAX_PROCESSES][MAX_RESOURCES],
                 int available[MAX_RESOURCES], int numResources) {
    for (int i = 0; i < numResources; i++) {
        if (need[process][i] > available[i]) {
            return false;
        }
    }
    return true;
}

// Safety Algorithm
bool isSafeState(int max[MAX_PROCESSES][MAX_RESOURCES],
                 int allocation[MAX_PROCESSES][MAX_RESOURCES],
                 int available[MAX_RESOURCES], int numProcesses,
                 int numResources, int safeSequence[MAX_PROCESSES]) {
    int need[MAX_PROCESSES][MAX_RESOURCES];
    bool finish[MAX_PROCESSES] = {false};
    int work[MAX_RESOURCES];

    // Copy available resources to work
    memcpy(work, available, sizeof(int) * numResources);

    // Calculate Need matrix
    calculateNeed(need, max, allocation, numProcesses, numResources);

    int count = 0;
    while (count < numProcesses) {
        bool foundProcess = false;

        for (int i = 0; i < numProcesses; i++) {
            if (!finish[i] && canAllocate(i, need, work, numResources)) {
                for (int j = 0; j < numResources; j++) {
                    work[j] += allocation[i][j];
                }
                safeSequence[count++] = i;
                finish[i] = true;
                foundProcess = true;
            }
        }

        if (!foundProcess) {
            return false; // Not in a safe state
        }
    }
    return true;
}

// Resource Request Algorithm
bool requestResources(int processID, int request[MAX_RESOURCES],
                      int max[MAX_PROCESSES][MAX_RESOURCES],
                      int allocation[MAX_PROCESSES][MAX_RESOURCES],
                      int available[MAX_RESOURCES], int numProcesses,
                      int numResources) {
    int need[MAX_PROCESSES][MAX_RESOURCES];
    int safeSequence[MAX_PROCESSES];

    // Calculate Need matrix
    calculateNeed(need, max, allocation, numProcesses, numResources);

    // Check if request is within need and available resources
    for (int i = 0; i < numResources; i++) {
        if (request[i] > need[processID][i]) {
            cout << "Error: Process has exceeded its maximum claim.\n";
            return false;
        }
        if (request[i] > available[i]) {
            cout << "Resources are not available right now.\n";
            return false;
        }
    }

    // Simulate allocation
    for (int i = 0; i < numResources; i++) {
        available[i] -= request[i];
        allocation[processID][i] += request[i];
        need[processID][i] -= request[i];
    }

    // Check if the system is in a safe state
    if (isSafeState(max, allocation, available, numProcesses, numResources, safeSequence)) {
        cout << "Request can be granted safely.\n";
        return true;
    } else {
        // Revert allocation if not safe
        for (int i = 0; i < numResources; i++) {
            available[i] += request[i];
            allocation[processID][i] -= request[i];
            need[processID][i] += request[i];
        }
        cout << "Request cannot be granted as it leads to an unsafe state.\n";
        return false;
    }
}

int main() {
    int numProcesses, numResources;
    int max[MAX_PROCESSES][MAX_RESOURCES];
    int allocation[MAX_PROCESSES][MAX_RESOURCES];
    int available[MAX_RESOURCES];
    int safeSequence[MAX_PROCESSES];

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

    int processID, request[MAX_RESOURCES];
    //cout << "Enter the process ID making the request: ";
    cin >> processID;
    //cout << "Enter the request vector:\n";
    for (int i = 0; i < numResources; i++) {
        cin >> request[i];
    }

    // Check if the request can be granted
    if (requestResources(processID, request, max, allocation, available, numProcesses, numResources)) {
        cout << "System is in a safe state after granting the request.\n";
    } else {
        cout << "System would be in an unsafe state if the request is granted.\n";
    }

    return 0;
}
