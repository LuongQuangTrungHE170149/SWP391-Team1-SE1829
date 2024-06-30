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
    private String ownerFirstName;
    private String ownerLastName;
    private String ownerAddress;
    private VehicleType motocycleType;
    private String licensePlates;
    private String chassis;
    private String engine;

    public Vehicle() {
    }

    public Vehicle(int id, String ownerFirstName, String ownerLastName, String ownerAddress, VehicleType motocycleType, String licensePlates, String chassis, String engine) {
        this.id = id;
        this.ownerFirstName = ownerFirstName;
        this.ownerLastName = ownerLastName;
        this.ownerAddress = ownerAddress;
        this.motocycleType = motocycleType;
        this.licensePlates = licensePlates;
        this.chassis = chassis;
        this.engine = engine;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOwnerFirstName() {
        return ownerFirstName;
    }

    public void setOwnerFirstName(String ownerFirstName) {
        this.ownerFirstName = ownerFirstName;
    }

    public String getOwnerLastName() {
        return ownerLastName;
    }

    public void setOwnerLastName(String ownerLastName) {
        this.ownerLastName = ownerLastName;
    }

    public String getOwnerAddress() {
        return ownerAddress;
    }

    public void setOwnerAddress(String ownerAddress) {
        this.ownerAddress = ownerAddress;
    }

    public VehicleType getMotocycleType() {
        return motocycleType;
    }

    public void setMotocycleType(VehicleType motocycleType) {
        this.motocycleType = motocycleType;
    }

    public String getLicensePlates() {
        return licensePlates;
    }

    public void setLicensePlates(String licensePlates) {
        this.licensePlates = licensePlates;
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

    @Override
    public String toString() {
        return "Vehicle{" + "id=" + id + ", motocycleType=" + motocycleType + ", LicensePlates=" + licensePlates + ", chassis=" + chassis + ", engine=" + engine + ", ownerFirstName=" + ownerFirstName+ ", ownerLastName=" + ownerLastName+ ", ownerAddress=" + ownerAddress;
    }

}
