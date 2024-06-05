/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Promotion;
import com.google.gson.Gson;
import dal.PromotionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author thuhu
 */
@MultipartConfig()
public class UpdatePromotionServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdatePromotionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePromotionServlet at " + request.getContextPath() + "</h1>");
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

        int id = Integer.parseInt(request.getParameter("id"));

        PromotionDAO cdb = new PromotionDAO();
        Promotion c = cdb.getPromotionById(id);

        request.setAttribute("c", c);
        request.getRequestDispatcher("updatePromotion.jsp").forward(request, response);
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
            int id = Integer.parseInt(request.getParameter("id"));
            System.out.println("id: "+id);
            PromotionDAO pdb = new PromotionDAO();
            Promotion p = pdb.getPromotionById(id);

            String title = request.getParameter("title");
            String description = request.getParameter("description");

            String content = request.getParameter("content");
            boolean isHeader = Boolean.parseBoolean(request.getParameter("isHeader"));
            String timeStartParam = request.getParameter("timeStart");
            String timeEndParam = request.getParameter("timeEnd");
            Part filePart = request.getPart("newImage");

            System.out.println("title: "+title+" \ncontent: "+content+"\ndescription: "+description+"\ntimeStart: "+timeStartParam+"\ntimeEnd: "+timeEndParam+"\nisHeader: "+isHeader+"\nimg:"+filePart );

            if (isHeader == true) {
                pdb.setIsHeaderToFalse();
            }
            String image;
            if (filePart == null) {
                image = p.getImage();
            } else {
                String url = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                if (url == null) {
                    image = p.getImage();
                } else {
                    image = "images/promotion_img/" + url;
                }
            }

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date timeStartUtil = dateFormat.parse(timeStartParam);
            Date timeEndUtil = dateFormat.parse(timeEndParam);
            java.sql.Date timeStart = new java.sql.Date(timeStartUtil.getTime());
            java.sql.Date timeEnd = new java.sql.Date(timeEndUtil.getTime());
            System.out.println(pdb.updatePromotionById(id, title, description, timeStart, timeEnd, content, image, isHeader, p.getStaff().getId()));
        } catch (Exception e) {
            System.out.println(e);
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
