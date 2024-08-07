/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Contract;
import Model.Vehicle;
import Model.VehicleType;
import dal.ContractDAO;
import dal.VehicleDAO;
import dal.VehicleTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author QUANG TRUNG
 */
@WebServlet(name="EditContract", urlPatterns={"/EditContract"})
public class EditContract extends HttpServlet {
   
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
            out.println("<title>Servlet EditContract</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditContract at " + request.getContextPath () + "</h1>");
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
        int contractId = Integer.valueOf(request.getParameter("contractId")) ;
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String contractYearsStr = request.getParameter("contractYears");
        int contractYears = Integer.valueOf(contractYearsStr);
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        Date startDate = Date.valueOf(startDateStr);
        Date endDate = Date.valueOf(endDateStr);
        ContractDAO contractDAO = new ContractDAO();
        
        VehicleTypeDAO vehicleTypeDAO = new VehicleTypeDAO();
        Contract contract = contractDAO.getContractById(contractId);
        Vehicle vehicle = contract.getVehicle();
        VehicleType type = vehicle.getMotocycleType();
        Double payment = Double.valueOf(type.getPrice()*contractYears) ;
        
        contractDAO.updateContract(contractId, startDate, endDate, description, status, payment);
        request.getRequestDispatcher("ListContract").forward(request, response);
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
