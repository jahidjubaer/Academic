#include <iostream>
#include <thread>
#include <semaphore.h>
#include <unistd.h>
#include <cstdlib>
#include <ctime>

#define BUFFER_SIZE 5

using namespace std;

// Shared resources
int buffer[BUFFER_SIZE];
int count = 0;

// Synchronization primitives
sem_t emptySlots, fullSlots;
pthread_mutex_t bufferMutex;

void producer() {
    while (true) {
        int item = rand() % 100; // Produce an item
        sem_wait(&emptySlots);   // Wait for empty space
        pthread_mutex_lock(&bufferMutex); // Lock the buffer

        buffer[count] = item;    // Add item to the buffer
        count++;
        cout << "Produced: " << item << endl;

        pthread_mutex_unlock(&bufferMutex); // Unlock the buffer
        sem_post(&fullSlots);    // Signal that an item was added
        sleep(1);                // Simulate time to produce
    }
}

void consumer() {
    while (true) {
        sem_wait(&fullSlots);    // Wait for an item to consume
        pthread_mutex_lock(&bufferMutex); // Lock the buffer

        int item = buffer[--count]; // Remove item from the buffer
        cout << "Consumed: " << item << endl;

        pthread_mutex_unlock(&bufferMutex); // Unlock the buffer
        sem_post(&emptySlots);   // Signal that a space is free
        sleep(1);                // Simulate time to consume
    }
}

int main() {
    srand(time(0)); // Seed for random number generation

    // Initialize synchronization primitives
    sem_init(&emptySlots, 0, BUFFER_SIZE);
    sem_init(&fullSlots, 0, 0);
    pthread_mutex_init(&bufferMutex, nullptr);

    // Create producer and consumer threads
    thread producerThread(producer);
    thread consumerThread(consumer);

    // Join threads (this will block indefinitely in this infinite-loop scenario)
    producerThread.join();
    consumerThread.join();

    // Cleanup (unreachable due to infinite loops)
    sem_destroy(&emptySlots);
    sem_destroy(&fullSlots);
    pthread_mutex_destroy(&bufferMutex);

    return 0;
}
