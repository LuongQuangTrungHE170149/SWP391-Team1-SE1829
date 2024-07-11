/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.PromotionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

/**
 *
 * @author thuhu
 */
public class DeletePromotionServlet extends HttpServlet {

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
            out.println("<title>Servlet DeletePromotionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeletePromotionServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String selectedStaff = request.getParameter("selectedStaff");
        int page = Integer.parseInt(request.getParameter("page"));
        String searchValue = request.getParameter("searchValue");
        
        String encodedSearchValue = URLEncoder.encode(searchValue, StandardCharsets.UTF_8.toString());
        System.out.println(searchValue);
        System.out.println(selectedStaff);
        System.out.println(searchValue);
        PromotionDAO pdb = new PromotionDAO();
        pdb.deletePromotionById(id);
        if (searchValue.isEmpty()) {
            if (page == 1) {
                response.sendRedirect("promotionManager?selectedStaff=" + selectedStaff);
            } else {
                response.sendRedirect("promotionManager?selectedStaff=" + selectedStaff + "&page=" + page);
            }
        } else {
            response.sendRedirect("promotionManager?page=" + page + "&searchValue=" + encodedSearchValue);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
