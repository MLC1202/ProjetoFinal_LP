package Arquivos;

import javax.crypto.SecretKey;
import java.io.File;
import javax.swing.JOptionPane;

public class Descriptografa {

    public static void main(String[] args) {
        try {
            // Caminhos padrão (os mesmos da criptografia)
            File keyFile = new File("professor.key");
            File encFile = new File("resultados_gerais.txt.enc");
            File decFile = new File("resultados_gerais_restaurado.txt");

            if (!keyFile.exists()) {
                JOptionPane.showMessageDialog(null, "A chave 'professor.key' não foi encontrada!");
                return;
            }

            if (!encFile.exists()) {
                JOptionPane.showMessageDialog(null, "O arquivo criptografado 'resultados_gerais.txt.enc' não foi encontrado!");
                return;
            }

            // Carrega a chave e descriptografa
            SecretKey sk = AESKeyStore.loadKey(keyFile);
            CryptoAESGCM.decryptFile(encFile, decFile, sk);

            JOptionPane.showMessageDialog(null,
                "Arquivo descriptografado com sucesso!\n" +
                "Salvo como: " + decFile.getAbsolutePath());
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "Erro ao descriptografar o arquivo:\n" + e.getMessage());
        }
    }
}
