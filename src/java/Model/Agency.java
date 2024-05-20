/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author tranm
 */
public class Agency {
    
    private int agencyId;
    private String agencyName;
    private String agencyAddress;
    private String hotline;
    private String worktime;
    private String status;

    public Agency() {
    }

    public Agency(int agencyId, String agencyName, String agencyAddress, String hotline, String worktime, String status) {
        this.agencyId = agencyId;
        this.agencyName = agencyName;
        this.agencyAddress = agencyAddress;
        this.hotline = hotline;
        this.worktime = worktime;
        this.status = status;
    }

    public int getAgencyId() {
        return agencyId;
    }

    public void setAgencyId(int agencyId) {
        this.agencyId = agencyId;
    }

    public String getAgencyName() {
        return agencyName;
    }

    public void setAgencyName(String agencyName) {
        this.agencyName = agencyName;
    }

    public String getAgencyAddress() {
        return agencyAddress;
    }

    public void setAgencyAddress(String agencyAddress) {
        this.agencyAddress = agencyAddress;
    }

    public String getHotline() {
        return hotline;
    }

    public void setHotline(String hotline) {
        this.hotline = hotline;
    }

    public String getWorktime() {
        return worktime;
    }

    public void setWorktime(String worktime) {
        this.worktime = worktime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Agency{" + "agencyId=" + agencyId + ", agencyName=" + agencyName + ", agencyAddress=" + agencyAddress + ", hotline=" + hotline + ", worktime=" + worktime + ", status=" + status + '}';
    }

    
    
   
    
}
