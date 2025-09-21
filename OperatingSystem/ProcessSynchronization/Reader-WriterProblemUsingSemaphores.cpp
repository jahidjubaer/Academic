#include <iostream>
#include <thread>
#include <semaphore.h>

using namespace std;

sem_t rw_mutex;  // Semaphore for readers-writers mutual exclusion
sem_t mutex_semaphore; // Semaphore to protect read_count
int reader_count = 0;  // Number of active readers
int shared_data = 0;   // Shared resource

// Reader function
void reader(int id) {
    sem_wait(&mutex_semaphore);
    reader_count++;
    if (reader_count == 1) sem_wait(&rw_mutex); // First reader locks the resource
    sem_post(&mutex_semaphore);

    // Reading shared data
    cout << "Reader " << id << " read data: " << shared_data << endl;

    sem_wait(&mutex_semaphore);
    reader_count--;
    if (reader_count == 0) sem_post(&rw_mutex); // Last reader unlocks the resource
    sem_post(&mutex_semaphore);
}

// Writer function
void writer(int id) {
    sem_wait(&rw_mutex); // Lock resource for writing
    shared_data += 10;   // Modify shared data
    cout << "Writer " << id << " wrote data: " << shared_data << endl;
    sem_post(&rw_mutex); // Unlock resource
}

int main() {
    // Initialize semaphores
    sem_init(&rw_mutex, 0, 1);
    sem_init(&mutex_semaphore, 0, 1);

    // Create reader and writer threads
    thread r1(reader, 1);
    thread r2(reader, 2);
    thread w1(writer, 1);
    thread w2(writer, 2);

    // Wait for threads to finish
    r1.join();
    r2.join();
    w1.join();
    w2.join();

    // Destroy semaphores
    sem_destroy(&rw_mutex);
    sem_destroy(&mutex_semaphore);

    return 0;
}
