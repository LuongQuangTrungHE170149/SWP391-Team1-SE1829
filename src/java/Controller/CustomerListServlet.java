/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Agency;
import Model.User;
import dal.AgencyDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author tranm
 */
public class CustomerListServlet extends HttpServlet {

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
            out.println("<title>Servlet CustomerListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerListServlet at " + request.getContextPath() + "</h1>");
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
        UserDAO userDao = new UserDAO();

        HttpSession session = request.getSession();
        String sortAction = request.getParameter("action");
        String currentSortOrder = (String) session.getAttribute("currentSortOrder");

        if ("sort".equals(sortAction)) {
            List<User> listSortCustomer;
            if ("asc".equals(currentSortOrder)) {
                listSortCustomer = userDao.getAllUserByRole("Customer"); 
                session.setAttribute("currentSortOrder", "desc");
            } else {
                listSortCustomer = userDao.sortCusomterById(); 
                session.setAttribute("currentSortOrder", "asc");
            }
            request.setAttribute("listCustomer", listSortCustomer);
        } else {
            List<User> listCustomer = userDao.getAllUserByRole("Customer");
            request.setAttribute("listCustomer", listCustomer);
            session.removeAttribute("currentSortOrder"); 
        }

        request.getRequestDispatcher("customerList.jsp").forward(request, response);

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
        String name = request.getParameter("key");
        if (!name.isBlank()) {
            UserDAO userDao = new UserDAO();
            List<User> listSearchCustomer = userDao.searchCustomerByName(name);
            request.setAttribute("name", name);
            request.setAttribute("listSearchCustomer", listSearchCustomer);

            request.getRequestDispatcher("customerList.jsp").forward(request, response);

        } else {
            response.sendRedirect("customerList");
        }
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
