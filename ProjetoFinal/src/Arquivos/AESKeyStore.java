package Arquivos;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.security.SecureRandom;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class AESKeyStore {
    // Gera e salva chave AES (256 se disponível; senão 128)
    public static void generateKey(File keyFile) throws Exception {
        KeyGenerator kg = KeyGenerator.getInstance("AES");
        try {
            kg.init(256, new SecureRandom());
        } catch (Exception e) {
            kg.init(128, new SecureRandom()); // fallback
        }
        SecretKey sk = kg.generateKey();
        try (FileOutputStream fos = new FileOutputStream(keyFile)) {
            fos.write(sk.getEncoded());
        }
    }

    public static SecretKey loadKey(File keyFile) throws Exception {
        byte[] raw = Files.readAllBytes(keyFile.toPath());
        return new SecretKeySpec(raw, "AES");
    }
}
