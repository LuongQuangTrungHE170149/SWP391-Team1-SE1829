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
    private int vehicleId;
    private Date startDate;
    private Date endDate;
    private String contractType;
    private String description;
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

    public String getContractType() {
        return contractType;
    }

    public void setContractType(String contractType) {
        this.contractType = contractType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String descripttion) {
        this.description = descripttion;
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

    public Contract(int contractId, Date startDate, Date endDate, String contractType, String description, Double payment, String status) {
        this.contractId = contractId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.contractType = contractType;
        this.description = description;
        this.payment = payment;
        this.status = status;
    }

    public Contract() {
    }

    public Contract(int customerId, int staffId, int vehicleId, Date startDate, Date endDate, String contractType, String description, Double payment, String status) {
        this.customerId = customerId;
        this.staffId = staffId;
        this.vehicleId = vehicleId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.contractType = contractType;
        this.description = description;
        this.payment = payment;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Contract{" + "contractId=" + contractId + ", customerId=" + customerId + ", staffId=" + staffId + ", vehicleId=" + vehicleId + ", startDate=" + startDate + ", endDate=" + endDate + ", contractType=" + contractType + ", description=" + description + ", payment=" + payment + ", status=" + status + '}';
    }

}
