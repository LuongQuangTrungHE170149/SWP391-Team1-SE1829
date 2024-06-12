
package Controller;

import Model.Consultation;
import Model.User;
import dal.ConsultationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Kha21
 */
public class ConsultationManagerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        final String loginFirst = "Bạn cần phải đăng nhập trước!";
        final String error = "Bạn không có quyền truy cập trang web này!";
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");

        //check
        if (u == null) {
            request.setAttribute("loginFirst", loginFirst);
            request.getRequestDispatcher("error").forward(request, response);
        } //neu da dang nhap => check role
        else {
            if (u.getRole().equalsIgnoreCase("user")) {
                request.setAttribute("error", error);
                request.getRequestDispatcher("error").forward(request, response);
            } //staff, manager true =>>
            else {
                ConsultationDAO cdb = new ConsultationDAO();
                List<Consultation> listAll;
                HashMap<String, Integer> totalStaffAnswer = cdb.getTotalStaffAnswer();
                List<Object[]> listStaffAnswer  = cdb.listStaffAnswer();

                
                String staff = request.getParameter("staff");
                String status = request.getParameter("status");
                String searchValue = request.getParameter("searchValue");
                System.out.println("staff: "+staff+"\nstatus: " + status + "\n search value: " + searchValue);

                listAll = cdb.searchConsultation(staff, status, searchValue);

                int totalSearchResult = listAll.size();
                int countAll = cdb.CountConsultationByStatus("all");
                int countNotReply = cdb.CountConsultationByStatus("0");
                int countReply = cdb.CountConsultationByStatus("1");

                int page = 1;
                int recordPerPage = 20;
                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }
                int start = (page - 1) * recordPerPage;
                int end = Math.min(start + recordPerPage, listAll.size());

                List<Consultation> listForPage = listAll.subList(start, end);
                int numberOfPages = (int) Math.ceil(listAll.size() * 1.0 / recordPerPage);
                
                
                request.setAttribute("staff", staff);
                request.setAttribute("listStaffAnswer", listStaffAnswer);
                request.setAttribute("status", status);
                request.setAttribute("totalSearchResult", totalSearchResult);
                request.setAttribute("searchValue", searchValue);
                request.setAttribute("totalStaffAnswer", totalStaffAnswer);
                request.setAttribute("countAll", countAll);
                request.setAttribute("countNotReply", countNotReply);
                request.setAttribute("countReply", countReply);
                request.setAttribute("listAll", listForPage);
                request.setAttribute("numberOfPages", numberOfPages);
                request.setAttribute("currentPage", page);
                request.getRequestDispatcher("consultationManager.jsp").forward(request, response);
            }
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
