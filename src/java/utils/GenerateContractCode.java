/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.security.SecureRandom;

/**
 *
 * @author thuhu
 */
public class GenerateContractCode {
    private static final String CHARACTERS = "QWERTYUPASDFGHJKLZXCVBNM1234567890";
    private static final int LENGTH = 12;
    private static final SecureRandom RANDOM = new SecureRandom();
    
    public static String generateContractCode(){
        StringBuilder contractCode = new StringBuilder(LENGTH);
        for(int i = 0; i<=LENGTH-1;i++){
            int index = RANDOM.nextInt(CHARACTERS.length());
            contractCode.append(CHARACTERS.charAt(index));
        }
        return contractCode.toString();
    }
}
