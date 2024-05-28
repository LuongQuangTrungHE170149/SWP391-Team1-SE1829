import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import utils.EmailHelper;

@WebServlet("/sendCode")
public class SendCodeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String recipientEmail = "duongtxhe160708@fpt.edu.vn"; // Thay đổi địa chỉ email cần gửi đến
        String subject = "Verification Code";
        String code = EmailHelper.generateOTP();
        String body = "Your verification code is: " + code;

      EmailHelper.sendEmail(recipientEmail, subject, body);

        response.getWriter().println("Verification code sent to " + recipientEmail);
    }
}