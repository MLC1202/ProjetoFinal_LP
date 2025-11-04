package Arquivos;
import java.io.FileNotFoundException;
import java.util.Formatter;
import java.util.FormatterClosedException;
import java.util.List;

public class CriaTxtE {
    private Formatter output;

    // === 1) Abre o arquivo resultados.txt ===
    public void openfile() {
        try {
            output = new Formatter("resultados.txt");
        } 
        catch (SecurityException securityException) {
            System.err.println("Erro de segurança ao tentar abrir o arquivo.");
            System.exit(1);
        } 
        catch (FileNotFoundException fileNotFoundException) {
            System.err.println("Erro ao abrir o arquivo.");
            System.exit(1);
        }
    }

    // === 2) Adiciona os resultados do aluno ===
    // results = { {quizName, score}, ... }
    public void addResults(List<String[]> results) {
        try {
            output.format("%-35s %-10s%n", "Quiz", "Pontuacao");
            output.format("----------------------------------------%n");

            for (String[] row : results) {
                String quizName = row[0] == null ? "" : row[0];
                String score = row[1] == null ? "0" : row[1];
                output.format("%-35s %-10s%n", quizName, score);
            }

            output.format("-------------------------------------------%n");
            System.out.println("Arquivo 'resultados.txt' criado com sucesso!");
        } 
        catch (FormatterClosedException e) {
            System.err.println("Erro ao escrever no arquivo.");
        }
    }

    // === 3) Fecha o arquivo ===
    public void closeFile() {
        if (output != null)
            output.close();
    }
}