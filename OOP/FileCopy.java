import java.io.*;

public class FileCopy {
    public static void main(String[] args) {
        // Input and output file paths
        String inputFile = "input.txt";
        String outputFile = "output.txt";

        // Read the content of the input file and print it to the console
        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
            String line;
            System.out.println("Content of the input file:");
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        } catch (IOException e) {
            System.err.println("Error reading the input file: " + e.getMessage());
        }

        // Write the content to the output file
        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
             BufferedWriter writer = new BufferedWriter(new FileWriter(outputFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                writer.write(line);
                writer.newLine(); // Add newline character after each line
            }
            System.out.println("\nContent successfully written to the output file.");
        } catch (IOException e) {
            System.err.println("Error writing to the output file: " + e.getMessage());
        }
    }
}
