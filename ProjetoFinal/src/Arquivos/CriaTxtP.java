package Arquivos;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Formatter;
import java.util.FormatterClosedException;
import java.util.List;
import java.util.Scanner;
import javax.crypto.SecretKey;

public class CriaTxtP {

    private Formatter output;
    private String filePath = "resultadosProfessor.txt";       // arquivo original
    private String keyPath = "professor.key";               // chave AES
    private String encPath = "resultadosProfessor.txt.enc";   // arquivo criptografado
    private String decPath = "resultadosDescriptografados.txt"; // saída descriptografada

    // === 1) Abre o arquivo TXT ===
    public void openfile() {
        try {
            output = new Formatter(filePath);
        } catch (SecurityException securityException) {
            System.err.println("Erro de segurança ao tentar abrir o arquivo.");
            System.exit(1);
        } catch (FileNotFoundException fileNotFoundException) {
            System.err.println("Erro ao abrir o arquivo.");
            System.exit(1);
        }
    }

    // === 2) Adiciona resultados de TODOS os alunos ===
    // results = { {user_id, quiz_name, totalScore}, ... }
    public void addResults(List<String[]> results) {
        try {
            output.format("%-10s %-35s %-10s%n", "ID_Aluno", "Quiz", "Pontuacao");
            output.format("-----------------------------------------------------------%n");

            for (String[] row : results) {
                String userId = row[0] == null ? "" : row[0];
                String quizName = row[1] == null ? "" : row[1];
                String score = row[2] == null ? "0" : row[2];
                output.format("%-10s %-35s %-10s%n", userId, quizName, score);
            }

            output.format("-----------------------------------------------------------%n");
            System.out.println("Arquivo '" + filePath + "' criado com sucesso!");
        } catch (FormatterClosedException e) {
            System.err.println("Erro ao escrever no arquivo.");
        }
    }

    // === 3) Fecha o arquivo ===
    public void closeFile() {
        if (output != null) {
            output.close();
        }
    }

    // === 4) Criptografa o TXT e pergunta se deseja descriptografar ===
    public void crypto() {
        try {
            // Gera chave se não existir
            File keyFile = new File(keyPath);
            if (!keyFile.exists()) {
                AESKeyStore.generateKey(keyFile);
                System.out.println("Nova chave AES gerada: " + keyFile.getAbsolutePath());
            }

            // Criptografa
            SecretKey sk = AESKeyStore.loadKey(keyFile);
            File plain = new File(filePath);
            File enc = new File(encPath);

            CryptoAESGCM.encryptFile(plain, enc, sk);
            System.out.println("Arquivo criptografado salvo em: " + enc.getAbsolutePath());

            // === PERGUNTA AO USUÁRIO ===
            Scanner scanner = new Scanner(System.in);
            System.out.print("\nDeseja descriptografar o arquivo agora? (sim/nao): ");
            String resposta = scanner.nextLine().trim().toLowerCase();

            if (resposta.equals("sim")) {
                File dec = new File(decPath);
                CryptoAESGCM.decryptFile(enc, dec, sk);
                System.out.println("\nArquivo descriptografado com sucesso!");
                System.out.println("Gerado em: " + dec.getAbsolutePath());
            } else {
                System.out.println("\nArquivo permanecerá criptografado.");
            }

        } catch (Exception e) {
            System.err.println("Erro ao criptografar/descriptografar: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
