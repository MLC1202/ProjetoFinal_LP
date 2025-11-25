import java.awt.*;
import java.util.ResourceBundle;
import javax.swing.*;

public class GuiCentralProfessor extends JFrame {
    private JButton manageQuestionsButton;
    private JButton setQuizButton;
    private JButton viewResultsButton;
    private JButton onlineUsersButton;
    private JButton globalChatButton;
    private ResourceBundle idioma = null;
    private ChatClient chatClient;

    public GuiCentralProfessor(ResourceBundle idioma, ChatClient chatClient) {
        this.idioma = idioma;
        this.chatClient = chatClient;

        setTitle(idioma.getString("gui.central.professor.title"));
        setSize(500, 350);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);

        Font font = new Font("Segoe UI", Font.PLAIN, 16);
        Color backgroundColor = new Color(245, 245, 245);
        Color buttonColor = new Color(230, 230, 230);

        JPanel mainPanel = new JPanel(new BorderLayout(0, 20));
        mainPanel.setBorder(BorderFactory.createEmptyBorder(20, 30, 20, 30));
        mainPanel.setBackground(backgroundColor);

        JLabel titleLabel = new JLabel(idioma.getString("gui.central.professor.painel"), SwingConstants.CENTER);
        titleLabel.setFont(new Font("Segoe UI", Font.BOLD, 20));
        titleLabel.setForeground(new Color(50, 50, 50));
        mainPanel.add(titleLabel, BorderLayout.NORTH);

        JPanel buttonPanel = new JPanel(new GridLayout(5, 1, 15, 15));
        buttonPanel.setBackground(backgroundColor);

        manageQuestionsButton = criarBotao(idioma.getString("gui.central.professor.qmanager"), font, buttonColor);
        setQuizButton = criarBotao(idioma.getString("gui.central.professor.qconfigure"), font, buttonColor);
        viewResultsButton = criarBotao(idioma.getString("gui.central.professor.viewresults"), font, buttonColor);
        onlineUsersButton = criarBotao("Usuários online", font, buttonColor);
        globalChatButton = criarBotao("Chat global", font, buttonColor);

        buttonPanel.add(manageQuestionsButton);
        buttonPanel.add(setQuizButton);
        buttonPanel.add(viewResultsButton);
        buttonPanel.add(onlineUsersButton);
        buttonPanel.add(globalChatButton);

        mainPanel.add(buttonPanel, BorderLayout.CENTER);
        add(mainPanel);

        manageQuestionsButton.addActionListener(e -> openManageQuestions());
        setQuizButton.addActionListener(e -> openSetQuiz());
        viewResultsButton.addActionListener(e -> openViewResults());
        onlineUsersButton.addActionListener(e -> showOnlineUsers());
        globalChatButton.addActionListener(e -> openGlobalChat());

        setVisible(true);
    }

    public GuiCentralProfessor(ResourceBundle idioma) {
        this(idioma, null);
    }

    private JButton criarBotao(String texto, Font fonte, Color corFundo) {
        JButton botao = new JButton(texto);
        botao.setFont(fonte);
        botao.setBackground(corFundo);
        botao.setFocusPainted(false);
        botao.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(new Color(200, 200, 200)),
                BorderFactory.createEmptyBorder(10, 20, 10, 20)
        ));
        return botao;
    }

    private void openManageQuestions() {
        new GuiEditQuestions(idioma);
    }

    private void openSetQuiz() {
        new GuiSetQuiz(idioma);
    }

    private void openViewResults() {
        new GuiViewResultsProfessor(idioma);
    }

    private void showOnlineUsers() {
        if (chatClient != null) {
            chatClient.showOnlineUsers();
        } else {
            JOptionPane.showMessageDialog(this,
                    "Chat não disponível (cliente não conectado).");
        }
    }

    private void openGlobalChat() {
        if (chatClient != null) {
            chatClient.openChatWindow();
        } else {
            JOptionPane.showMessageDialog(this,
                    "Chat não disponível (cliente não conectado).");
        }
    }

    public static void main(String[] args) {
        ResourceBundle idioma = null;
        new GuiCentralProfessor(idioma);
    }
}
