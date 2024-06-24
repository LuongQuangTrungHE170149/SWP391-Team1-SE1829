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
import java.io.IOException;

/**
 *
 * @author trand
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/changePassword"})
public class ChangePasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("changePassword.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User userForgetPassword = (User) req.getSession().getAttribute("userRegister");
        User user = (User) req.getSession().getAttribute("user");
        UserDAO dbUser = new UserDAO();
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        String rePassword = req.getParameter("rePassword");

        if (oldPassword != null && oldPassword.length() > 0) {
            if (!user.getPassword().equals(oldPassword)) {
                req.setAttribute("message", "Your old password is incorrect");
                req.getRequestDispatcher("changePassword.jsp").forward(req, resp);
            } else {
                if (!newPassword.equals(rePassword)) {
                    req.setAttribute("message", "Your repeat password is incorrect");
                    req.getRequestDispatcher("changePassword.jsp").forward(req, resp);
                } else {
                    dbUser.changePassword(user.getId(), newPassword);
                    user.setPassword(newPassword);
                    req.getSession().removeAttribute("user");
                    req.getSession().setAttribute("user", user);
                    req.getRequestDispatcher("home.jsp").forward(req, resp);
                }
            }
        } else if (oldPassword == null || oldPassword.length() == 0) {
            if (!newPassword.equals(rePassword)) {
                req.setAttribute("message", "Your repeat password is incorrect");
                req.getRequestDispatcher("changePassword.jsp").forward(req, resp);
            } else {
                dbUser.changePassword(userForgetPassword.getId(), newPassword);
                req.setAttribute("message", "You change your password successfully!!");
                req.getRequestDispatcher("login.jsp").forward(req, resp);

            }
        }

    }

}
