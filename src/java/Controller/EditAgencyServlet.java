/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Agency;
import dal.AgencyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author tranm
 */
public class EditAgencyServlet extends HttpServlet {

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
            out.println("<title>Servlet EditAgencyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditAgencyServlet at " + request.getContextPath() + "</h1>");
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
        String id_raw = request.getParameter("id");
        try {
            int agencyId = Integer.parseInt(id_raw);
            Agency agency = AgencyDAO.INSTANCE.getAgencieById(agencyId);
            if (agency != null) {
                request.setAttribute("agency", agency);
                request.getRequestDispatcher("editAgency.jsp").forward(request, response);
            } else {
                response.sendRedirect("listAgency"); // Redirect if agency not found
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("listAgency"); // Redirect if id is not a valid integer
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
        try {
            int agencyId = Integer.parseInt(request.getParameter("agencyId"));
            String agencyName = request.getParameter("agencyName");
            String agencyAddress = request.getParameter("agencyAddress");
            String agencyHotline = request.getParameter("agencyHotline");
            String agencyWorktime = request.getParameter("agencyWorktime");
            String status = request.getParameter("agencyStatus");

            Agency agency = new Agency();
            agency.setAgencyName(agencyName);
            agency.setAgencyAddress(agencyAddress);
            agency.setHotline(agencyHotline);
            agency.setWorktime(agencyWorktime);
            agency.setStatus(status);

            HttpSession session = request.getSession();
            boolean updateSuccess = AgencyDAO.INSTANCE.updateAgencyById(agencyId, agency);
            if (updateSuccess) {
                session.setAttribute("updateSuccess", "Chỉnh sửa đại lý " + agencyName + " thành công");
                response.sendRedirect("listAgency");
            } else {
                session.setAttribute("updateFail", "Chỉnh sửa đại lý " + agencyName + " thất bại");
                response.sendRedirect("editAgency");
            }
        } catch (NumberFormatException e) {
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
