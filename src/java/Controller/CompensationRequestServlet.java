/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Accident;
import Model.Compensation;
import Model.User;
import dal.AccidentDAO;
import dal.CompensationDAO;
import dal.ContractDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.math.BigInteger;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author tranm
 */
@MultipartConfig
public class CompensationRequestServlet extends HttpServlet {

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
            out.println("<title>Servlet CompensationRequestServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CompensationRequestServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("compensation.jsp").forward(request, response);
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
        String policyNumber = request.getParameter("policyNumber");
        String incidentDate = request.getParameter("incidentDate");
        String incidentLocation = request.getParameter("incidentLocation");
        String policeReportNumber = request.getParameter("policeReportNumber");
        String vehicleDamage = request.getParameter("vehicleDamage");
        String incidentDescription = request.getParameter("incidentDescription");
        String estimatedRepairCost = request.getParameter("estimatedRepairCost");
        String image = "images/accidents_image/null.png";
        int contractId = 0;
        try {
            Part filePart = request.getPart("supportingDocuments");
            String url = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            image = "images/accidents_image/" + url;
            contractId = Integer.parseInt(policyNumber);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (ContractDAO.INSTANCE.checkContractByCustomerId(contractId, u.getId()) != null) {
            Accident accident = new Accident();
            accident.setCustomerId(u.getId());
            Date sqlDate = Date.valueOf(incidentDate);
            accident.setDateOfAccident(sqlDate);
            accident.setAccidentLocation(incidentLocation);
            accident.setPoliceReportNumber(policeReportNumber);
            accident.setDescriptionOfAccident(incidentDescription);
            accident.setVehicleDamage(vehicleDamage);
            accident.setImage(image);
            int idAccident = AccidentDAO.INSTANCE.insertAccident(accident);
            Compensation compensation = new Compensation();
            compensation.setCustomerId(u.getId());
            compensation.setContractId(contractId);
            compensation.setAccidentId(idAccident);
            compensation.setEstimatedRepairCost(new BigInteger(estimatedRepairCost));
            LocalDate currentDate = LocalDate.now(); // Get the current date
            Date sqlCurrentDate = Date.valueOf(currentDate); // Convert to SQL date
            compensation.setDateFiled(sqlCurrentDate);
            CompensationDAO.INSTANCE.insertCompensation(compensation);
            session.setAttribute("requestSuccess", "Gửi yêu cầu bồi thường thành công");
            response.sendRedirect("compensationHistory?id="+u.getId());
        } else {
            request.setAttribute("error", "Số bảo hiểm của bạn không tồn tại");
            request.setAttribute("policyNumber", policyNumber);
            request.setAttribute("incidentDate", incidentDate);
            request.setAttribute("incidentLocation", incidentLocation);
            request.setAttribute("policeReportNumber", policeReportNumber);
            request.setAttribute("vehicleDamage", vehicleDamage);
            request.setAttribute("incidentDescription", incidentDescription);
            request.setAttribute("estimatedRepairCost", estimatedRepairCost);
            request.getRequestDispatcher("compensation.jsp").forward(request, response);
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
