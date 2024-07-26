/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.User;
import Model.VehicleType;
import dal.UserDAO;
import dal.VehicleTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author QUANG TRUNG
 */
@WebServlet(name="AddCustomerServlet", urlPatterns={"/AddCustomerServlet"})
public class AddCustomerServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet AddCustomerServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCustomerServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Lấy thông tin từ form
       
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        
        
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String address = request.getParameter("address");
        int gender = Integer.parseInt(request.getParameter("gender"));
        
        UserDAO userDAO = new UserDAO();
        // Tạo đối tượng User với thông tin từ form
        User user = new User();
        user.setUsername(email);
        user.setPassword(phoneNumber);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setDob(dob);
        user.setEmail(email);
        user.setPhone(phoneNumber);
        user.setRole("customer");
        user.setAddress(address);
        user.setGender(gender);
        // Gọi phương thức để thêm người dùng vào cơ sở dữ liệu
        boolean result = userDAO.insert(user);

        if (result) {
            // Nếu thêm thành công, chuyển hướng đến trang thành công
            int customerId = userDAO.getLastUserId();
            VehicleTypeDAO vehicleTypeDAO = new VehicleTypeDAO();
        List<VehicleType> listVT = vehicleTypeDAO.getAll();
        request.setAttribute("customerId", customerId);
        request.setAttribute("listVT", listVT);
            request.getRequestDispatcher("addVehicle.jsp").forward(request, response);
        } else {
            // Nếu thất bại, chuyển hướng đến trang lỗi
            response.sendRedirect("error.jsp");
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
