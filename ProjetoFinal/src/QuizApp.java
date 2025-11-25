import java.util.ResourceBundle;
import javax.swing.JOptionPane;
import java.io.IOException;

public class QuizApp {
    public static void main(String[] args) {
        //Exibe a tela de seleção de lingua
        GuiSelectIdioma guiIdioma = new GuiSelectIdioma();
        ResourceBundle idioma = guiIdioma.UserChoice();

        // Exibe a tela de login
        GuiUser guiUser = new GuiUser(null, idioma);

        String userName = guiUser.getUserName();
        String senha = guiUser.getSenha();
        boolean isTeacher = guiUser.isTeacher();

        if (userName == null || userName.isEmpty() || senha == null || senha.isEmpty()) {
            System.out.println(idioma.getString("login.cancelled"));
            return;
        }

        // Tenta buscar o usuário com nome e senha
        User user = CrudBD.getUser(userName, senha);
        System.out.println(idioma.getString("login.successful") + user);

        if (user == null) {
            // Verifica se o nome já existe com outra senha
            User existente = CrudBD.getUser(userName);
            System.out.println(idioma.getString("login.exists") + existente);
            if (existente != null) {
                JOptionPane.showMessageDialog(null, idioma.getString("error.user.exists"));
                return;
            }

            // Nome não existe, então podemos criar novo usuário
            user = new User(userName, senha);
            CrudBD.saveUser(user, senha);
        }

        // Integração do ChatClient
        ChatClient chatClient = null;
        try {
            chatClient = new ChatClient("localhost", 33444, user.getName());
        } catch (IOException e) {
            System.out.println("Não foi possível conectar ao servidor de chat: " + e.getMessage());
        }

        if (isTeacher) {
            JOptionPane.showMessageDialog(null,
                    idioma.getString("welcome.teacher") + " " + user.getName() + "!");
            new GuiCentralProfessor(idioma, chatClient);
            return;
        }

        JOptionPane.showMessageDialog(null,
                idioma.getString("welcome.student") + " " + user.getName() + "!");
        new GuiCentralAluno(user, idioma, chatClient);
    }
}
