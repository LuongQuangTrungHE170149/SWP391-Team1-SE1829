package Controller;

import Model.Contract;
import Model.Notification;
import Model.User;
import Model.Vehicle;
import Model.VehicleType;
import dal.ContractDAO;
import dal.NotificationDAO;
import utils.GenerateContractCode;
import dal.UserDAO;
import dal.VehicleDAO;
import dal.VehicleTypeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import socket.NotificationWebSocket;
import utils.EmailHelper;

public class SubmitContractServlet extends HttpServlet {

    private static String note = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udb = new UserDAO();
        User user = (User) request.getSession().getAttribute("user");

        if (request.getSession().getAttribute("vehicleOwnerFirstName") == null) {
            response.sendRedirect("home");
            return;
        }
        try {
            String firstName = (String) request.getSession().getAttribute("firstName");
            String lastName = (String) request.getSession().getAttribute("lastName");
            String genderParam = (String) request.getSession().getAttribute("gender");
            int gender = genderParam.equalsIgnoreCase("true") ? 1 : 0;
            String email = (String) request.getSession().getAttribute("email");
            String phoneNumber = (String) request.getSession().getAttribute("phoneNumber");
            Date dob = (Date) request.getSession().getAttribute("dob");
            String address = (String) request.getSession().getAttribute("address");
            String OwnerFirstName = (String) request.getSession().getAttribute("vehicleOwnerFirstName");
            String OwnerLastName = (String) request.getSession().getAttribute("vehicleOwnerLastName");
            String OwnerAddress = (String) request.getSession().getAttribute("vehicleOwnerAddress");
            String licensePlate = (String) request.getSession().getAttribute("licensePlate");
            String chassisNumber = (String) request.getSession().getAttribute("chassisNumber");
            String engineNumber = (String) request.getSession().getAttribute("engineNumber");
            int vehicleType = (Integer) request.getSession().getAttribute("vehicleType");

            Date startDate = (Date) request.getSession().getAttribute("startDate");
            Date endDate = (Date) request.getSession().getAttribute("endDate");

            double totalPrice = (Integer) request.getSession().getAttribute("totalPrice");
            boolean isAccidentInsurance = (boolean) request.getSession().getAttribute("isAccidentInsurance");

            VehicleTypeDAO vdb = new VehicleTypeDAO();

            Vehicle v = new Vehicle();
            v.setOwnerFirstName(OwnerFirstName);
            v.setOwnerLastName(OwnerLastName);
            v.setOwnerAddress(OwnerAddress);
            v.setLicensePlates(licensePlate);
            v.setChassis(chassisNumber);
            v.setEngine(engineNumber);

            VehicleType vt = vdb.getVehicleTypeById(vehicleType);
            v.setMotocycleType(vt);

            VehicleDAO vedb = new VehicleDAO();
            System.out.println(vedb.addVehicle(v));
            Vehicle ve = vedb.getLastVehicle();
            v.setId(ve.getId());

            Contract c = new Contract();

            String contractCode = GenerateContractCode.generateContractCode();
            c.setCode(contractCode);

            if (user != null) {
                user.setRole("customer");
                note = "Hãy nhớ đăng nhập để xem chi tiết hợp đồng của bạn nhé!";
                c.setDescription("khách hàng đã có tài khoản mua bảo hiểm");
                if (!user.getRole().equalsIgnoreCase("Staff")) {
                        System.out.println("update role: " + udb.updateUserRoleById(user.getId(), "customer"));
                    } 
            } else {
                User existingUser = udb.getUserByPhoneOrEmail(phoneNumber, email);
                if (existingUser == null) {
                    user = new User();
                    user.setUsername(email);
                    user.setPassword(phoneNumber);
                    user.setFirstName(firstName);
                    user.setLastName(lastName);
                    user.setAddress(address);
                    user.setRole("customer");
                    user.setGender(gender);
                    user.setPhone(phoneNumber);
                    user.setEmail(email);
                    user.setDob(dob);
                    
                    System.out.println(udb.insert(user));

                    user.setId(udb.getLastUserId());
                    c.setDescription("khách hàng mới được cấp tài khoản mua bảo hiểm");
                    note = "Chúng tôi đã tạo cho bạn một tài khoản. Hãy sử dụng tài khoản này để đăng nhập và xem thông tin chi tiết hợp đồng! <br>"
                            + "<h3>Tài khoản: <b>" + email + "</b></h3>"
                            + "<h3>Mật khẩu mặc định: <b>" + phoneNumber + "</b></h3>";
                    
                } else {
                    user = existingUser;
                    user.setRole("Customer");
                    c.setDescription("khách hàng đã có tài khoản mua bảo hiểm");
                    note = "Hệ thống kiểm tra bạn đã có tài khoản. "
                            + "Vui lòng dùng tài khoản của bạn để đăng nhập xem thông tin chi tiết hợp đồng!";
//                    //TODO: Update sucess
//                    Notification notification = new Notification();
//                    notification.setTitle("Success contract");
//                    notification.setUserId(user);
//                    notification.setIsClick(false);
//                    int contractId = 0;
//                    notification.setLink("/contract?id=" + contractId);
//                    NotificationWebSocket.sendMessageToUser(user.getId() + "", notification);

                    // Kiểm tra vai trò của người dùng trước khi cập nhật
                    if (!user.getRole().equalsIgnoreCase("Staff")) {
                        System.out.println("update role: " + udb.updateUserRoleById(user.getId(), "customer"));
                    }
                }
            }

            c.setVehicle(v);
            c.setStartDate(startDate);
            c.setEndDate(endDate);
            c.setIsAccidentInsurance(isAccidentInsurance);
            c.setPayment(totalPrice);
            c.setStatus("Pending");
            c.setCustomer(user);

            ContractDAO cdb = new ContractDAO();
            Contract contract = cdb.findLastContract();
            System.out.println(cdb.addContract(c));
            EmailHelper.sendEmailRequestContractSuccess(email, "[ĐĂNG KÝ] YÊU CẦU HỢP ĐỒNG BẢO HIỂM XE MÁY THÀNH CÔNG", (firstName + " " + lastName).toUpperCase(), contractCode, note);

            request.getSession().removeAttribute("totalPrice");
            request.getSession().removeAttribute("num_years");
            request.getSession().removeAttribute("firstName");
            request.getSession().removeAttribute("address");
            request.getSession().removeAttribute("v");
            request.getSession().removeAttribute("dob");
            request.getSession().removeAttribute("phoneNumber");
            request.getSession().removeAttribute("startDate");
            request.getSession().removeAttribute("endDate");
            request.getSession().removeAttribute("vehicleOwnerFirstName");
            request.getSession().removeAttribute("vehicleOwnerLastName");
            request.getSession().removeAttribute("vehicleOwnerAddress");
            request.getSession().removeAttribute("licensePlate");
            request.getSession().removeAttribute("chassisNumber");
            request.getSession().removeAttribute("engineNumber");
            response.sendRedirect("requestContractSuccess.jsp");

            NotificationDAO dbNotify = new NotificationDAO();
            UserDAO dbUser = new UserDAO();
            List<User> users = dbUser.getAllUserByRole("Customer");
            Notification notification = new Notification();
            notification.setTitle("Bạn có 1 hợp đồng mới");
            notification.setIsClick(true);
            notification.setLink("manageContractCustomer?customerId="+contract.getCustomer().getId());
            notification.setUserId(user);
            dbNotify.insert(notification);
            NotificationWebSocket.sendMessageToUser(user.getId() + "", notification);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extract information from the request
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
