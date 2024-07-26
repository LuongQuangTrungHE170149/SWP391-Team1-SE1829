/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Contract;
import Model.User;
import Model.Vehicle;
import Model.VehicleType;
import dal.ContractDAO;
import dal.UserDAO;
import dal.VehicleDAO;
import dal.VehicleTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import utils.EmailHelper;
import utils.GenerateContractCode;

/**
 *
 * @author QUANG TRUNG
 */
@WebServlet(name = "AddContractSuccess", urlPatterns = {"/AddContractSuccess"})
public class AddContractSuccess extends HttpServlet {
    private static String note = "";
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
            out.println("<title>Servlet AddContractSuccess</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddContractSuccess at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String description = request.getParameter("description");
        String numYearStr = request.getParameter("numYear");
        String status = request.getParameter("status");
        String exist = request.getParameter("exist");
        // Retrieve hidden inputs
        String vehicleType = request.getParameter("vehicleType");
        String vehicleOwnerFirstName = request.getParameter("vehicleOwnerFirstName");
        String vehicleOwnerLastName = request.getParameter("vehicleOwnerLastName");
        String vehicleOwnerAddress = request.getParameter("vehicleOwnerAddress");
        String licensePlate = request.getParameter("licensePlate");
        String chassisNumber = request.getParameter("chassisNumber");
        String engineNumber = request.getParameter("engineNumber");
        String customerId = request.getParameter("customerId");
        String accidentInsurance = request.getParameter("accidentInsurance");
        // Parse parameters as needed
        Date startDate = Date.valueOf(startDateStr);
        Date endDate = Date.valueOf(endDateStr);
        int numYear = Integer.parseInt(numYearStr);

        VehicleDAO vehicleDAO = new VehicleDAO();
        VehicleTypeDAO vehicleTypeDAO = new VehicleTypeDAO();

        VehicleType mt = vehicleTypeDAO.getVehicleTypeById(Integer.valueOf(vehicleType));
        Vehicle vehicle = new Vehicle();
        vehicle.setMotocycleType(mt);
        vehicle.setOwnerFirstName(vehicleOwnerFirstName);
        vehicle.setOwnerLastName(vehicleOwnerLastName);
        vehicle.setOwnerAddress(vehicleOwnerAddress);
        vehicle.setLicensePlates(licensePlate);
        vehicle.setEngine(engineNumber);
        vehicle.setChassis(chassisNumber);
        vehicleDAO.addVehicle(vehicle);
        Vehicle newVehicle = vehicleDAO.getLastVehicle();

        ContractDAO contractDAO = new ContractDAO();
        UserDAO userDAO = new UserDAO();
        Contract contract = new Contract();
        contract.setVehicle(newVehicle);
        String contractCode = GenerateContractCode.generateContractCode();
        contract.setCode(contractCode);
        contract.setStartDate(startDate);
        contract.setEndDate(endDate);
        
        contract.setDescription(description);
        // Kiểm tra nếu bảo hiểm tai nạn được chọn
        boolean isAccidentInsurance = "yes".equalsIgnoreCase(accidentInsurance);
        contract.setIsAccidentInsurance(isAccidentInsurance);

        // Cập nhật chi phí hợp đồng
        double payment = mt.getPrice() * numYear;
        if (isAccidentInsurance) {
            payment += 20000 * numYear; // Thêm 20,000 mỗi năm nếu có bảo hiểm tai nạn
        }
        contract.setPayment(payment);
        contract.setStatus(status);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        contract.setStaff(user);
        User customer = userDAO.getUserById(Integer.parseInt(customerId));
        
        contract.setCustomer(customer);
        contractDAO.addContract(contract);
        if(exist.equalsIgnoreCase("false")){
            note="Chúng tôi đã tạo cho bạn một tài khoản. Hãy sử dụng tài khoản này để đăng nhập và xem thông tin chi tiết hợp đồng! <br>"
                            + "<h3>Tài khoản: <b>" + customer.getEmail() + "</b></h3>"
                            + "<h3>Mật khẩu mặc định: <b>" + customer.getPhone()+ "</b></h3>";;
        }
//        request.setAttribute("contract", contract);
//        request.getRequestDispatcher("checkError.jsp").forward(request, response);
        note += "Hãy nhớ đăng nhập để xem chi tiết hợp đồng của bạn nhé!";
        EmailHelper.sendEmailRequestContractSuccess(customer.getEmail(), "[ĐĂNG KÝ] YÊU CẦU HỢP ĐỒNG BẢO HIỂM XE MÁY THÀNH CÔNG", (vehicleOwnerFirstName + " " + vehicleOwnerLastName).toUpperCase(), contractCode, note);
        response.sendRedirect("ListContract");
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
