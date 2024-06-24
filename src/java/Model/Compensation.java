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
    private int accidentId;
    private BigInteger estimatedRepairCost;
    private String claimStatus;
    private Date dateFiled;
    private Date dateApproved;
    private BigInteger paymentAmount;
    private Date paymentDate;
    private String notes;

    public Compensation() {
    }

    public Compensation(int id, int contractId, int customerId, int accidentId, BigInteger estimatedRepairCost, String claimStatus, Date dateFiled, Date dateApproved, BigInteger paymentAmount, Date paymentDate, String notes) {
        this.id = id;
        this.contractId = contractId;
        this.customerId = customerId;
        this.accidentId = accidentId;
        this.estimatedRepairCost = estimatedRepairCost;
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
        return "Compensation{" + "id=" + id + ", contractId=" + contractId + ", customerId=" + customerId + ", accidentId=" + accidentId + ", estimatedRepairCost=" + estimatedRepairCost + ", claimStatus=" + claimStatus + ", dateFiled=" + dateFiled + ", dateApproved=" + dateApproved + ", paymentAmount=" + paymentAmount + ", paymentDate=" + paymentDate + ", notes=" + notes + '}';
    }

    
   

    

}
