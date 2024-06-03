/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author tranm
 */
public class StaffWorkplace {
    private int id;
    private int agencyId;
    private int staffId;
    private String status;

    public StaffWorkplace() {
    }

    public StaffWorkplace(int id, int agencyId, int staffId, String status) {
        this.id = id;
        this.agencyId = agencyId;
        this.staffId = staffId;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAgencyId() {
        return agencyId;
    }

    public void setAgencyId(int agencyId) {
        this.agencyId = agencyId;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "StaffWorkplace{" + "id=" + id + ", agencyId=" + agencyId + ", staffId=" + staffId + ", status=" + status + '}';
    }

    
}
