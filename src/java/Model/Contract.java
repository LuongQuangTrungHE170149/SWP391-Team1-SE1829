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
    private Vehicle vehicle;
    private Date startDate;
    private Date endDate;
    private boolean isAccidentInsurance;
    private String description;
    private String code;
    private Double payment;
    private String status;

    public Contract() {
    }

    public Contract(int contractId, int customerId, int staffId, Vehicle vehicle, Date startDate, Date endDate, boolean isAccidentInsurance, String description, String code, Double payment, String status) {
        this.contractId = contractId;
        this.customerId = customerId;
        this.staffId = staffId;
        this.vehicle = vehicle;
        this.startDate = startDate;
        this.endDate = endDate;
        this.isAccidentInsurance = isAccidentInsurance;
        this.description = description;
        this.code = code;
        this.payment = payment;
        this.status = status;
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

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
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

    public boolean isIsAccidentInsurance() {
        return isAccidentInsurance;
    }

    public void setIsAccidentInsurance(boolean isAccidentInsurance) {
        this.isAccidentInsurance = isAccidentInsurance;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    @Override
    public String toString() {
        return "Contract{" + "contractId=" + contractId + ", customerId=" + customerId + ", staffId=" + staffId + ", vehicleId=" + vehicle+ ", startDate=" + startDate + ", endDate=" + endDate + ", isAccidentInsurance=" + isAccidentInsurance + ", code=" + code + ", description=" + description + ", payment=" + payment + ", status=" + status + '}';
    }

}
