/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Accident;
import Model.Compensation;
import Model.Contract;
import Model.User;
import dal.AccidentDAO;
import dal.CompensationDAO;
import dal.ContractDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author tranm
 */
public class CompensationApproveServlet extends HttpServlet {

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
            out.println("<title>Servlet CompensastionApproveServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CompensastionApproveServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            if (user.getRole().equalsIgnoreCase("staff")) {
                UserDAO userDao = new UserDAO();
                ContractDAO cd = new ContractDAO();
                List<Compensation> listCompensationPending = CompensationDAO.INSTANCE.getCompensationsPending();
                List<Compensation> listCompensationNotPending = CompensationDAO.INSTANCE.getCompensationsNotPending();
                List<User> userList = userDao.getAllUserByRole("customer");
                List<Accident> accidentList = AccidentDAO.INSTANCE.getAllAccidents();
                List<Contract> contractList = cd.getAll();
                session.setAttribute("totalApplication", listCompensationPending.size());
                request.setAttribute("listCompensationPending", listCompensationPending);
                request.setAttribute("listCompensationNotPending", listCompensationNotPending);
                request.setAttribute("userList", userList);
                request.setAttribute("accidentList", accidentList);
                request.setAttribute("contractList", contractList);

                request.getRequestDispatcher("compensationApprove.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");

            }

        } else {
            response.sendRedirect("login");

        }

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
        User user = (User) session.getAttribute("user");
        String notes = request.getParameter("notes");
        String compensationId = request.getParameter("compensationId");
        String status = request.getParameter("status");
        int id = 0;
        try {
            id = Integer.parseInt(compensationId);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        Compensation compensation = new Compensation();
        compensation.setNotes(notes);
        compensation.setId(id);
        compensation.setStaffId(user.getId());
        compensation.setClaimStatus(status);
        LocalDate currentDate = LocalDate.now();
        Date sqlCurrentDate = Date.valueOf(currentDate);
        compensation.setDateApproved(sqlCurrentDate);
        CompensationDAO.INSTANCE.updateStatusCompensation(compensation);
        response.sendRedirect("compensationApprove");

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
