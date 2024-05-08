// The NumberThread class prints numbers from 1 to 5
class NumberThread extends Thread {
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Number: " + i);
            try {
                Thread.sleep(500); // Sleep for 500 milliseconds
            } catch (InterruptedException e) {
                System.out.println("Number thread interrupted.");
            }
        }
    }
}

// The LetterThread class prints letters from A to E
class LetterThread extends Thread {
    public void run() {
        char letter = 'A';
        for (int i = 0; i < 5; i++) {
            System.out.println("Letter: " + letter++);
            try {
                Thread.sleep(500); // Sleep for 500 milliseconds
            } catch (InterruptedException e) {
                System.out.println("Letter thread interrupted.");
            }
        }
    }
}

public class MultiThreadDemo {
    public static void main(String[] args) {
        // Create instances of Thread
        Thread numberThread = new NumberThread();
        Thread letterThread = new LetterThread();

        // Start the threads
        numberThread.start();
        letterThread.start();

        try {
            // Wait for threads to finish
            numberThread.join();
            letterThread.join();
        } catch (InterruptedException e) {
            System.out.println("Main thread interrupted.");
        }

        System.out.println("Main thread execution completes.");
    }
}
