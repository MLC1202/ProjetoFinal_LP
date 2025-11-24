import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ChatServer {

    private int port;
    static final List<ClientHandler> clients =
            Collections.synchronizedList(new ArrayList<>());

    public ChatServer(int port) {
        this.port = port;
    }

    public void start() {
        System.out.println("Servidor de chat iniciado na porta " + port);
        try (ServerSocket serverSocket = new ServerSocket(port)) {
            while (true) {
                Socket socket = serverSocket.accept();
                ClientHandler handler = new ClientHandler(socket, clients);
                clients.add(handler);
                new Thread(handler).start();
            }
        } catch (IOException e) {
            System.out.println("Erro no servidor de chat: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        int port = 33444; // porta usada pelo cliente
        new ChatServer(port).start();
    }
}
