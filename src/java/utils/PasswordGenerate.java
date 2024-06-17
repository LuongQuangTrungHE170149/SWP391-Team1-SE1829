/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.security.SecureRandom;

/**
 *
 * @author trand
 */
public class PasswordGenerate {
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final int PASSWORD_LENGTH = 8;
    private static final SecureRandom RANDOM = new SecureRandom();

    public static String generatePassword() {
        StringBuilder password = new StringBuilder(PASSWORD_LENGTH);
        for (int i = 0; i < PASSWORD_LENGTH; i++) {
            int index = RANDOM.nextInt(CHARACTERS.length());
            password.append(CHARACTERS.charAt(index));
        }
        return password.toString();
    }

    public static void main(String[] args) {
        // Tạo userID và mật khẩu
        String userID = UserIDGenerator.generateUserID();
        String password = generatePassword();

//        // Lưu userID và mật khẩu vào cơ sở dữ liệu
//        UserDatabase.saveUser(userID, password);
//        System.out.println("UserID: " + userID + ", Password: " + password + " đã được lưu vào cơ sở dữ liệu.");
    } 
}
