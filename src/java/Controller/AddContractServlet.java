/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Contract;
import dal.ContractDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;

import java.sql.Date;

/**
 *
 * @author QUANG TRUNG
 */
@WebServlet(name="AddContractServlet", urlPatterns={"/AddContractServlet"})
public class AddContractServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
        try {
           
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
            int agencyId = Integer.parseInt(request.getParameter("agencyId"));
            long contractType = Integer.parseInt(request.getParameter("contractType"));
            Date startDate = Date.valueOf(request.getParameter("startDate"));
            String description = request.getParameter("description");
            long payment = Long.parseLong(request.getParameter("payment"));
            boolean isPay = request.getParameter("isPay") != null;
            
            HttpSession session = request.getSession();
            int staffId = (Integer) session.getAttribute("staffId");
            
            Contract contract = new Contract(agencyId, startDate, startDate, staffId, description, Double.NaN, description);
            ContractDAO contractDAO = new ContractDAO();
            contractDAO.addContract(contract);
            response.sendRedirect("success.jsp");  // Redirect to a success page
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");  // Redirect to an error page
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
