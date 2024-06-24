/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Role;
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

/**
 *
 * @author tranm
 */
public class CustomerAddServlet extends HttpServlet {

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
            out.println("<title>Servlet CustomerAddServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerAddServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("customerAdd.jsp").forward(request, response);
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
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String address = request.getParameter("address");
            String dob = request.getParameter("dob");
            String phone = request.getParameter("phone");
            String genderRaw = request.getParameter("gender");
            String email = request.getParameter("email");
            int gender = Integer.parseInt(genderRaw);
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            Date utilDate = formatter.parse(dob);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmPass = request.getParameter("confirmPassword");
            User user = new User();
            boolean checkSuccess = false;
            UserDAO udb = new UserDAO();

            if (!udb.checkEmailExist(email)) {
                if (!udb.checkUsernameExist(username)) {
                    if (password.equals(confirmPass)) {
                        if (!udb.checkPhoneExist(phone)) {
                            user.setFirstName(firstName);
                            user.setLastName(lastName);
                            user.setAddress(address);
                            user.setDob(sqlDate);
                            user.setPhoneNumber(phone);
                            user.setGender(gender);
                            user.setEmail(email);
                            user.setRole("customer");
                            user.setUsername(username);
                            user.setPassword(password);
                            HttpSession session = request.getSession();
                            if (udb.insert(user)) {
                                session.setAttribute("addSuccess", "Thêm khách hàng thành công");
                                checkSuccess = true;

                            } else {
                                session.setAttribute("addFail", "Thêm khách hàng thất bại");

                            }
                        } else {
                            request.setAttribute("invalidPhone", "Số điện thoại đã tồn tại");
                        }
                    } else {
                        request.setAttribute("invalidConfirmPassword", "Xác nhận mật khẩu không trùng khớp");
                    }
                } else {
                    request.setAttribute("invalidUsername", "Tài khoản đã tồn tại");
                }
            } else {
                request.setAttribute("invalidEmail", "Email đã tồn tại");
            }

            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            request.setAttribute("dob", dob);
            request.setAttribute("phone", phone);
            request.setAttribute("gender", gender);
            request.setAttribute("email", email);
            request.setAttribute("username", username);
            request.setAttribute("address", address);
            if (checkSuccess) {
                response.sendRedirect("customerList");

            } else {
                request.getRequestDispatcher("customerAdd.jsp").forward(request, response);

            }

        } catch (ParseException e) {
            System.out.println(e);
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
