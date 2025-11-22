import java.util.Locale;
import java.util.ResourceBundle;
import javax.swing.JOptionPane;

public final class GuiSelectIdioma {
    String idioma = "";
    ResourceBundle properties = null;

    public GuiSelectIdioma(){
    }

    @SuppressWarnings("deprecation")
    public ResourceBundle UserChoice(){
        ResourceBundle choice = null;

        Object[] idiomas = {
         "Português", 
         "Inglês", 
         "Espanhol", 
         "Francês", 
         "Italiano"
        };

        int escolha = JOptionPane.showOptionDialog(
        null,
        "Selecione o idioma:",
        "Idioma",
        JOptionPane.DEFAULT_OPTION,
        JOptionPane.QUESTION_MESSAGE,
        null,
        idiomas,
        idiomas[0]
        );
        
        // PROTEÇÃO: Se fechar no X (retorna -1), define um padrão (ex: 0 = Português)
        if (escolha == JOptionPane.CLOSED_OPTION) {
            escolha = 0; 
        }
    
        // Conversão segura (cast)
        String op = (String) idiomas[escolha];
        this.idioma = op;

        
        choice = switch (this.idioma) {
            case "Português" -> ResourceBundle.getBundle("messages", new Locale("pt", "BR"));
            case "Inglês" -> ResourceBundle.getBundle("messages", Locale.US);
            case "Espanhol" -> ResourceBundle.getBundle("messages", new Locale("es", "SP"));
            case "Francês" -> ResourceBundle.getBundle("messages", Locale.FRENCH);
            case "Italiano" -> ResourceBundle.getBundle("messages", Locale.ITALIAN);
            default -> ResourceBundle.getBundle("messages");
        };
        
        this.properties = choice;

        return choice;
    }
}
