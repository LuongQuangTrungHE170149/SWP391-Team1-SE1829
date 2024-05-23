package Model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author trand
 */
public enum Gender {
    MALE(1),
    FEMALE(0),
    OTHER(2);

    private final int value;

    private Gender(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

}
