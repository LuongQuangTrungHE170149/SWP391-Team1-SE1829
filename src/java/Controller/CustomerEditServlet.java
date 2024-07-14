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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author tranm
 */
public class CustomerEditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerEditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerEditServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            if (user.getRole().equalsIgnoreCase("manager")) {
                String id = request.getParameter("customerId");
                UserDAO udb = new UserDAO();
                if (id != null) {
                    try {
                        int customerId = Integer.parseInt(id);
                        User user1 = udb.getUserById(customerId);
                        request.setAttribute("user", user1);
                    } catch (NumberFormatException e) {
                        System.out.println(e);
                    }

                }

                request.getRequestDispatcher("customerEdit.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");

            }

        } else {
            response.sendRedirect("login");

        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("customerId"));
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String address = request.getParameter("address");
            String dob = request.getParameter("dob");
            String customerStatus = request.getParameter("customerStatus");
            String phone = request.getParameter("phone");
            String genderRaw = request.getParameter("gender");
            String email = request.getParameter("email");
            int gender = Integer.parseInt(genderRaw);
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            Date utilDate = formatter.parse(dob);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            User user = new User();
            user.setId(id);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setAddress(address);
            user.setDob(sqlDate);
            user.setStatus(customerStatus);
            user.setPhone(phone);
            user.setGender(gender);
            user.setEmail(email);
            UserDAO udb = new UserDAO();
            User u = udb.getUserById(id);

            if (udb.checkEmailExistById(email) & !email.equalsIgnoreCase(u.getEmail())) {
                request.setAttribute("invalidEmail", "Email '" + email + "' đã tồn tại! Vui lòng nhập email khác!");

            } else {
                if (udb.checkPhoneExistById(phone) & !phone.equalsIgnoreCase(u.getPhone())) {

                    request.setAttribute("invalidPhone", "Số điện thoại '" + phone + "' đã tồn tại! Vui lòng nhập số điện thoại khác!");

                } else {
                    HttpSession session = request.getSession();
                    if (udb.updateUserById(user)) {
                        session.setAttribute("updateSuccess", "Chỉnh sửa khách hàng thành công");

                    } else {
                        session.setAttribute("updateFail", "Chỉnh sửa khách hàng thất bại");

                    }

                }

            }
            User uAfterUpdate = udb.getUserById(id);
            request.setAttribute("user", uAfterUpdate);
            request.getRequestDispatcher("customerEdit.jsp").forward(request, response);

        } catch (ParseException e) {
            response.sendRedirect("customerList");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
