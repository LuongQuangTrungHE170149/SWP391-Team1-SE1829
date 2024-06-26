package Controller;

import Model.Accident;
import Model.Compensation;
import Model.User;
import dal.AccidentDAO;
import dal.CompensationDAO;
import dal.ContractDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.math.BigInteger;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig
public class CompensationRequestServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CompensationRequestServlet.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            if (user.getRole().equalsIgnoreCase("customer")) {
                request.getRequestDispatcher("compensation.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");

            }
        } else {
            response.sendRedirect("login");

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        ContractDAO cdb = new ContractDAO();
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
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadDir = getServletContext().getRealPath("/") + "images/accidents_image";
                LOGGER.log(Level.INFO, "Upload directory: {0}", uploadDir);
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    boolean dirCreated = uploadDirFile.mkdirs();
                    LOGGER.log(Level.INFO, "Directory created: {0}", dirCreated);
                }
                File file = new File(uploadDir, fileName);
                LOGGER.log(Level.INFO, "File path: {0}", file.getAbsolutePath());
                try (InputStream input = filePart.getInputStream(); OutputStream output = new FileOutputStream(file)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = input.read(buffer)) != -1) {
                        output.write(buffer, 0, bytesRead);
                    }
                }
                image = "images/accidents_image/" + fileName;
            }
            contractId = Integer.parseInt(policyNumber);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "File upload error", e);
        }
       
        if (cdb.checkContractByCustomerId(contractId, u.getId()) != null) {
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
            LocalDate currentDate = LocalDate.now();
            Date sqlCurrentDate = Date.valueOf(currentDate);
            compensation.setDateFiled(sqlCurrentDate);
            CompensationDAO.INSTANCE.insertCompensation(compensation);
            session.setAttribute("requestSuccess", "Gửi yêu cầu bồi thường thành công");
            response.sendRedirect("compensationHistory?id=" + u.getId());
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
