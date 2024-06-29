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
public class Accident {
    
    private int id;
    private int customerId;
    private Date dateOfAccident;
    private String accidentLocation;
    private String policeReportNumber;
    private String descriptionOfAccident;
    private String vehicleDamage;
    private String image;

    public Accident() {
    }

    public Accident(int id, int customerId, Date dateOfAccident, String accidentLocation, String policeReportNumber, String descriptionOfAccident, String vehicleDamage, String image) {
        this.id = id;
        this.customerId = customerId;
        this.dateOfAccident = dateOfAccident;
        this.accidentLocation = accidentLocation;
        this.policeReportNumber = policeReportNumber;
        this.descriptionOfAccident = descriptionOfAccident;
        this.vehicleDamage = vehicleDamage;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public Date getDateOfAccident() {
        return dateOfAccident;
    }

    public void setDateOfAccident(Date dateOfAccident) {
        this.dateOfAccident = dateOfAccident;
    }

    public String getAccidentLocation() {
        return accidentLocation;
    }

    public void setAccidentLocation(String accidentLocation) {
        this.accidentLocation = accidentLocation;
    }

    public String getPoliceReportNumber() {
        return policeReportNumber;
    }

    public void setPoliceReportNumber(String policeReportNumber) {
        this.policeReportNumber = policeReportNumber;
    }

    public String getDescriptionOfAccident() {
        return descriptionOfAccident;
    }

    public void setDescriptionOfAccident(String descriptionOfAccident) {
        this.descriptionOfAccident = descriptionOfAccident;
    }

    public String getVehicleDamage() {
        return vehicleDamage;
    }

    public void setVehicleDamage(String vehicleDamage) {
        this.vehicleDamage = vehicleDamage;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Accident{" + "id=" + id + ", customerId=" + customerId + ", dateOfAccident=" + dateOfAccident + ", accidentLocation=" + accidentLocation + ", policeReportNumber=" + policeReportNumber + ", descriptionOfAccident=" + descriptionOfAccident + ", vehicleDamage=" + vehicleDamage + ", image=" + image + '}';
    }
    
    
    
}
