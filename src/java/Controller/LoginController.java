package Controller;

import Model.Compensation;
import Model.Contract;
import Model.User;
import dal.CompensationDAO;
import Model.Notification;
import Model.User;
import com.google.gson.Gson;
import dal.ConsultationDAO;
import dal.ContractDAO;
import dal.NewsDAO;
import dal.NotificationDAO;
import dal.PromotionDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import socket.NotificationWebSocket;

/**
 *
 * @author trand
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("user");
        if (u != null) {
            if (u.getRole().equalsIgnoreCase("staff")) {
                resp.sendRedirect("staffHome");
            } else if (u.getRole().equalsIgnoreCase("user")) {
                resp.sendRedirect("home");
            } else if (u.getRole().equalsIgnoreCase("manager")) {
                resp.sendRedirect("homeManager");
            }
        } else {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usernameEmail = req.getParameter("usernameEmail");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();

        UserDAO dbUser = new UserDAO();
        User user = dbUser.findByUsernameOrEmailAndPassword(usernameEmail, password);
        if (user == null) {
            req.setAttribute("message", "Đăng nhập thất bại");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            if (user.getRole().equalsIgnoreCase("user") || user.getRole().equalsIgnoreCase("customer")) {
                resp.sendRedirect("home");
            } else if (user.getRole().equalsIgnoreCase("staff")) {

                List<Compensation> listCompensationPending = CompensationDAO.INSTANCE.getCompensationsPending();
                session.setAttribute("totalApplication", listCompensationPending.size());

                UserDAO udb = new UserDAO();
                List<User> listCustomerByStaff = udb.getAllCustomerByStaff(user.getId());
                
                ConsultationDAO cdb = new ConsultationDAO();
                PromotionDAO pdb = new PromotionDAO();
                ContractDAO con = new ContractDAO();
                NewsDAO ndb = new NewsDAO();
                session.setAttribute("totalCustomerByStaff", listCustomerByStaff.size());
                session.setAttribute("totalContract", con.getAll().size());
                session.setAttribute("totalConsultation", cdb.getAll().size());
                session.setAttribute("totalPromotion", pdb.getAll().size());
                session.setAttribute("totalNews", ndb.getAll().size());
                resp.sendRedirect("staffHome");
            } else if (user.getRole().equalsIgnoreCase("manager")) {
                resp.sendRedirect("homeManager");
            }
        }
    }
}
