/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.News;
import dal.NewsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;

/**
 *
 * @author thuhu
 */
@MultipartConfig()
public class UpdateNewsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);

        NewsDAO cdb = new NewsDAO();
        News c = cdb.getNewsById(id);

        request.setAttribute("c", c);
        request.getRequestDispatcher("updateNews.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            NewsDAO pdb = new NewsDAO();
            News p = pdb.getNewsById(id);

            String title = request.getParameter("title");
            String description = request.getParameter("description");

            String content = request.getParameter("content");
            boolean isHeader = Boolean.parseBoolean(request.getParameter("isHeader"));
            String type = request.getParameter("type");

            String image = p.getImage();

            try {
                Part filePart = request.getPart("image");
                String file = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                image = "images/news_img/" + file;
            } catch (Exception e) {
                System.out.println(e);
            }

            if (isHeader == true) {
                pdb.setIsHeaderToFalse();
                pdb.setIsHeaderToTrueById(true, id);
            }
            if (isHeader == false) {
                pdb.setIsHeaderToFalse();
            }

            System.out.println("title: " + title + " \ncontent: " + content + "\ndescription: " + description + "\nisHeader: " + isHeader +"\ntype: "+type+ "\nimg:" + image +"\nstaff: "+p.getStaff().getId());
            System.out.println("okela " + "update: " + pdb.updateNewsById(id, title, description, content, type, image, isHeader, p.getStaff().getId()));
        } catch (Exception e) {
            System.out.println("LOI GI VAY: " + e);
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
