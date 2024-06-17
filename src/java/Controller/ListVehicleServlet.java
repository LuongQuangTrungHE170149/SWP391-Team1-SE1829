/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Vehicle;
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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author QUANG TRUNG
 */
@WebServlet(name = "ListVehicleServlet", urlPatterns = {"/ListVehicleServlet"})
public class ListVehicleServlet extends HttpServlet {

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
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        
        String searchQuery = request.getParameter("searchQuery");
        List<Vehicle> vehicleList = new ArrayList<>();
        try {
            vehicleList = VehicleDAO.INSTANCE.getListVehicle(customerId, searchQuery);
            for (Vehicle vehicle : vehicleList) {

                boolean hasContract = VehicleDAO.INSTANCE.hasContract(vehicle.getId());
                vehicle.setHasContract(hasContract);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ListVehicleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        UserDAO userDAO = new UserDAO();
        String customerName = null;
        try {
            customerName = userDAO.getCustomerName(customerId);
        } catch (SQLException ex) {
            Logger.getLogger(ListVehicleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("customerName", customerName);
        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("customerId", customerId);
        request.setAttribute("vehicleList", vehicleList);
        request.getRequestDispatcher("vehicleManager.jsp").forward(request, response);
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
