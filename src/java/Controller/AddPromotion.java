/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Promotion;
import Model.User;
import dal.PromotionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author thuhu
 */
@MultipartConfig()
public class AddPromotion extends HttpServlet {

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
            out.println("<title>Servlet AddPromotion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPromotion at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String content = request.getParameter("content");
            String timeStartParam = request.getParameter("timeStart");
            String timeEndParam = request.getParameter("timeEnd");
            Boolean isHeader = Boolean.parseBoolean(request.getParameter("isHeaer"));
            PromotionDAO pdb = new PromotionDAO();
            if (isHeader == true) {
                pdb.setIsHeaderToFalse();
            }

            Part filePart = request.getPart("image");
            String image = convertInputStreamToString(filePart.getInputStream());
            java.util.Date utilDate = new java.util.Date();

            Date timeStartUtil = dateFormat.parse(timeStartParam);
            Date timeEndUtil = dateFormat.parse(timeEndParam);
            java.sql.Date timeStart = new java.sql.Date(timeStartUtil.getTime());
            java.sql.Date timeEnd = new java.sql.Date(timeEndUtil.getTime());

//            public void addPromotion(String title, String description, String content, Date timeStart, Date timeEnd, boolean isHeader, String image, int staff
            pdb.addPromotion(title, description, timeStart, timeEnd, content, isHeader, image, u.getId());
//                public void addPromotion(String title, String description, Date timeStart, Date timeEnd, String content, boolean isHeader, String image, int staff) {

            System.out.println(title + " description: " + description + "| content: " + content + " start: " + timeStart + " end: " + timeEnd + " header: " + isHeader + " image: " + image + " User: " + u.getUsername());
            PrintWriter out = response.getWriter();
            out.print(u.getId());

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private String convertInputStreamToString(InputStream inputStream) throws IOException {
        StringBuilder stringBuilder = new StringBuilder();
        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                stringBuilder.append(line);
            }
        }
        return stringBuilder.toString();
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
