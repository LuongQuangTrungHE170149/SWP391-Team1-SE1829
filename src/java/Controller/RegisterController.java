package Controller;

import Model.Role;
import Model.User;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import utils.EmailHelper;

@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody


        UserDAO udb = new UserDAO();
        try {

            String username = req.getParameter("username");
            String firstName = req.getParameter("firstName");
            String lastName = req.getParameter("lastName");
            String dob = req.getParameter("dob");
            int gender = Integer.parseInt(req.getParameter("gender"));
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String confirmPassword = req.getParameter("confirmPassword");
            String phone = req.getParameter("phone");
            String address = req.getParameter("address");
            Date dobValue = Date.valueOf(dob);
            if (!udb.checkEmailExist(email)) {
                if (!udb.checkUsernameExist(username)) {
                    if (password.equals(confirmPassword)) {
                        if (!udb.checkPhoneExist(phone)) {
                            User user = new User();
                            user.setUsername(username);
                            user.setFirstName(firstName);
                            user.setLastName(lastName);
                            user.setPassword(password);
                            user.setRole(Role.USER.getValue());
                            user.setGender(gender);
                            user.setEmail(email);
                            user.setPhone(phone);
                            user.setDob(dobValue);
                            user.setAddress(address);
                            req.getSession().setAttribute("userRegister", user);
                            req.getSession().setAttribute("op", "register");

//                            String OTPCode = EmailHelper.generateOTP();
//                            String bodyEmailOTP = "Your register veriftication code is: " + OTPCode;
//                            req.getSession().setAttribute("OTP", OTPCode);
//                            EmailHelper.sendEmail(user.getEmail(), EmailHelper.TITLE_PROJECT, bodyEmailOTP);

                            resp.sendRedirect("confirmOTP");

                        } else {
                            req.setAttribute("invalidPhone", "Phone number already exist!");
                        }
                    } else {
                        req.setAttribute("invalidConfirmPassword", "Password and Confirm password do not match!");
                    }
                } else {
                    req.setAttribute("invalidUsername", "Username already exist!");
                }
            } else {
                req.setAttribute("invalidEmail", "Email already exist!");
            }
            req.setAttribute("firstName", firstName);
            req.setAttribute("lastName", lastName);
            req.setAttribute("dob", dob);
            req.setAttribute("phone", phone);
            req.setAttribute("gender", gender);
            req.setAttribute("email", email);
            req.setAttribute("username", username);
            req.setAttribute("address", address);

            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println(e);
        }

    }

}
