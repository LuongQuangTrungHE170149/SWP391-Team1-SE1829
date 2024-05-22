/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author tranm
 */
public class User {
        
    private int id;
    private String username;
    private String firstName;
    private String lastName;
    private String role;
    private int gender;
    private String email;
    private String phoneNumber;
    private Date date;
    private String address;

    public User() {
    }

    public User(int id, String username, String firstName, String lastName, String role, int gender, String email, String phoneNumber, Date date, String address) {
        this.id = id;
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.role = role;
        this.gender = gender;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.date = date;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    
   

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", firstName=" + firstName + ", lastName=" + lastName + ", role=" + role + ", gender=" + gender + ", email=" + email + ", phoneNumber=" + phoneNumber + ", date=" + date + ", address=" + address + '}';
    }
    
    
    
    
}
