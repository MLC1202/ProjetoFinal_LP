import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.List;

public class ClientHandler implements Runnable {

    private Socket socket;
    private BufferedReader in;
    private PrintWriter out;
    private String username;
    private List<ClientHandler> clients;

    public ClientHandler(Socket socket, List<ClientHandler> clients) {
        this.socket = socket;
        this.clients = clients;
    }

    public String getUsername() {
        return username;
    }

    @Override
    public void run() {
        try {
            in = new BufferedReader(
                    new InputStreamReader(socket.getInputStream(), "UTF-8"));
            out = new PrintWriter(
                    new OutputStreamWriter(socket.getOutputStream(), "UTF-8"), true);

            // Primeira linha enviada pelo cliente é o nome de usuário
            this.username = in.readLine();
            if (username == null) {
                close();
                return;
            }

            broadcast("** " + username + " entrou no chat **");

            String line;
            while ((line = in.readLine()) != null) {
                if (line.equalsIgnoreCase("/list")) {
                    sendUserList();
                } else {
                    broadcast(username + ": " + line);
                }
            }
        } catch (IOException e) {
            System.out.println("Cliente desconectado: " + username);
        } finally {
            close();
        }
    }

    private void sendUserList() {
        StringBuilder sb = new StringBuilder();
        sb.append("USERS:");
        synchronized (clients) {
            boolean first = true;
            for (ClientHandler c : clients) {
                if (c.username == null) continue;
                if (!first) sb.append(", ");
                sb.append(c.username);
                first = false;
            }
        }
        out.println(sb.toString());
    }

    private void broadcast(String msg) {
        synchronized (clients) {
            for (ClientHandler c : clients) {
                if (c.out != null) {
                    c.out.println(msg);
                }
            }
        }
    }

    private void close() {
        try {
            if (username != null) {
                broadcast("** " + username + " saiu do chat **");
            }
        } catch (Exception ignored) {}

        synchronized (clients) {
            clients.remove(this);
        }

        try { if (in != null) in.close(); } catch (IOException ignored) {}
        if (out != null) out.close();
        try { if (socket != null && !socket.isClosed()) socket.close(); } catch (IOException ignored) {}
    }
}
