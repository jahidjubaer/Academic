///__________JAHID_________///
#include <iostream>
#include <iomanip>
using namespace std;

// Function to calculate waiting time using Round Robin
void calculateWaitingTime(int n, int bt[], int wt[], int quantum) {
    int remaining_bt[n]; // Array for remaining burst times
    for (int i = 0; i < n; i++) remaining_bt[i] = bt[i]; // Copy burst times

    int time = 0; // Current time
    while (true) {
        bool all_done = true; // Check if all processes are done

        for (int i = 0; i < n; i++) {
            if (remaining_bt[i] > 0) {
                all_done = false; // At least one process is pending

                if (remaining_bt[i] > quantum) {
                    time += quantum;        // Process executes for 'quantum' time
                    remaining_bt[i] -= quantum; 
                } else {
                    time += remaining_bt[i]; // Process finishes execution
                    wt[i] = time - bt[i];    // Waiting time = Current time - Burst time
                    remaining_bt[i] = 0;    // Mark process as done
                }
            }
        }
        if (all_done) break; // Exit when all processes are done
    }
}

// Function to calculate turnaround time
void calculateTurnaroundTime(int n, int bt[], int wt[], int tat[]) {
    for (int i = 0; i < n; i++) {
        tat[i] = bt[i] + wt[i]; // Turnaround time = Burst time + Waiting time
    }
}

// Function to display process details and calculate averages
void displayResults(int n, int bt[], int wt[], int tat[]) {
    int total_wt = 0, total_tat = 0;

    cout << "Process\tBurst Time\tWaiting Time\tTurnaround Time\n";
    for (int i = 0; i < n; i++) {
        total_wt += wt[i];
        total_tat += tat[i];
        cout << i + 1 << "\t\t" << bt[i] << "\t\t" << wt[i] << "\t\t" << tat[i] << "\n";
    }

    cout << fixed << setprecision(2);
    cout << "\nAverage Waiting Time: " << (float)total_wt / n << endl;
    cout << "Average Turnaround Time: " << (float)total_tat / n << endl;
}

int main() {
    int burst_time[] = {6, 8, 7}; // Burst times of processes
    int n = sizeof(burst_time) / sizeof(burst_time[0]); // Number of processes
    int quantum = 4; // Time quantum

    int wt[n] = {0}, tat[n] = {0}; // Arrays for waiting and turnaround times

    // Calculate waiting and turnaround times
    calculateWaitingTime(n, burst_time, wt, quantum);
    calculateTurnaroundTime(n, burst_time, wt, tat);

    // Display results
    displayResults(n, burst_time, wt, tat);

    return 0;
}
