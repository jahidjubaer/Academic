#include <iostream>
#include <thread>

using namespace std;

// Thread function
void threadFunction() {
    cout << "Thread ID: " << this_thread::get_id() << endl;
}

int main() {
    // Create threads
    thread thread1(threadFunction);
    thread thread2(threadFunction);

    // Wait for threads to finish
    thread1.join();
    thread2.join();

    return 0;
}
