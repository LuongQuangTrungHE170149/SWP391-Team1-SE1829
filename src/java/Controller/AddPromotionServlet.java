/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Notification;
import Model.Promotion;
import Model.User;
import dal.NotificationDAO;
import dal.PromotionDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import socket.NotificationWebSocket;

/**
 *
 * @author thuhu
 */
@MultipartConfig()
public class AddPromotionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String content = request.getParameter("content");
            String timeStartParam = request.getParameter("timeStart");
            String timeEndParam = request.getParameter("timeEnd");
            String isHeaderParam = request.getParameter("isHeader");
            System.out.println("is header: " + isHeaderParam);
            PromotionDAO pdb = new PromotionDAO();

            boolean isHeader = Boolean.parseBoolean(isHeaderParam);
            if (isHeader == true) {
                pdb.setIsHeaderToFalse();
            }
            String image = "images/promotion_img/null_image.png";
            try {
                Part filePart = request.getPart("image");
                System.out.println("file Part: " + filePart);
                String url = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                image = "images/promotion_img/" + url;
                System.out.println("url: " + url);
            } catch (Exception e) {
                System.out.println(e);
            }

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date timeStartUtil = dateFormat.parse(timeStartParam);
            Date timeEndUtil = dateFormat.parse(timeEndParam);
            java.sql.Date timeStart = new java.sql.Date(timeStartUtil.getTime());
            java.sql.Date timeEnd = new java.sql.Date(timeEndUtil.getTime());

            System.out.println("Added: " + pdb.addPromotion(title, description, timeStart, timeEnd, content, isHeader, image, u.getId()));
            System.out.println("Title: " + title
                    + "\n description: " + description
                    + "\n content: " + content
                    + "\n start: " + timeStart
                    + "\n end: " + timeEnd
                    + "\n header: " + isHeader
                    + "\n image: " + image
                    + "\n User: " + u.getUsername());
            PrintWriter out = response.getWriter();
            out.print(u.getId());
            
            
            NotificationDAO dbNotify = new NotificationDAO();
            UserDAO dbUser = new UserDAO();
            Promotion promotion = pdb.getLastPromitionById();
            List<User> users = dbUser.getAllUserByRole("User");
            Notification notification = new Notification();
            notification.setTitle("Khuyến mãi "+title+"");
            notification.setIsClick(false);
            notification.setLink("promotionDetail?id="+promotion.getId());
            for (User user : users) {
                notification.setUserId(user);
                dbNotify.insert(notification);
                NotificationWebSocket.sendMessageToUser(user.getId()+"", notification);
            }
            

        } 
        catch (Exception e) {
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
