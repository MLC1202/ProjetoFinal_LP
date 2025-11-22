import javax.swing.JOptionPane;

public final class GuiSelectIdioma {
    String idioma;

    public GuiSelectIdioma(){
    }

    public String UserChoice(){
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
        
        String op = ""+idiomas[escolha];
        this.idioma = op;
        
        return op;
    }
}
