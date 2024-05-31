/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Consultation;
import Model.User;
import dal.ConsultationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Kha21
 */
public class ConsultationManagementServlet extends HttpServlet {

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
            out.println("<title>Servlet ConsultationManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConsultationManagementServlet at " + request.getContextPath() + "</h1>");
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
        final String loginFirst = "Bạn cần phải đăng nhập trước!";
        final String error = "Bạn không có quyền truy cập trang web này!";
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");

        
        //check
        if (u == null) {
            request.setAttribute("loginFirst", loginFirst);
            request.getRequestDispatcher("error").forward(request, response);
        } 
        //neu da dang nhap => check role
        else {
            if (u.getRole().equalsIgnoreCase("user")) {
                request.setAttribute("error", error);
                request.getRequestDispatcher("error").forward(request, response);
            } 
            //staff, manager true =>>
            else {
                ConsultationDAO cdb = new ConsultationDAO();
                List<Consultation> listAll;

                HashMap<String, Integer> totalStaffAnswer = cdb.getTotalStaffAnswer();
                String status = request.getParameter("status");
                if (status != null) {
                    switch (status) {
                        case "notReply":
                            listAll = cdb.getConsultationByStatus(0);
                            break;
                        case "reply":
                            listAll = cdb.getConsultationByStatus(1);
                            break;
                        default:
                            listAll = cdb.getAll();
                            break;
                    }
                } else {
                    listAll = cdb.getAll();
                }

                int countAll = cdb.CountConsultationByStatus("all");
                int countNotReply = cdb.CountConsultationByStatus("0");
                int countReply = cdb.CountConsultationByStatus("1");

                int page = 1;
                int recordPerPage = 20;
                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }
                int start = (page - 1) * recordPerPage;
                int end = Math.min(start + recordPerPage, listAll.size());

                List<Consultation> listForPage = listAll.subList(start, end);
                int numberOfPages = (int) Math.ceil(listAll.size() * 1.0 / recordPerPage);

                request.setAttribute("totalStaffAnswer", totalStaffAnswer);
                request.setAttribute("status", status);
                request.setAttribute("countAll", countAll);
                request.setAttribute("countNotReply", countNotReply);
                request.setAttribute("countReply", countReply);
                request.setAttribute("listAll", listForPage);
                request.setAttribute("numberOfPages", numberOfPages);
                request.setAttribute("currentPage", page);
                request.getRequestDispatcher("ConsultationManagement.jsp").forward(request, response);
            }
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
        processRequest(request, response);
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
