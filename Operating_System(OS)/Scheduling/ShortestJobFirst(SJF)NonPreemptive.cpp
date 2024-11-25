#include <iostream>
#include <iomanip>
#include <algorithm>
using namespace std;

// Structure to store process details
struct Process {
    int id, burst_time, waiting_time, turnaround_time;
};

// Function to calculate waiting and turnaround times
void calculateTimes(Process processes[], int n) {
    processes[0].waiting_time = 0; // First process has no waiting time
    for (int i = 1; i < n; i++) {
        // Waiting time = Previous process waiting + burst time
        processes[i].waiting_time = processes[i - 1].waiting_time + processes[i - 1].burst_time;
    }

    for (int i = 0; i < n; i++) {
        // Turnaround time = Waiting time + Burst time
        processes[i].turnaround_time = processes[i].waiting_time + processes[i].burst_time;
    }
}

// Function to calculate and display average times and process details
void findAverageTime(Process processes[], int n) {
    int total_wt = 0, total_tat = 0;

    // Calculate times
    calculateTimes(processes, n);

    // Sort processes by ID for output consistency
    sort(processes, processes + n, [](Process a, Process b) { return a.id < b.id; });

    // Print process details
    cout << "Process   Burst Time   Waiting Time   Turnaround Time\n";
    for (int i = 0; i < n; i++) {
        total_wt += processes[i].waiting_time;
        total_tat += processes[i].turnaround_time;
        cout << processes[i].id << "         " << processes[i].burst_time
             << "            " << processes[i].waiting_time
             << "              " << processes[i].turnaround_time << "\n";
    }

    // Display averages
    cout << fixed << setprecision(2);
    cout << "\nAverage Waiting Time: " << (float)total_wt / n << endl;
    cout << "Average Turnaround Time: " << (float)total_tat / n << endl;
}

int main() {
    Process processes[] = {
        {1, 6, 0, 0},
        {3, 7, 0, 0},
        {2, 8, 0, 0}
    };
    int n = sizeof(processes) / sizeof(processes[0]);

    findAverageTime(processes, n);

    return 0;
}
