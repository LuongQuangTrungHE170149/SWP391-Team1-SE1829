/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.math.BigInteger;
import java.sql.Date;

/**
 *
 * @author tranm
 */
public class Compensation {

    private int id;
    private int contractId;
    private int customerId;
    private Date dateOfAccident;
    private String accidentLocation;
    private String policeReportNumber;
    private String descriptionOfAccident;
    private String vehicleDamage;
    private BigInteger EstimatedRepairCost;
    private String claimStatus;
    private Date dateFiled;
    private Date dateApproved;
    private BigInteger paymentAmount;
    private Date paymentDate;
    private String notes;

    public Compensation() {
    }

    public Compensation(int id, int contractId, int customerId, Date dateOfAccident, String accidentLocation, String policeReportNumber, String descriptionOfAccident, String vehicleDamage, BigInteger EstimatedRepairCost, String claimStatus, Date dateFiled, Date dateApproved, BigInteger paymentAmount, Date paymentDate, String notes) {
        this.id = id;
        this.contractId = contractId;
        this.customerId = customerId;
        this.dateOfAccident = dateOfAccident;
        this.accidentLocation = accidentLocation;
        this.policeReportNumber = policeReportNumber;
        this.descriptionOfAccident = descriptionOfAccident;
        this.vehicleDamage = vehicleDamage;
        this.EstimatedRepairCost = EstimatedRepairCost;
        this.claimStatus = claimStatus;
        this.dateFiled = dateFiled;
        this.dateApproved = dateApproved;
        this.paymentAmount = paymentAmount;
        this.paymentDate = paymentDate;
        this.notes = notes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
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

    public BigInteger getEstimatedRepairCost() {
        return EstimatedRepairCost;
    }

    public void setEstimatedRepairCost(BigInteger EstimatedRepairCost) {
        this.EstimatedRepairCost = EstimatedRepairCost;
    }

    public String getClaimStatus() {
        return claimStatus;
    }

    public void setClaimStatus(String claimStatus) {
        this.claimStatus = claimStatus;
    }

    public Date getDateFiled() {
        return dateFiled;
    }

    public void setDateFiled(Date dateFiled) {
        this.dateFiled = dateFiled;
    }

    public Date getDateApproved() {
        return dateApproved;
    }

    public void setDateApproved(Date dateApproved) {
        this.dateApproved = dateApproved;
    }

    public BigInteger getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(BigInteger paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "Compensation{" + "id=" + id + ", contractId=" + contractId + ", customerId=" + customerId + ", dateOfAccident=" + dateOfAccident + ", accidentLocation=" + accidentLocation + ", policeReportNumber=" + policeReportNumber + ", descriptionOfAccident=" + descriptionOfAccident + ", vehicleDamage=" + vehicleDamage + ", EstimatedRepairCost=" + EstimatedRepairCost + ", claimStatus=" + claimStatus + ", dateFiled=" + dateFiled + ", dateApproved=" + dateApproved + ", paymentAmount=" + paymentAmount + ", paymentDate=" + paymentDate + ", notes=" + notes + '}';
    }


    

}
