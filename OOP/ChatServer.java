import java.io.*;
import java.net.*;

public class ChatServer {
    public static void main(String[] args) {
        int port = 1234;  // Server will listen on this port
        try (ServerSocket serverSocket = new ServerSocket(port)) {
            System.out.println("Server started. Listening on Port " + port);

            while (true) {
                Socket clientSocket = serverSocket.accept();
                System.out.println("Client connected.");
                Thread handler = new ClientHandler(clientSocket);
                handler.start();
            }
        } catch (IOException e) {
            System.out.println("Server exception: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

class ClientHandler extends Thread {
    private Socket socket;

    public ClientHandler(Socket socket) {
        this.socket = socket;
    }

    public void run() {
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
             PrintWriter writer = new PrintWriter(socket.getOutputStream(), true)) {

            String clientMessage;
            while ((clientMessage = reader.readLine()) != null) {
                System.out.println("Client says: " + clientMessage);
                writer.println("Echo: " + clientMessage);  // Echo the message back to the client
            }
        } catch (IOException e) {
            System.out.println("Exception in client handler: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                socket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
