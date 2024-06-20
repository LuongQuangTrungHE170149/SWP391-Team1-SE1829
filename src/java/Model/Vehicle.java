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
    private String engine;
    private int ownerId;
    private boolean hasContract;

    public Vehicle() {
    }

    public Vehicle(int id, String motocycleType, String LicensePlates, String chassis, String engine, int ownerId) {
        this.id = id;
        this.motocycleType = motocycleType;
        this.LicensePlates = LicensePlates;
        this.chassis = chassis;
        this.engine = engine;
        this.ownerId = ownerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMotocycleType() {
        return motocycleType;
    }

    public void setMotocycleType(String motocycleType) {
        this.motocycleType = motocycleType;
    }

    public String getLicensePlates() {
        return LicensePlates;
    }

    public void setLicensePlates(String LicensePlates) {
        this.LicensePlates = LicensePlates;
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

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    public boolean isHasContract() {
        return hasContract;
    }

    public void setHasContract(boolean hasContract) {
        this.hasContract = hasContract;
    }
    
 

    @Override
    public String toString() {
        return "Vehicle{" + "id=" + id + ", motocycleType=" + motocycleType + ", LicensePlates=" + LicensePlates + ", chassis=" + chassis + ", engine=" + engine + ", ownerId=" + ownerId + ", hasContract=" + hasContract + '}';
    }

    

    
    
}
