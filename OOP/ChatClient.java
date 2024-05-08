import java.io.*;
import java.net.*;

public class ChatClient {
    public static void main(String[] args) {
        String hostname = "localhost";  // Server hostname
        int port = 1234;  // Port the server is listening on

        try (Socket socket = new Socket(hostname, port)) {
            PrintWriter writer = new PrintWriter(socket.getOutputStream(), true);
            BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            BufferedReader consoleReader = new BufferedReader(new InputStreamReader(System.in));

            String userInput;
            System.out.println("Connected to chat server");
            System.out.println("Type a message (or 'exit' to quit):");

            while ((userInput = consoleReader.readLine()) != null && !userInput.equalsIgnoreCase("exit")) {
                writer.println(userInput);
                String response = reader.readLine();
                System.out.println(response);
            }
        } catch (UnknownHostException e) {
            System.out.println("Server not found: " + e.getMessage());
        } catch (IOException e) {
            System.out.println("I/O error: " + e.getMessage());
        }
    }
}
