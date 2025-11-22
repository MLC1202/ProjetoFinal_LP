
import java.util.ResourceBundle;
import javax.swing.JOptionPane;

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
        //Print do usuário encontrado
        System.out.println(idioma.getString("login.successful")+ user);

        if (user == null) {
            // Verifica se o nome já existe com outra senha
            User existente = CrudBD.getUser(userName); // Esse método busca só pelo nome
            System.out.println(idioma.getString("login.exists") + existente);
            if (existente != null) {
                JOptionPane.showMessageDialog(null, "Erro: O nome de usuário já existe com uma senha diferente.");
                JOptionPane.showMessageDialog(null, idioma.getString("error.user.exists"));
                return; // Encerra o programa ou retorna ao fluxo de login
            }

            // Nome não existe, então podemos criar novo usuário
            user = new User(userName, senha);
            CrudBD.saveUser(user, senha);
        }

        // Fluxo para professores
        if (isTeacher) {
            JOptionPane.showMessageDialog(null, "Bem-vindo, Professor " + user.getName() + "!");
            JOptionPane.showMessageDialog(null, idioma.getString("welcome.teacher")+" "+user.getName() + "!");
            new GuiCentralProfessor(idioma);
            return;
        }

        // Fluxo para alunos
        JOptionPane.showMessageDialog(null, idioma.getString("welcome.student")+" "+user.getName() + "!");
        new GuiCentralAluno(user, idioma);

        
    }
}
