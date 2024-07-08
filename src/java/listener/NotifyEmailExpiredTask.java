/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package listener;

import Model.Contract;
import Model.User;
import dal.ContractDAO;
import dal.UserDAO;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.List;
import java.util.TimerTask;
import utils.EmailHelper;

/**
 *
 * @author trand
 */
public class NotifyEmailExpiredTask extends TimerTask{

    @Override
    public void run() {
        UserDAO dbUser = new UserDAO();
        ContractDAO dbContract = new ContractDAO();
        List<Contract> contracts = dbContract.getAll();
        for (Contract contract : contracts) {
            java.sql.Date endDate = contract.getEndDate();
            java.util.Date utilEndDate = new java.util.Date(endDate.getTime());
            
            LocalDate localDate = utilEndDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            
            LocalDate today = LocalDate.now();
            
            LocalDate date7DaysAfter = today.plusDays(7);
            
            if(localDate.isBefore(date7DaysAfter)){
                System.out.println("Send Email hehe");
                User user = dbUser.getUserById(contract.getCustomer().getId());
                //EmailHelper.sendEmail(user.getEmail(), EmailHelper.TITLE_PROJECT, "Your contract with id"+ contract.getContractId());
            }
        }
    }
    
}
