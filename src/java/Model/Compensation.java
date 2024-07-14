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
    private int staffId;
    private int accidentId;
    private BigInteger estimatedRepairCost;
    private String claimStatus;
    private Date dateFiled;
    private Date dateApproved;
    private String notes;

    public Compensation() {
    }

    public Compensation(int id, int contractId, int customerId, int staffId, int accidentId, BigInteger estimatedRepairCost, String claimStatus, Date dateFiled, Date dateApproved, String notes) {
        this.id = id;
        this.contractId = contractId;
        this.customerId = customerId;
        this.staffId = staffId;
        this.accidentId = accidentId;
        this.estimatedRepairCost = estimatedRepairCost;
        this.claimStatus = claimStatus;
        this.dateFiled = dateFiled;
        this.dateApproved = dateApproved;
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

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public int getAccidentId() {
        return accidentId;
    }

    public void setAccidentId(int accidentId) {
        this.accidentId = accidentId;
    }

    public BigInteger getEstimatedRepairCost() {
        return estimatedRepairCost;
    }

    public void setEstimatedRepairCost(BigInteger estimatedRepairCost) {
        this.estimatedRepairCost = estimatedRepairCost;
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

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "Compensation{" + "id=" + id + ", contractId=" + contractId + ", customerId=" + customerId + ", staffId=" + staffId + ", accidentId=" + accidentId + ", estimatedRepairCost=" + estimatedRepairCost + ", claimStatus=" + claimStatus + ", dateFiled=" + dateFiled + ", dateApproved=" + dateApproved + ", notes=" + notes + '}';
    }

   

    
   

    

}
