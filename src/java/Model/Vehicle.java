/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author QUANG TRUNG
 */
public class Vehicle {
    private int id;
    private String model;
    private String LicensePlates;
    private int ownerId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getLicensePlates() {
        return LicensePlates;
    }

    public void setLicensePlates(String LicensePlates) {
        this.LicensePlates = LicensePlates;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    public Vehicle() {
    }

    public Vehicle(int id, String model, String LicensePlates, int ownerId) {
        this.id = id;
        this.model = model;
        this.LicensePlates = LicensePlates;
        this.ownerId = ownerId;
    }

    public Vehicle(String model, String LicensePlates, int ownerId) {
        this.model = model;
        this.LicensePlates = LicensePlates;
        this.ownerId = ownerId;
    }
    
}
