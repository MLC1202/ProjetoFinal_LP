import Arquivos.CriaTxtE;
import java.awt.*;
import java.util.List;
import java.util.ResourceBundle;
import javax.swing.*;

public class GuiCentralAluno extends JFrame {
    private JButton playRandomButton;
    private JButton playQuizButton;
    private JButton viewResultsButton;
    private User user;
    private ResourceBundle idioma = null;

    public GuiCentralAluno(User user, ResourceBundle idioma) {
        this.user = user;
        setIdioma(idioma);
        setTitle(idioma.getString("gui.central.aluno.title")+ " - " + user.getName());
        setSize(500, 300);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);

        // Fonte e cor padrão para aparência moderna
        Font font = new Font("Segoe UI", Font.PLAIN, 16);
        Color backgroundColor = new Color(245, 245, 245);
        Color buttonColor = new Color(230, 230, 230);

        // Painel principal com margem
        JPanel mainPanel = new JPanel(new BorderLayout(0, 20));
        mainPanel.setBorder(BorderFactory.createEmptyBorder(20, 30, 20, 30));
        mainPanel.setBackground(backgroundColor);

        // Título
        JLabel titleLabel = new JLabel(idioma.getString("gui.central.aluno.welcome") + ", " + user.getName());
        titleLabel.setFont(new Font("Segoe UI", Font.BOLD, 20));
        titleLabel.setHorizontalAlignment(SwingConstants.CENTER);
        titleLabel.setForeground(new Color(50, 50, 50));
        mainPanel.add(titleLabel, BorderLayout.NORTH);

        // Painel de botões
        JPanel buttonPanel = new JPanel(new GridLayout(3, 1, 15, 15));
        buttonPanel.setBackground(backgroundColor);

        playRandomButton = criarBotao(idioma.getString("gui.central.aluno.randomq"), font, buttonColor);
        playQuizButton = criarBotao(idioma.getString("gui.central.aluno.professorq"), font, buttonColor);
        viewResultsButton = criarBotao(idioma.getString("gui.central.aluno.results"), font, buttonColor);

        buttonPanel.add(playRandomButton);
        buttonPanel.add(playQuizButton);
        buttonPanel.add(viewResultsButton);

        mainPanel.add(buttonPanel, BorderLayout.CENTER);

        add(mainPanel);

        // Listeners
        playRandomButton.addActionListener(e -> playRandomQuiz());
        playQuizButton.addActionListener(e -> playProfessorQuiz());
        viewResultsButton.addActionListener(e -> viewResults());

        setVisible(true);
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

    private void playRandomQuiz() {
        List<Question> questions = CrudBD.getRandomQuestions(10);
        if (questions.isEmpty()) {
            JOptionPane.showMessageDialog(this, idioma.getString("gui.central.aluno.noteoughq"));
            return;
        }
        new GuiQuestions(questions, user, idioma);
    }

    private void playProfessorQuiz() {
        List<String[]> quizzes = CrudBD.getAllQuizzes();
        if (quizzes.isEmpty()) {
            JOptionPane.showMessageDialog(this, idioma.getString("gui.central.aluno.noqconfigured"));
            return;
        }

        String[] quizNames = quizzes.stream().map(q -> q[1]).toArray(String[]::new);
        String selectedQuiz = (String) JOptionPane.showInputDialog(
                this,
                idioma.getString("gui.central.aluno.selectquiz"),
                idioma.getString("gui.central.aluno.qselection"),
                JOptionPane.PLAIN_MESSAGE,
                null,
                quizNames,
                quizNames[0]
        );

        if (selectedQuiz == null) return;

        int quizId = Integer.parseInt(quizzes.stream()
                .filter(q -> q[1].equals(selectedQuiz))
                .findFirst()
                .get()[0]);

        List<Question> questions = CrudBD.getQuizQuestions(quizId);
        if (questions.isEmpty()) {
            JOptionPane.showMessageDialog(this, idioma.getString("gui.central.aluno.noquestions"));
            return;
        }

        new GuiQuestions(questions, user, idioma);
    }

    private void viewResults() {
        List<String[]> results = CrudBD.getStudentResults(user.getUser_id());
        if (results.isEmpty()) {
            JOptionPane.showMessageDialog(this, idioma.getString("gui.central.aluno.noreults"));
            return;
        }

        //Gerando o arquivo txt com os resultados
        CriaTxtE writer = new CriaTxtE();
        writer.openfile();
        writer.addResults(results);
        writer.closeFile();

        new GuiViewResults(results, idioma);
    }

    public static void main(String[] args) {
        User user = new User("Aluno Teste", "1234");
        ResourceBundle idioma = null;
        new GuiCentralAluno(user, idioma);
    }

    public void setIdioma(ResourceBundle idioma){
    this.idioma = idioma;
    }
}