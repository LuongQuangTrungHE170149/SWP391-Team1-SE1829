package Controller;

import Model.Gender;
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
        UserDAO dbUser = new UserDAO();

        String username = req.getParameter("username");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String password = req.getParameter("password");
        String rePassword = req.getParameter("rePassword");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String raw_dob = req.getParameter("dob");
        String address = req.getParameter("address");
        String raw_gender = req.getParameter("gender");
        int gender;
        Date dob = null;
        try {
            gender = Integer.parseInt(raw_gender);
            dob = Date.valueOf(raw_dob);
        } catch (Exception e) {
            log(e.getMessage());
//            req.setAttribute("message", "Invalid gender or dob");
//            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
        User user = new User();
        user.setUsername(username);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPassword(password);
        user.setRole(Role.CUSTOMER.getValue());
        user.setGender(Gender.MALE.getValue());
        user.setEmail(email);
        user.setPhone(phone);
        user.setDob(dob);
        user.setAddress(address);
        String OTPCode = EmailHelper.generateOTP();
        String bodyEmailOTP = "Your veriftication code is: " + OTPCode;
        req.getSession().setAttribute("OTP", OTPCode);
        req.getSession().setAttribute("userRegister", user);
        EmailHelper.sendEmail(email, EmailHelper.TITLE_PROJECT, bodyEmailOTP);
//        dbUser.insert(user);
        req.getRequestDispatcher("confirmOTP.jsp").forward(req, resp);
    }

}
