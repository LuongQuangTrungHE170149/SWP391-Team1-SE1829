/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

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
public class RequestCustomerInforServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("num_years") == null) {
            response.sendRedirect("motorbikeInsurance");
        } else {
            request.getRequestDispatcher("requestCustomerInfor.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        
        request.getSession().setAttribute("firstName", firstName);
        request.getSession().setAttribute("lastName", lastName);
        request.getSession().setAttribute("gender", gender);
       
        request.getSession().setAttribute("dob", dob);
        request.getSession().setAttribute("address", address);
        request.getSession().setAttribute("email", email);
        request.getSession().setAttribute("phoneNumber",phoneNumber );
        request.getSession().setAttribute("vehicleOwnerFirstName",vehicleOwnerFirstName );
        request.getSession().setAttribute("vehicleOwnerLastName",vehicleOwnerLastName );
        request.getSession().setAttribute("vehicleOwnerAddress",vehicleOwnerAddress );
        request.getSession().setAttribute("licensePlate", licensePlate);
        request.getSession().setAttribute("chassisNumber", chassisNumber);
        request.getSession().setAttribute("engineNumber", engineNumber);
        System.out.println("gender: "+gender);
        System.out.println("dob: "+dob);
        
        
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
