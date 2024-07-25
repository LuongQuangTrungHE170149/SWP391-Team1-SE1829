<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>addVehicle</title>
    <style>
        /* Các kiểu CSS của bạn ở đây */
        /* ... */
    </style>
    <script>
        function validateContactInfo() {
            var email = document.getElementById("email").value;
            var phone = document.getElementById("phone").value;
            var isValid = true;

            // Reset error messages
            document.getElementById("emailError").innerText = "";
            document.getElementById("phoneError").innerText = "";

            // Validate email
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                document.getElementById("emailError").innerText = "Email không hợp lệ.";
                isValid = false;
            }

            // Validate phone number
            var phonePattern = /^[0-9]{10,15}$/;
            if (!phonePattern.test(phone)) {
                document.getElementById("phoneError").innerText = "Số điện thoại phải từ 10 đến 15 chữ số.";
                isValid = false;
            }

            return isValid;
        }

        function saveVehicleInfo() {
            if (document.getElementById("showContactForm").value === "true") {
                return validateContactInfo();
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <form action="AddVehicleSuccess" method="post" onsubmit="return saveVehicleInfo()">    
            <div class="fs-5 fw-bold text-419FA3">Thông tin phương tiện</div>
            <hr class="text-419FA3">
            
            <c:if test="${showContactForm}">
                <div class="input-form">
                    <div class="row mb-3">
                        <div class="col-12 col-lg-6">
                            <div class="form-outline">
                                <input type="email" name="email" id="email" required>
                                <label for="email">Email<span class="text-danger"> *</span></label>
                            </div>
                            <span class="error-message" id="emailError"></span>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="form-outline">
                                <input type="text" name="phone" id="phone" required>
                                <label for="phone">Số điện thoại<span class="text-danger"> *</span></label>
                            </div>
                            <span class="error-message" id="phoneError"></span>
                        </div>
                    </div>
                </div>
            </c:if>

            <div class="input-form">
                <input type="hidden" name="customerId" value="${user.id}">
                <div class="col-12 col-lg-4">
                    <label for="vehicle_type" class="ms-1">Chọn loại xe</label><br>
                    <select id="vehicle_type" name="vehicle_type" required>
                        <option value="">-- chọn loại xe --</option>
                        <c:forEach items="${listVT}" var="v">
                            <option value="${v.id}" ${motocycleType == v.id?'selected':''}>${v.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-6">
                        <div class="form-outline">
                            <input type="text" name="vehicleOwnerFirstName" id="vehicleOwnerFirstName" value="${vehicleOwnerFirstName}" required="">
                            <label for="vehicleOwnerFirstName">Họ chủ xe<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message" id="vehicleOwnerFirstNameError"></span>
                    </div>
                    <div class="col-12 col-lg-6">
                        <div class="form-outline">
                            <input type="text" name="vehicleOwnerLastName" id="vehicleOwnerLastName" value="${vehicleOwnerLastName}" required="">
                            <label for="vehicleOwnerLastName">Tên chủ xe<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message" id="vehicleOwnerLastNameError"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-lg-6">
                        <div class="form-outline">
                            <input type="text" name="vehicleOwnerAddress" id="vehicleOwnerAddress" value="${vehicleOwnerAddress}" required="">
                            <label for="vehicleOwnerAddress">Địa chỉ chủ xe<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message" id="vehicleOwnerAddressError"></span>
                    </div>
                    <div class="col-12 col-lg-6">
                        <div class="form-outline">
                            <input type="text" name="licensePlate" id="licensePlate" value="${licensePlate}" required="">
                            <label for="licensePlate">Biển số xe<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message" id="licensePlateError"></span>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12 col-lg-6">
                        <div class="form-outline">
                            <input type="text" name="chassisNumber" id="chassisNumber" value="${chassisNumber}" class="form-control" required=""/>
                            <label for="chassisNumber" class="form-label">Số khung<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message" id="chassisNumberError"></span>
                    </div>
                    <div class="col-12 col-lg-6">
                        <div class="form-outline">
                            <input type="text" name="engineNumber" id="engineNumber" value="${engineNumber}" class="form-control" required=""/>
                            <label for="engineNumber" class="form-label">Số máy<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message" id="engineNumberError"></span>
                    </div>
                </div>
                <button type="submit" class="btn-primary">Thêm phương tiện</button>
            </div>
        </form>
    </div>
</body>
</html>
