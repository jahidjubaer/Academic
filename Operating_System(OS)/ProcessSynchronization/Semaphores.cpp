#include <iostream>
#include <thread>
#include <semaphore.h>
#include <unistd.h> // For sleep()

using namespace std;

// Define the semaphore
sem_t semaphore;

// Task function
void task(const string& name) {
    sem_wait(&semaphore); // Wait (P operation)
    cout << "In the critical section: " << name << endl;
    sleep(1); // Simulate work
    sem_post(&semaphore); // Signal (V operation)
}

int main() {
    // Initialize the semaphore with a value of 1
    sem_init(&semaphore, 0, 1);

    // Create threads
    thread t1(task, "Thread 1");
    thread t2(task, "Thread 2");

    // Wait for threads to finish
    t1.join();
    t2.join();

    // Destroy the semaphore
    sem_destroy(&semaphore);

    return 0;
}
