/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

/**
 *
 * @author trand
 */
public class StringUtils {

    public static String REGEX_CHARACTER_AND_NUMBERS = "^[a-zA-Z0-9]+$";
    public static String REGEX_PHONE = "[0-9]{10,15}$";
    public static String REGEX_EMAIL = "^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";

    public static boolean isEmpty(String message) {
        return message == null || message.trim().length() == 0;
    }

    public static boolean isMaxLength(String message) {
        return message.trim().length() < 0 || message.trim().length() > 255;
    }

    public static boolean isOnlyCharacterAndNumber(String message) {
        return message.trim().matches(REGEX_CHARACTER_AND_NUMBERS);
    }

    public static boolean isValidPhone(String message) {
        return message.trim().matches(REGEX_PHONE);
    }
    
    public static boolean isValidEmail(String message) {
        return message.trim().matches(REGEX_EMAIL);
    }
}
