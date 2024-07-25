
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.ContractDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author QUANG TRUNG
 */
@WebServlet(name="ChangeContractStatusServlet", urlPatterns={"/ChangeContractStatusServlet"})
public class ChangeContractStatusServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ChangeContractStatusServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeContractStatusServlet at " + request.getContextPath () + "</h1>");
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
         // Lấy thông tin contractId và newStatus từ request
        int contractId = Integer.parseInt(request.getParameter("contractId"));
        String newStatus = request.getParameter("newStatus");

        // Thực hiện thay đổi trạng thái hợp đồng trong database
        // Bạn cần bổ sung mã để kết nối tới database và cập nhật trạng thái

        try {
            // Giả sử bạn đã có phương thức cập nhật trạng thái trong lớp ContractDAO
            ContractDAO contractDAO = new ContractDAO();
            boolean isUpdated = contractDAO.updateContractStatus(contractId, newStatus);

            if (isUpdated) {
                response.sendRedirect("ViewContract?contractId="+contractId); // Chuyển hướng sau khi cập nhật thành công
            } else {
                response.sendRedirect("error.jsp"); // Chuyển hướng nếu có lỗi
            }
        } catch (Exception e) {
            e.printStackTrace();
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

///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package Controller;
//
//import Model.Contract;
//import Model.Vehicle;
//import dal.ContractDAO;
//import dal.UserDAO;
//import dal.VehicleDAO;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.sql.SQLException;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
///**
// *
// * @author QUANG TRUNG
// */
//@WebServlet(name = "ViewContractById", urlPatterns = {"/ViewContractById"})
//public class ViewContractById extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ViewContractById</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ViewContractById at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        String contractIdParam = request.getParameter("contractId");
//        if (contractIdParam == null || contractIdParam.isEmpty()) {
//            response.getWriter().println("<h2>Missing contractId parameter</h2>");
//            return;
//        }
//        ContractDAO cd = new ContractDAO();
//        VehicleDAO vd = new VehicleDAO();
//        int contractId = Integer.parseInt(contractIdParam);
//        Contract contract = cd.findContractByContractId(contractId);
//
//        if (contract == null) {
//            response.getWriter().println("<h2>No contract found for Vehicle ID: " + contractId + "</h2>");
//            return;
//        }
//        Vehicle vehicle = vd.getVehicleById(contract.getVehicle().getId());
//        UserDAO userDao = new UserDAO();
//        String customerName = null;
//        try {
//            customerName = userDao.getCustomerName(contract.getCustomerId());
//        } catch (SQLException ex) {
//            Logger.getLogger(ViewContract.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        request.setAttribute("customerName", customerName);
//        request.setAttribute("vehicle", vehicle);
//        request.setAttribute("contract", contract);
//        // Chuyển hướng đến viewContract.jsp với thông tin hợp đồng
//        request.getRequestDispatcher("viewContract.jsp").forward(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}

