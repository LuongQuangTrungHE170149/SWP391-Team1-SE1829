/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Vehicle;
import dal.ContractDAO;
import dal.VehicleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author QUANG TRUNG
 */
@WebServlet(name="AddVehicleServlet", urlPatterns={"/AddVehicle"})
public class AddVehicleServlet extends HttpServlet {
   
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
            out.println("<title>Servlet AddVehicleServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddVehicleServlet at " + request.getContextPath () + "</h1>");
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
//        HttpSession session = request.getSession();
//        int ownerId = (int) session.getAttribute("userId"); // Assuming userId is stored in session
        int ownerId = Integer.parseInt(request.getParameter("customerId"));
        String model = request.getParameter("vehicleType");
        String licensePlates = request.getParameter("licensePlates");
        String chassis = request.getParameter("chassis");
        String engine = request.getParameter("engine");
        Vehicle vehicle = new Vehicle();
        vehicle.setMotocycleType(model);
        vehicle.setLicensePlates(licensePlates);
        vehicle.setOwnerId(ownerId);
        vehicle.setChassis(chassis);
        vehicle.setEngine(engine);
        ContractDAO cd = new ContractDAO();
        VehicleDAO vd = new VehicleDAO();
        try {
            vd .addVehicle(vehicle);
            int vehicleId = vd.getVehicleIdAfterAdd();
            response.sendRedirect("AddVehicleSuccess?customerId="+ownerId+"&vehicleId="+vehicleId); // Redirect to a success page
        } catch (SQLException e) {
            throw new ServletException(e);
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
