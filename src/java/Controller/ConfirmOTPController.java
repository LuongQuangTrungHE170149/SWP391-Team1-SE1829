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
import java.io.PrintWriter;
import utils.EmailHelper;

/**
 *
 * @author trand
 */
@WebServlet(name = "ConfirmOTPController", urlPatterns = {"/confirmOTP"})
public class ConfirmOTPController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = (User) req.getSession().getAttribute("userRegister");
        if (u != null) {
            String OTPCode = EmailHelper.generateOTP();
            req.getSession().setAttribute("OTPCode", OTPCode);
            System.out.println("OTP: " + OTPCode);

            String bodyEmailOTP = "Your veriftication code is: " + OTPCode;
            EmailHelper.sendEmail(u.getEmail(), EmailHelper.TITLE_PROJECT, bodyEmailOTP);
            req.getRequestDispatcher("confirmOTP.jsp").forward(req, resp);
        }
        PrintWriter out = resp.getWriter();
        out.println("<html><body>");
        out.println("<h1>Error</h1>");
        out.println("<p>An error occurred</p>");
        out.println("</body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String OTPCode = (String) req.getSession().getAttribute("OTPCode");
        String ConfirmOTPCode = req.getParameter("ConfirmOTPCode");
        System.out.println("otp: " + OTPCode);
        System.out.println("confirm: " + ConfirmOTPCode);

        if (OTPCode.equals(ConfirmOTPCode)) {
            String op = (String) req.getSession().getAttribute("op");
            System.out.println(op);
            User u = (User) req.getSession().getAttribute("userRegister");
            UserDAO udb = new UserDAO();
            req.getSession().removeAttribute("OTPCode");
            if ("change-password".equals(op)) {
                udb.update(u);
                resp.sendRedirect("changePassword");
            } else if ("register".equals(op)) {
                System.out.println(udb.insert(u));
                req.getSession().invalidate();
                resp.sendRedirect("login");
            }

        } else {
            req.setAttribute("error", "Mã OTP không chính xác!");
            req.getRequestDispatcher("confirmOTP.jsp").forward(req, resp);
        }

    }

}