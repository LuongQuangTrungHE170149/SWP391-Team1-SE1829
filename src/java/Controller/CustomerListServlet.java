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
import java.util.Collections;
import java.util.Comparator;
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
        HttpSession session = request.getSession();
        UserDAO userDao = new UserDAO();
        List<User> listCustomer;

        String sortAction = request.getParameter("action");
        String currentSortOrder = (String) session.getAttribute("currentSortOrder");

        String status = request.getParameter("filter");
        String selectedStatus = "";

        if (status != null) {
            switch (status) {
                case "active":
                    listCustomer = userDao.getAllCustomerByStatus("active");
                    selectedStatus = "active";
                    break;
                case "inactive":
                    listCustomer = userDao.getAllCustomerByStatus("inactive");
                    selectedStatus = "inactive";
                    break;
                default:
                    listCustomer = userDao.getAllUserByRole("Customer");
                    break;
            }
            request.setAttribute("selectedStatus", selectedStatus);
        } else {
            listCustomer = userDao.getAllUserByRole("Customer");
        }

        String searchValue = request.getParameter("key");
        if (searchValue != null && !searchValue.isEmpty()) {
            listCustomer = userDao.searchCustomerByName(searchValue);
            request.setAttribute("name", searchValue);
        }
        if ("sort".equals(sortAction)) {
            if ("asc".equals(currentSortOrder)) {
                Collections.sort(listCustomer, new Comparator<User>() {
                    @Override
                    public int compare(User u1, User u2) {
                        return Integer.compare(u1.getId(), u2.getId());
                    }
                });
                session.setAttribute("currentSortOrder", "desc");
            } else {
                Collections.sort(listCustomer, new Comparator<User>() {
                    @Override
                    public int compare(User u1, User u2) {
                        return Integer.compare(u2.getId(), u1.getId());
                    }
                });
                session.setAttribute("currentSortOrder", "asc");
            }
        } else {
            session.removeAttribute("currentSortOrder");
        }

        request.setAttribute("listCustomer", listCustomer);
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
