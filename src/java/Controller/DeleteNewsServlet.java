/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.NewsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author thuhu
 */
public class DeleteNewsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String selectedStaff = request.getParameter("selectedStaff");
        int page = Integer.parseInt(request.getParameter("page"));
        String searchValue = request.getParameter("searchValue");

        NewsDAO pdb = new NewsDAO();
        pdb.deleteNewsById(id);
        if (searchValue.isEmpty()) {
            if (page == 1) {
                response.sendRedirect("newsManager?selectedStaff=" + selectedStaff);
            } else {
                response.sendRedirect("newsManager?selectedStaff=" + selectedStaff + "&page=" + page);
            }
        } else {    
            response.sendRedirect("newsManager?page=" + page + "&searchValue=" + searchValue);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
