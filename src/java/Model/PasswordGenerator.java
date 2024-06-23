/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.security.SecureRandom;

/**
 *
 * @author QUANG TRUNG
 */
public class PasswordGenerator {
     private static final String UPPERCASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String LOWERCASE = "abcdefghijklmnopqrstuvwxyz";
    private static final String DIGITS = "0123456789";
    private static final String SPECIAL_CHARACTERS = "!@#$%^&*()-_=+<>?";

    public static String generateRandomPassword(int length, boolean useUppercase, boolean useLowercase, boolean useDigits, boolean useSpecial) {
        StringBuilder characterSet = new StringBuilder();

        if (useUppercase) {
            characterSet.append(UPPERCASE);
        }
        if (useLowercase) {
            characterSet.append(LOWERCASE);
        }
        if (useDigits) {
            characterSet.append(DIGITS);
        }
        if (useSpecial) {
            characterSet.append(SPECIAL_CHARACTERS);
        }

        if (characterSet.length() == 0) {
            throw new IllegalArgumentException("At least one character type must be selected");
        }

        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(characterSet.length());
            password.append(characterSet.charAt(randomIndex));
        }

        return password.toString();
    }
}
