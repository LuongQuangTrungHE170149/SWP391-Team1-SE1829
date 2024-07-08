/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet(name = "UpdateProfileController", urlPatterns = {"/updateProfile"})
public class UpdateProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("updateProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("userId"));
        UserDAO udb = new UserDAO();
        User u = udb.getUserById(id);

        try {
            //update profile
            int gender = Integer.parseInt(request.getParameter("gender"));
            String email = request.getParameter("email");
            if (udb.checkEmailExist(email) & !email.equalsIgnoreCase(u.getEmail())) {
                request.setAttribute("invalidEmail", "Email '" + email + "' already exist! Please try another email!");
            } else {
                String phone = request.getParameter("phone");
                if (udb.checkPhoneExist(phone) & !phone.equalsIgnoreCase(u.getPhone())) {
                    request.setAttribute("invalidPhone", "Phone number '" + phone + "' already exist! Please try another phone number!");
                } else {
                    String address = request.getParameter("address");

                    String dobParam = request.getParameter("dob");
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    Date dobUtil = dateFormat.parse(dobParam);
                    java.sql.Date dob = new java.sql.Date(dobUtil.getTime());
                    //change password
                    System.out.println(udb.updateStaffProfileById(id, gender, email, phone, dob, address));
                    request.setAttribute("updateMessage", "Updated successfully!");
                }
            }
            User uAfterUpdate = udb.getUserById(id);
            request.setAttribute("user", uAfterUpdate);
            request.getRequestDispatcher("updateProfile.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }

    }

}
