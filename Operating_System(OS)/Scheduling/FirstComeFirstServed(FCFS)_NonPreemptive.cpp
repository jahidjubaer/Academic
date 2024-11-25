///__________JAHID_________///
#include <bits/stdc++.h>
using namespace std;
#define endl '\n'

// Function to calculate and display process details
void calculateAndDisplay(int processes[][4], int n) {
    int total_wt = 0, total_tat = 0;

    // Calculate Completion Time (CT), Turnaround Time (TAT), and Waiting Time (WT)
    processes[0][2] = processes[0][1]; // CT for first process = Burst Time
    for (int i = 1; i < n; i++) {
        processes[i][2] = processes[i - 1][2] + processes[i][1]; // CT = Prev CT + Burst Time
    }
    for (int i = 0; i < n; i++) {
        processes[i][3] = processes[i][2];            // TAT = CT
        total_tat += processes[i][3];
        total_wt += (processes[i][3] - processes[i][1]); // WT = TAT - Burst Time
    }

    // Print process details
    cout << "Process\tBurstTime\tCompletionTime\tTurnaroundTime\tWaitingTime\n";
    for (int i = 0; i < n; i++) {
        cout << i + 1 << "\t\t" << processes[i][1] << "\t\t" << processes[i][2]
             << "\t\t" << processes[i][3] << "\t\t" << processes[i][3] - processes[i][1] << "\n";
    }

    // Display average times
    cout << fixed << setprecision(2);
    cout << "\nAverage Waiting Time: " << (float)total_wt / n << endl;
    cout << "Average Turnaround Time: " << (float)total_tat / n << endl;
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    int n = 3; // Number of processes
    int processes[3][4] = {{1, 6, 0, 0}, {2, 8, 0, 0}, {3, 7, 0, 0}}; 
    // Columns: {ProcessID, BurstTime, CompletionTime, TurnaroundTime}

    calculateAndDisplay(processes, n);

    return 0;
}
