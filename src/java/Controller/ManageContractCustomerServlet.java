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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author thuhu
 */
public class ManageContractCustomerServlet extends HttpServlet {
   
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      if(request.getSession().getAttribute("user") != null){
          List<Contract> list = new ArrayList<>();
          int id = Integer.parseInt(request.getParameter("customerId"));
          ContractDAO cdb = new ContractDAO();
          list = cdb.getContractByCustomerId(id);
          
          request.setAttribute("now", new Date());
          request.setAttribute("listAll", list);
          request.getRequestDispatcher("manageContractCustomer.jsp").forward(request, response);
    }else response.sendRedirect("home");
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
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
