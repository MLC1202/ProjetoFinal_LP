package Arquivos;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

public class CryptoAESGCM {
    private static final String TRANSFORM = "AES/GCM/NoPadding";
    private static final int IV_LEN = 12;          // 96 bits
    private static final int TAG_LEN_BITS = 128;   // 16 bytes de tag
    private static final int MAGIC = 0x51455A31;   // "QEZ1"
    private static final byte VERSION = 1;

    public static void encryptFile(File in, File out, SecretKey key) throws Exception {
        byte[] plaintext = Files.readAllBytes(in.toPath());

        byte[] iv = new byte[IV_LEN];
        new SecureRandom().nextBytes(iv);

        Cipher c = Cipher.getInstance(TRANSFORM);
        c.init(Cipher.ENCRYPT_MODE, key, new GCMParameterSpec(TAG_LEN_BITS, iv));
        byte[] cipher = c.doFinal(plaintext);

        try (DataOutputStream dos = new DataOutputStream(new FileOutputStream(out))) {
            dos.writeInt(MAGIC);
            dos.writeByte(VERSION);
            dos.write(iv);
            dos.write(cipher);
        }
    }

    public static void decryptFile(File in, File out, SecretKey key) throws Exception {
        try (DataInputStream dis = new DataInputStream(new FileInputStream(in))) {
            int magic = dis.readInt();
            if (magic != MAGIC) throw new SecurityException("Formato inválido");
            byte ver = dis.readByte();
            if (ver != VERSION) throw new SecurityException("Versão não suportada");

            byte[] iv = dis.readNBytes(IV_LEN);
            byte[] cipher = dis.readAllBytes();

            Cipher c = Cipher.getInstance(TRANSFORM);
            c.init(Cipher.DECRYPT_MODE, key, new GCMParameterSpec(TAG_LEN_BITS, iv));
            byte[] plain = c.doFinal(cipher);
            try (FileOutputStream fos = new FileOutputStream(out)) {
                fos.write(plain);
            }
        }
    }
}