/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.VehicleTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author thuhu
 */
public class AddCustomerInforServlet extends HttpServlet {

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
            out.println("<title>Servlet AddCustomerInforServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCustomerInforServlet at " + request.getContextPath() + "</h1>");
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
        VehicleTypeDAO vdb = new VehicleTypeDAO();
        int  vehicleType = (Integer)request.getSession().getAttribute("vehicle_type");
        System.out.println(vehicleType);
        double vehiclePrice = vdb.getVehicleTypeById(vehicleType).getPrice();
        request.setAttribute("vehiclePrice", vehiclePrice);
        request.getRequestDispatcher("addContract.jsp").forward(request, response);
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
        int vehicle_type = Integer.parseInt(request.getParameter("vehicleType")) ;
        System.out.println("vehicle type:  "+vehicle_type);
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String vehicleOwnerFirstName = request.getParameter("vehicleOwnerFirstName");
        String vehicleOwnerLastName = request.getParameter("vehicleOwnerLastName");
        String vehicleOwnerAddress = request.getParameter("vehicleOwnerAddress");
        String licensePlate = request.getParameter("licensePlate");
        String chassisNumber = request.getParameter("chassisNumber");
        String engineNumber = request.getParameter("engineNumber");

        request.getSession().setAttribute("vehicle_type", vehicle_type);
        request.getSession().setAttribute("firstName", firstName);
        request.getSession().setAttribute("lastName", lastName);
        request.getSession().setAttribute("gender", gender);
        request.getSession().setAttribute("dob", dob);
        request.getSession().setAttribute("address", address);
        request.getSession().setAttribute("email", email);
        request.getSession().setAttribute("phoneNumber", phoneNumber);
        
        request.getSession().setAttribute("vehicleOwnerFirstName", vehicleOwnerFirstName);
        request.getSession().setAttribute("vehicleOwnerLastName", vehicleOwnerLastName);
        request.getSession().setAttribute("vehicleOwnerAddress", vehicleOwnerAddress);
        request.getSession().setAttribute("licensePlate", licensePlate);
        request.getSession().setAttribute("chassisNumber", chassisNumber);
        request.getSession().setAttribute("engineNumber", engineNumber);
        System.out.println("gender: " + gender);
        System.out.println("dob: " + dob);
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
