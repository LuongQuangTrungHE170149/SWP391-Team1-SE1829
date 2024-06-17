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
    private String motocycleType;
    private String LicensePlates;
    private String chassis;

    public String getMtocycleType() {
        return motocycleType;
    }

    public void setMtocycleType(String MtocycleType) {
        this.motocycleType = MtocycleType;
    }

    public String getChassis() {
        return chassis;
    }

    public void setChassis(String chassis) {
        this.chassis = chassis;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }
    private String engine;
    private int ownerId;
    private boolean hasContract;

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Vehicle(int id, String motocycleType, String LicensePlates, String chassis, String engine, int ownerId, boolean hasContract) {
        this.id = id;
        this.motocycleType = motocycleType;
        this.LicensePlates = LicensePlates;
        this.chassis = chassis;
        this.engine = engine;
        this.ownerId = ownerId;
        this.hasContract = hasContract;
    }

    public Vehicle(String motocycleType, String LicensePlates, String chassis, String engine, int ownerId, boolean hasContract) {
        this.motocycleType = motocycleType;
        this.LicensePlates = LicensePlates;
        this.chassis = chassis;
        this.engine = engine;
        this.ownerId = ownerId;
        this.hasContract = hasContract;
    }

    public Vehicle() {
    }

    public boolean isHasContract() {
        return hasContract;
    }

    public void setHasContract(boolean hasContract) {
        this.hasContract = hasContract;
    }

    
    
}
