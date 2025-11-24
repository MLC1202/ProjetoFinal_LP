import java.awt.BorderLayout;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;

public class ChatClient {

    private final String host;
    private final int port;
    private final String username;

    private Socket socket;
    private BufferedReader in;
    private PrintWriter out;

    private JFrame chatFrame;
    private JTextArea chatArea;
    private JTextField inputField;

    private Thread listenerThread;

    public ChatClient(String host, int port, String username) throws IOException {
        this.host = host;
        this.port = port;
        this.username = username;
        connect();
    }

    private void connect() throws IOException {
        socket = new Socket(host, port);
        in = new BufferedReader(
                new InputStreamReader(socket.getInputStream(), "UTF-8"));
        out = new PrintWriter(
                new OutputStreamWriter(socket.getOutputStream(), "UTF-8"), true);

        // Envia o nome de usuário para o servidor
        out.println(username);

        startListener();
    }

    private void startListener() {
        listenerThread = new Thread(() -> {
            try {
                String line;
                while ((line = in.readLine()) != null) {
                    handleIncoming(line);
                }
            } catch (IOException e) {
                appendToChat("[Conexão com servidor de chat encerrada]");
            } finally {
                close();
            }
        });
        listenerThread.setDaemon(true);
        listenerThread.start();
    }

    private void handleIncoming(String line) {
        if (line.startsWith("USERS:")) {
            String users = line.substring("USERS:".length());
            SwingUtilities.invokeLater(() -> {
                JFrame parent = (chatFrame != null) ? chatFrame : null;
                if (users.trim().isEmpty()) {
                    JOptionPane.showMessageDialog(
                            parent,
                            "Nenhum usuário online.",
                            "Usuários online",
                            JOptionPane.INFORMATION_MESSAGE);
                } else {
                    JOptionPane.showMessageDialog(
                            parent,
                            "Usuários online:\n" + users,
                            "Usuários online",
                            JOptionPane.INFORMATION_MESSAGE);
                }
            });
        } else {
            appendToChat(line);
        }
    }

    private void appendToChat(String msg) {
        if (chatArea == null) {
            // Se a janela ainda não foi aberta, simplesmente ignora
            return;
        }
        SwingUtilities.invokeLater(() -> {
            chatArea.append(msg + "\n");
        });
    }

    // Botão "Usuários online"
    public void showOnlineUsers() {
        if (out != null) {
            out.println("/list");
        }
    }

    // Botão "Chat global"
    public void openChatWindow() {
        if (chatFrame != null) {
            chatFrame.setVisible(true);
            chatFrame.toFront();
            return;
        }

        SwingUtilities.invokeLater(() -> {
            chatFrame = new JFrame("Chat global - " + username);
            chatFrame.setSize(500, 400);
            chatFrame.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);

            chatArea = new JTextArea();
            chatArea.setEditable(false);
            JScrollPane scrollPane = new JScrollPane(chatArea);

            inputField = new JTextField();
            inputField.addActionListener(e -> {
                String text = inputField.getText().trim();
                if (!text.isEmpty() && out != null) {
                    out.println(text);
                    inputField.setText("");
                }
            });

            chatFrame.getContentPane().setLayout(new BorderLayout());
            chatFrame.add(scrollPane, BorderLayout.CENTER);
            chatFrame.add(inputField, BorderLayout.SOUTH);

            chatFrame.setLocationRelativeTo(null);
            chatFrame.setVisible(true);
        });
    }

    public void close() {
        try { if (in != null) in.close(); } catch (IOException ignored) {}
        if (out != null) out.close();
        try { if (socket != null && !socket.isClosed()) socket.close(); } catch (IOException ignored) {}
    }
}
