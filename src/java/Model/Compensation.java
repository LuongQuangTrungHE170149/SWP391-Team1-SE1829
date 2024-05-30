/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.math.BigInteger;

/**
 *
 * @author tranm
 */
public class Compensation {
    
    private int id;
    private int contractId;
    private String description;
    private String type;
    private BigInteger payment;
    private int isPay;

    public Compensation() {
    }

    public Compensation(int id, int contractId, String description, String type, BigInteger payment, int isPay) {
        this.id = id;
        this.contractId = contractId;
        this.description = description;
        this.type = type;
        this.payment = payment;
        this.isPay = isPay;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public BigInteger getPayment() {
        return payment;
    }

    public void setPayment(BigInteger payment) {
        this.payment = payment;
    }

    public int getIsPay() {
        return isPay;
    }

    public void setIsPay(int isPay) {
        this.isPay = isPay;
    }
    
    
    
}
