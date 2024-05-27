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
import com.fasterxml.jackson.databind.JsonNode;
import com.google.gson.Gson;
import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import dal.UserDAO;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.json.JSONObject;

/**
 *
 * @author Kha21
 */
public class ReplyConsultationServlet extends HttpServlet {

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
            out.println("<title>Servlet ReplyConsultationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReplyConsultationServlet at " + request.getContextPath() + "</h1>");
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

        ConsultationDAO cdb = new ConsultationDAO();
        Consultation c = cdb.getConsultationById(id);

        String json = new Gson().toJson(c);

        response.setContentType("application/json");
        response.getWriter().write(json);

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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        final String username = "fcareinsurance@gmail.com";
        final String password = "cifxowsnfwdnywed";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        //
        Session s = Session.getInstance(props,new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(username, password);
            }
        });
        int id =Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String toMail = request.getParameter("senderEmail");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String message ="<!DOCTYPE html>\n"
                +"<html> \n"
                +"<head><meta charset='utf-8'></head> \n"
                +"<body>\n"
                +"<h1 style=\"font-weight: bold;\">F-Care Insurance</h1>\n"
                +"<b><h5>Xin chào "+name+" đây là tin nhắn trả lời yêu cầu tư vấn của bạn <br> Vui lòng không trả lời email này!</h5></b>\n"
                +"<b><h5>Đây là câu trả lời của chúng tôi: <br></h5></b>\n"
                +"<p>"+content+" </p>\n"
                +"<hr>"
                +"<i>Nếu bạn có thắc mắc, vui lòng tạo thêm yêu cầu tư vấn <a href=\"fcareinsurance.com\">tại đây</a></i>\n"
                +"<p>Chúc bạn có một ngày vui vẻ!</p>\n"
                +"<b>F-Care Insurance</b>\n"
                +"</body>\n"
                +"</html>"
                ;
        System.out.println(content);
        System.out.println(toMail);
        System.out.println(title);
        System.out.println(name);
        try{
            Message msg = new MimeMessage(s);
            msg.setFrom(new InternetAddress(username));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
            msg.setSubject("Tu Van Thong Tin");
            msg.setContent(message,"text/html; charset=utf-8");
            Transport.send(msg);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        HttpSession session = request.getSession();
        UserDAO udb = new UserDAO();
        User u = udb.getUserById(1);
        session.setAttribute("u", u);
        
        ConsultationDAO cdb = new ConsultationDAO();
        cdb.updateConsultationById(id, content, u.getId(), true);
//        request.getRequestDispatcher("ConsultaionManagement").forward(request, response);
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
