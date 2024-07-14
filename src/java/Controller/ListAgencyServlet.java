/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Agency;
import Model.User;
import dal.AgencyDAO;
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
public class ListAgencyServlet extends HttpServlet {

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
            out.println("<title>Servlet ListAgencyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListAgencyServlet at " + request.getContextPath() + "</h1>");
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
        User user = (User) session.getAttribute("user");
        if (user != null) {
            if (user.getRole().equalsIgnoreCase("manager")) {
                String sortAction = request.getParameter("action");
                String currentSortOrder = (String) session.getAttribute("currentSortOrder");

                if ("sort".equals(sortAction)) {
                    List<Agency> listSortAgency;
                    if ("asc".equals(currentSortOrder)) {
                        listSortAgency = AgencyDAO.INSTANCE.getAllAgencies(); // Original order
                        session.setAttribute("currentSortOrder", "desc");
                    } else {
                        listSortAgency = AgencyDAO.INSTANCE.getAllAgenciesSortById(); // Sorted order
                        session.setAttribute("currentSortOrder", "asc");
                    }
                    request.setAttribute("listAgency", listSortAgency);
                } else {
                    List<Agency> listAgency = AgencyDAO.INSTANCE.getAllAgencies();
                    request.setAttribute("listAgency", listAgency);
                    session.removeAttribute("currentSortOrder"); // Reset sort order
                }

                request.getRequestDispatcher("agencyList.jsp").forward(request, response);

            } else {
                response.sendRedirect("home");

            }

        } else {
            response.sendRedirect("login");

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
        String key = request.getParameter("key");
        if (!key.isBlank()) {
            List<Agency> listSearchAgency = AgencyDAO.INSTANCE.searchAgency(key);
            request.setAttribute("key", key);
            request.setAttribute("listSearchAgency", listSearchAgency);
            request.getRequestDispatcher("agencyList.jsp").forward(request, response);
        } else {
            response.sendRedirect("listAgency");
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
