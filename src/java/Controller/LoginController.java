/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.User;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author trand
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("user");
        if (u != null) {
            if (u.getRole().equalsIgnoreCase("staff")) {
                resp.sendRedirect("ConsultationManagement");
            } else if (u.getRole().equalsIgnoreCase("user")) {
                resp.sendRedirect("home");
            } else if (u.getRole().equalsIgnoreCase("manager")) {
                resp.sendRedirect("managerManagement");
            }
        } else {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String usernameEmail = req.getParameter("usernameEmail");
        String password = req.getParameter("password");

        UserDAO dbUser = new UserDAO();
        User user = dbUser.findByUsernameOrEmailAndPassword(usernameEmail, password);
        if (user == null) {
            req.setAttribute("message", "You login failed");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            if(user.getRole().equalsIgnoreCase("user")){
                resp.sendRedirect("home");
            }else if(user.getRole().equalsIgnoreCase("staff")){
                resp.sendRedirect("ConsultationManagement");
            }else if(user.getRole().equalsIgnoreCase("manager")){
                resp.sendRedirect("managerManagement");
            }
            
        }
    }

}
