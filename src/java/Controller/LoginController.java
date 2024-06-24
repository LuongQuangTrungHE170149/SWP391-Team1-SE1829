package Controller;

import Model.User;
import dal.ConsultationDAO;
import dal.NewsDAO;
import dal.PromotionDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

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
            } else if (u.getRole().equalsIgnoreCase("user") ) {
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

        ConsultationDAO cdb = new ConsultationDAO();
        PromotionDAO pdb = new PromotionDAO();
        NewsDAO ndb = new NewsDAO();
        int totalConsultation = cdb.CountConsultationByStatus("all");
        session.setAttribute("totalConsultation", totalConsultation);
        session.setAttribute("totalPromotion", pdb.getAll().size());
        session.setAttribute("totalNews", ndb.getAll().size());

        UserDAO dbUser = new UserDAO();
        User user = dbUser.findByUsernameOrEmailAndPassword(usernameEmail, password);
        if (user == null) {
            req.setAttribute("message", "You login failed");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            session.setAttribute("user", user);
            if (user.getRole().equalsIgnoreCase("user") || user.getRole().equalsIgnoreCase("customer") ) {
                resp.sendRedirect("home");
            } else if (user.getRole().equalsIgnoreCase("staff")) {
                resp.sendRedirect("staffHome");
            } else if (user.getRole().equalsIgnoreCase("manager")) {
                resp.sendRedirect("homeManager");
            }
        }
    }
}
