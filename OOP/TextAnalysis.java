import java.io.*;

public class TextAnalysis {
    public static void main(String[] args) {
        String inputFilePath = "input.txt";  // Define the input file path
        int characters = 0;
        int words = 0;
        int vowels = 0;

        try (BufferedReader reader = new BufferedReader(new FileReader(inputFilePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                characters += line.length();  // Count characters in each line
                String[] wordsArray = line.split("\\s+");  // Split line into words
                words += wordsArray.length;  // Count words
                
                // Count vowels
                for (char c : line.toCharArray()) {
                    if (isVowel(c)) {
                        vowels++;
                    }
                }
            }

            System.out.println("Number of characters: " + characters);
            System.out.println("Number of words: " + words);
            System.out.println("Number of vowels: " + vowels);
        } catch (IOException e) {
            System.err.println("Error reading the file: " + e.getMessage());
        }
    }

    // Helper method to check if a character is a vowel
    private static boolean isVowel(char c) {
        return "AEIOUaeiou".indexOf(c) != -1;
    }
}
