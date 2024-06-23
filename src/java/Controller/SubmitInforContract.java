package Controller;

import Model.Contract;
import Model.PasswordGenerator;
import Model.User;
import Model.Vehicle;
import dal.ContractDAO;
import dal.UserDAO;
import dal.VehicleDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "SubmitInforContract", urlPatterns = {"/SubmitInforContract"})
public class SubmitInforContract extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Do not use the PrintWriter for response output in this method.
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extract information from the request
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String motocycleType = request.getParameter("motocycleType");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String numYear = request.getParameter("numYear");
        String chassis = request.getParameter("chassis");
        String engine = request.getParameter("engine"); // Vehicle info
        String licensePlates = request.getParameter("licensePlates");

        try {
            // Create and insert user
            User user = new User();
            UserDAO userDao = new UserDAO();
            user.setUsername("user#" + (userDao.getLastUserId() + 1));
            user.setPassword(PasswordGenerator.generateRandomPassword(8, true, true, true, true));
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setGender(gender);
            user.setAddress(address);
            user.setEmail(email);
            user.setDob(Date.valueOf(dob));
            user.setPhone(phoneNumber);
            user.setRole("customer");
            boolean userSuccess = userDao.insert(user);
            int userId = userDao.getLastUserId();
            // Create and insert vehicle
            Vehicle vehicle = new Vehicle();
            vehicle.setMotocycleType(motocycleType);
            vehicle.setLicensePlates(licensePlates);
            vehicle.setChassis(chassis);
            vehicle.setEngine(engine);
            vehicle.setOwnerId(userId);

            VehicleDAO.INSTANCE.addVehicle(vehicle);
            int vehicleId = VehicleDAO.INSTANCE.getVehicleIdAfterAdd();

            Contract contract = new Contract();
            contract.setCustomerId(userId);
            contract.setVehicleId(vehicleId);
            contract.setContractType("bắt buộc");

            Date startDate = Date.valueOf(startDateStr);
            Date endDate = Date.valueOf(endDateStr);
            contract.setStartDate(startDate);
            contract.setEndDate(endDate);

            Double paymentAmount = 0D;
            switch (motocycleType) {
                case "Xe moto 2 bánh dung tích nhỏ hơn 50cc":
                case "Xe điện":
                    if (numYear.equals("1")) {
                        paymentAmount = 55000D;
                    } else if (numYear.equals("2")) {
                        paymentAmount = 100000D;
                    } else if (numYear.equals("3")) {
                        paymentAmount = 145000D;
                    }
                    break;
                case "Xe moto 2 bánh dung tích lớn hơn 50cc":
                    if (numYear.equals("1")) {
                        paymentAmount = 60000D;
                    } else if (numYear.equals("2")) {
                        paymentAmount = 115000D;
                    } else if (numYear.equals("3")) {
                        paymentAmount = 160000D;
                    }
                    break;
                case "Moto 3 bánh":
                case "Các loại xe còn lại":
                    if (numYear.equals("1")) {
                        paymentAmount = 290000D;
                    } else if (numYear.equals("2")) {
                        paymentAmount = 570000D;
                    } else if (numYear.equals("3")) {
                        paymentAmount = 850000D;
                    }
                    break;
                default:
                    paymentAmount = 0D;
            }
            contract.setPayment(paymentAmount);

            ContractDAO.INSTANCE.requestContract(contract);
            response.sendRedirect("RequestContractSuccess.jsp");
        } catch (Exception e) {
            Logger.getLogger(SubmitInforContract.class.getName()).log(Level.SEVERE, null, e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
