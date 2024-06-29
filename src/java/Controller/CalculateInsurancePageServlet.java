/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Contract;
import Model.VehicleType;
import dal.VehicleTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author QUANG TRUNG
 */
public class CalculateInsurancePageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        int motocycleType = Integer.parseInt(request.getParameter("vehicle_type"));
//        Date startDate = Date.valueOf(request.getParameter("startDate"));
//        Date endDate = Date.valueOf(request.getParameter("endDate"));
//        String numYears = request.getParameter("num_years");
//
//        VehicleTypeDAO vdb = new VehicleTypeDAO();
//        List<VehicleType> listVT = vdb.getAll();
//        VehicleType v = vdb.getVehicleTypeById(motocycleType);
//
//        request.setAttribute("v", v);
//        request.setAttribute("listVT", listVT);
//        request.setAttribute("motocycleType", motocycleType);
//        request.setAttribute("startDate", startDate);
//        request.setAttribute("endDate", endDate);
//        request.setAttribute("num_years", numYears);
        try {
            if (request.getSession().getAttribute("num_years") == null) {
                response.sendRedirect("motorbikeInsurance");
            }
            request.getRequestDispatcher("calculateInsurancePage.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
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
        boolean isAccidentInsurance = Boolean.parseBoolean(request.getParameter("isAccidentInsurance"));
        int num_years = Integer.parseInt(request.getParameter("num_years"));
        int vehicleType = Integer.parseInt(request.getParameter("vehicleType"));
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
        System.out.println(isAccidentInsurance + ", " + num_years + ", " + vehicleType + ", " + startDate + " - " + endDate + ", total price: " + totalPrice);

        request.getSession().setAttribute("isAccidentInsurance", isAccidentInsurance);
        request.getSession().setAttribute("num_years", num_years);
        request.getSession().setAttribute("vehicleType", vehicleType);
        request.getSession().setAttribute("startDate", startDate);
        request.getSession().setAttribute("endDate", endDate);
        request.getSession().setAttribute("totalPrice", totalPrice);
        response.sendRedirect("requestCustomerInfor");
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
