/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Contract;
import Model.Vehicle;
import dal.ContractDAO;
import dal.UserDAO;
import dal.VehicleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author QUANG TRUNG
 */
@WebServlet(name = "ViewContract", urlPatterns = {"/ViewContract"})
public class ViewContract extends HttpServlet {

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
            out.println("<title>Servlet ViewContract</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewContract at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        ContractDAO cd = new ContractDAO();
        VehicleDAO vd = new VehicleDAO();
        String vehicleIdParam = request.getParameter("vehicleId");
        if (vehicleIdParam == null || vehicleIdParam.isEmpty()) {
            response.getWriter().println("<h2>Missing vehicleId parameter</h2>");
            return;
        }

        int vehicleId = Integer.parseInt(vehicleIdParam);
        Contract contract = cd.findContractByVehicleId(vehicleId);

        if (contract == null) {
            response.getWriter().println("<h2>No contract found for Vehicle ID: " + vehicleId + "</h2>");
            return;
        }
        Vehicle vehicle = vd.getVehicleById(vehicleId);
        UserDAO userDao = new UserDAO();
        String customerName = null;
        try {
            customerName = userDao.getCustomerName(contract.getCustomerId());
        } catch (SQLException ex) {
            Logger.getLogger(ViewContract.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("customerName", customerName);
        request.setAttribute("vehicle", vehicle);
        request.setAttribute("contract", contract);
        // Chuyển hướng đến viewContract.jsp với thông tin hợp đồng
        request.getRequestDispatcher("viewContract.jsp").forward(request, response);
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
        processRequest(request, response);
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
