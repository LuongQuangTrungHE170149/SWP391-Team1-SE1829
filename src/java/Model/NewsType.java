/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author thuhu
 */
public enum NewsType {
    HOAT_DONG_CONG_TY("Hoạt động công ty"),
    HOAT_DONG_XA_HOI("Hoạt động xã hội"),
    SAN_PHAM_DICH_VU("Sản phẩm - Dịch vụ");
    
    private final String typeName;
    
    NewsType(String typeName){
        this.typeName = typeName;
    }
    
    public String getTypeName(){
        return typeName;
    }
    
    
}
