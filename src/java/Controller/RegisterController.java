package Controller;

import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String raw_username = req.getParameter("userName");
        String raw_firstName = req.getParameter("firstName");
        String raw_lastName = req.getParameter("lastName");
        String raw_password = req.getParameter("password");
        String raw_rePassword = req.getParameter("rePassword");
        String raw_phone = req.getParameter("phone");
        String raw_email = req.getParameter("email");
        String raw_dob = req.getParameter("dob");
        String raw_address = req.getParameter("address");
        String raw_gender = req.getParameter("gender");
        int gender;
        Date dob;
        try {
            gender = Integer.parseInt(raw_gender);
            dob = Date.valueOf(raw_dob);
        } catch (Exception e) {
            log(e.getMessage());
            req.setAttribute("message", "Invalid gender or dob");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
        User user = new User();
        
    }
    
}
