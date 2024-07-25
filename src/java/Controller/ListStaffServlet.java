/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Agency;
import Model.StaffWorkplace;
import Model.User;
import dal.AgencyDAO;
import dal.StaffWorkplaceDAO;
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
public class ListStaffServlet extends HttpServlet {

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
            out.println("<title>Servlet ListStaffServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListStaffServlet at " + request.getContextPath() + "</h1>");
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
                UserDAO udb = new UserDAO();
                List<StaffWorkplace> staffByAgency = StaffWorkplaceDAO.INSTANCE.getAllStaffWorkplace();
                List<User> listStaffs = udb.getAllStaffs();
                List<Agency> listAgency = AgencyDAO.INSTANCE.getAllAgencies();
                request.setAttribute("staffByAgency", staffByAgency);
                request.setAttribute("listStaffs", listStaffs);
                request.setAttribute("listAgency", listAgency);

                request.getRequestDispatcher("listStaff.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        String staffId_raw = request.getParameter("staffId");
        String agencyId_raw = request.getParameter("changeAgency");
        int agencyId;
        String mess = "";
        try {
            int staffId = Integer.parseInt(staffId_raw);
            switch (action) {
                case "change":
                    agencyId = Integer.parseInt(agencyId_raw);

                    mess = AgencyDAO.INSTANCE.changeWorkPlaceByStaffId(staffId, agencyId)
                            ? "Chuyển nơi làm việc thành công" : "Chuyển nơi làm việc thất bại";
                    break;
                case "add":
                    agencyId = Integer.parseInt(agencyId_raw);

                    mess = StaffWorkplaceDAO.INSTANCE.insertStaffToAgency(staffId, agencyId)
                            ? "Thêm nơi làm việc cho nhân viên này thành công"
                            : "Thêm nơi làm việc cho nhân viên này thất bại";
                    break;

                case "active":
                    mess = StaffWorkplaceDAO.INSTANCE.changeStatusStaff(staffId, action)
                            ? "Thay đổi trạng thái thành công" : "Thay đổi trạng thái thất bại";
                    break;
                case "inactive":
                    mess = StaffWorkplaceDAO.INSTANCE.changeStatusStaff(staffId, action)
                            ? "Thay đổi trạng thái thành công" : "Thay đổi trạng thái thất bại";
                    break;

                default:
                    throw new AssertionError();
            }

        } catch (NumberFormatException e) {
            mess = e + "";

        }

        HttpSession session = request.getSession();
        session.setAttribute("mess", mess);
        response.sendRedirect("listStaff");
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
