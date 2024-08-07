/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;
import dal.UserDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet(name = "ChangePasswordUserController", urlPatterns = {"/changePasswordUser"})
public class ChangePasswordUserController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("userId"));
        UserDAO udb = new UserDAO();
        User u = udb.getUserById(id);
        try {
            String password = request.getParameter("password");
            if (password != null || !password.isEmpty()) {
                if (!udb.checkPasswordById(id, password)) {
                    request.setAttribute("invalidPassword", "Invalid Password");
                } else {
                    request.setAttribute("password", password);

                    String newPassword = request.getParameter("newPassword");
                    if (udb.checkPasswordById(id, newPassword)) {
                        request.setAttribute("invalidNewPassword", "Do not duplicate old passwords");
                    } else {
                        String confirmPassword = request.getParameter("confirmPassword");
                        if (!confirmPassword.equals(newPassword)) {
                            request.setAttribute("invalidConfirmPassword", "New password and Confirm password do not match");
                        } else {
                            udb.changePasswordById(id, newPassword);

                            request.removeAttribute("password");
                            request.setAttribute("success", "Password change successful!");

                            //send mail
                            request.setCharacterEncoding("utf-8");
                            response.setCharacterEncoding("utf-8");

                            final String Fusername = "fcareinsurance@gmail.com";
                            final String Fpassword = "cifxowsnfwdnywed";

                            Properties props = new Properties();
                            props.put("mail.smtp.host", "smtp.gmail.com");
                            props.put("mail.smtp.port", "587");
                            props.put("mail.smtp.auth", "true");
                            props.put("mail.smtp.starttls.enable", "true");

                            //
                            Session s = Session.getInstance(props, new javax.mail.Authenticator() {
                                @Override
                                protected PasswordAuthentication getPasswordAuthentication() {
                                    return new PasswordAuthentication(Fusername, Fpassword);
                                }
                            });
                            String name = u.getUsername();
                            String toMail = u.getEmail();
                            String title = "Change Password";
                            String content = newPassword;
                            String message = "<!DOCTYPE html>\n"
                                    + "<html lang=\"en\">\n"
                                    + "    <head>\n"
                                    + "        <meta charset=\"UTF-8\">\n"
                                    + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                                    + "    </head>\n"
                                    + "    <body>\n"
                                    + "        <div style=\"height: 100vh; align-content: center; \">\n"
                                    + "            <div style=\"width: 85%;border: 1px solid #eee; border-radius: 8px; margin: auto;\">\n"
                                    + "                <div class=\"card-body\" style=\"padding: 24px;\">\n"
                                    + "                    <h2 style=\"text-align: center; margin-bottom: 0;\">F-Care Insurance</h2>\n"
                                    + "                    <p style=\"text-align: center\">Thay đổi mật khẩu</p>\n"
                                    + "                    <hr>\n"
                                    + "                    <p>xin chào <strong>" + u.getUsername() + "</strong></p>\n"
                                    + "                    <p>Bạn vừa thực hiện đổi mật khẩu mới!</p>\n"
                                    + "                    <p style=\"color: #ccc\"><i>Lưu ý <b>không chia sẻ</b> email này với bất kì ai!</i></p>\n"
                                    + "                    <p style=\"text-align: center;\">Đây là mật khẩu của bạn</p>\n"
                                    + "                    <p style=\"text-align: center; font-size: 32px; margin: 24px 16px; background-color: #7bc4d3;\">" + content + "</p>\n"
                                    + "                </div>\n"
                                    + "            </div>\n"
                                    + "        </div>\n"
                                    + "    </body>\n"
                                    + "</html>";
                            System.out.println(content);
                            System.out.println(toMail);
                            System.out.println(title);
                            System.out.println(name);
                            try {
                                Message msg = new MimeMessage(s);
                                msg.setFrom(new InternetAddress(Fusername));
                                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
                                msg.setSubject("Change Password");
                                msg.setContent(message, "text/html; charset=utf-8");
                                Transport.send(msg);
                            } catch (Exception e) {
                                System.out.println(e.getMessage());
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        request.setAttribute("user", u);
        request.getRequestDispatcher("updateProfile.jsp").forward(request, response);
    }

}
