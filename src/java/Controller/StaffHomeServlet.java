/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Consultation;
import Model.News;
import Model.Promotion;
import Model.User;
import dal.ConsultationDAO;
import dal.ContractDAO;
import dal.NewsDAO;
import dal.PromotionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author thuhu
 */
public class StaffHomeServlet extends HttpServlet {

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
            out.println("<title>Servlet StaffManagerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffManagerServlet at " + request.getContextPath() + "</h1>");
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
        } //neu da dang nhap => check role
        else {
            if (u.getRole().equalsIgnoreCase("user") || u.getRole().equalsIgnoreCase("manager")) {
                request.setAttribute("error", error);
                request.getRequestDispatcher("error").forward(request, response);
            } //manager true =>>
            else {
                ConsultationDAO cdb = new ConsultationDAO();
                List<Consultation> listConByStaff = cdb.getListConsultationByStaffId(u.getId());
                List<Consultation> listCon = cdb.getAll();
                
                NewsDAO ndb = new NewsDAO();
                List<News> listNews = ndb.getAll();
                List<News> listNewsByStaff = ndb.getListNewsByStaffId(u.getId());
                
                PromotionDAO pdb = new PromotionDAO();
                List<Promotion> listPromotion = pdb.getAll();
                List<Promotion> listPromotionByStaff = pdb.getListPromotionsByStaff(u.getId());
                
                ContractDAO codb = new ContractDAO();
                
                HashMap <String, BigInteger> monthlyMoneyByStaff = codb.getMonthlyMoneyByStaff(u.getId());
                
                request.setAttribute("monthlyMoneyByStaff", monthlyMoneyByStaff);
                request.setAttribute("listPromotion", listPromotion);
                request.setAttribute("listPromotionByStaff", listPromotionByStaff);
                request.setAttribute("listNewsByStaff", listNewsByStaff);
                request.setAttribute("listNews", listNews);
                request.setAttribute("listCon", listCon);
                request.setAttribute("listConByStaff", listConByStaff);
                request.getRequestDispatcher("staffHome.jsp").forward(request, response);
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
