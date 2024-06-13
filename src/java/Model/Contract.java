/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author QUANG TRUNG
 */
public class Contract {
    private int contractId;
    private int customerId;
    private int staffId;
    private int agencyId;
    private int vehicleId;
    private Date startDate;
    private Date endDate;
    private int contractType;
    private String descripttion;
    private Double payment;
    private String status;

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

    public int getAgencyId() {
        return agencyId;
    }

    public void setAgencyId(int agencyId) {
        this.agencyId = agencyId;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getContractType() {
        return contractType;
    }

    public void setContractType(int contractType) {
        this.contractType = contractType;
    }

    public String getDescripttion() {
        return descripttion;
    }

    public void setDescripttion(String descripttion) {
        this.descripttion = descripttion;
    }

    public Double getPayment() {
        return payment;
    }

    public void setPayment(Double payment) {
        this.payment = payment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Contract(int contractId, int agencyId, Date startDate, Date endDate, int contractType, String descripttion, Double payment, String status) {
        this.contractId = contractId;
        this.agencyId = agencyId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.contractType = contractType;
        this.descripttion = descripttion;
        this.payment = payment;
        this.status = status;
    }

    public Contract() {
    }

    public Contract(int customerId, int staffId, int agencyId, int vehicleId, Date startDate, Date endDate, int contractType, String descripttion, Double payment, String status) {
        this.customerId = customerId;
        this.staffId = staffId;
        this.agencyId = agencyId;
        this.vehicleId = vehicleId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.contractType = contractType;
        this.descripttion = descripttion;
        this.payment = payment;
        this.status = status;
    }

    

    

    

   
    
}
