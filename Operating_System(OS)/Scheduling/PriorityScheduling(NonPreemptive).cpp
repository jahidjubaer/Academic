#include <iostream>
#include <iomanip>
#include <algorithm>
using namespace std;

struct Process {
    int id;       // Process ID
    int bt;       // Burst time
    int priority; // Priority
    int ct;       // Completion time
    int tat;      // Turnaround time
    int wt;       // Waiting time
};

// Comparator to sort processes by priority
bool compareByPriority(const Process &a, const Process &b) {
    return a.priority < b.priority; // Lower number = higher priority
}

// Function to calculate completion, turnaround, and waiting times
void calculateTimes(Process proc[], int n) {
    // Calculate completion time
    proc[0].ct = proc[0].bt;
    for (int i = 1; i < n; i++) {
        proc[i].ct = proc[i - 1].ct + proc[i].bt;
    }

    // Calculate turnaround and waiting times
    for (int i = 0; i < n; i++) {
        proc[i].tat = proc[i].ct;            // Turnaround time = Completion time
        proc[i].wt = proc[i].tat - proc[i].bt; // Waiting time = Turnaround time - Burst time
    }
}

// Function to display process details and calculate averages
void displayProcesses(Process proc[], int n) {
    int total_tat = 0, total_wt = 0;

    cout << "Process\tBurst Time\tPriority\tCompletion Time\tTurnaround Time\tWaiting Time\n";
    for (int i = 0; i < n; i++) {
        total_tat += proc[i].tat;
        total_wt += proc[i].wt;
        cout << proc[i].id << "\t\t" << proc[i].bt << "\t\t" << proc[i].priority << "\t\t"
             << proc[i].ct << "\t\t" << proc[i].tat << "\t\t" << proc[i].wt << "\n";
    }

    cout << fixed << setprecision(2);
    cout << "\nAverage Waiting Time: " << (float)total_wt / n << endl;
    cout << "Average Turnaround Time: " << (float)total_tat / n << endl;
}

int main() {
    // Initialize processes
    Process proc[] = {{1, 6, 2}, {2, 8, 1}, {3, 7, 3}};
    int n = sizeof(proc) / sizeof(proc[0]);

    // Sort processes by priority
    sort(proc, proc + n, compareByPriority);

    // Calculate times and display results
    calculateTimes(proc, n);
    displayProcesses(proc, n);

    return 0;
}
