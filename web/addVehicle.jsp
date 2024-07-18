<%-- 
    Document   : addVehicle
    Created on : 30 thg 5, 2024, 13:13:39
    Author     : QUANG TRUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/header.css"/>
        <link rel="stylesheet" href="CSS/footer.css"/>
        <link rel="stylesheet" href="CSS/vehicle.css"/>
        <title>addVehicle</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            .container {
                padding-top: 50px;
            }

            .fs-5 {
                font-size: 1.25rem;
            }

            .fw-bold {
                font-weight: bold;
            }

            .text-419FA3 {
                color: #419FA3;
            }

            .input-form {
                margin-top: 20px;
            }

            .form-outline {
                position: relative;
                margin-bottom: 1.5rem;
            }

            .form-outline input {
                width: 100%;
                padding: 0.75rem 0.5rem;
                border: 1px solid #ccc;
                border-radius: 0.25rem;
            }

            .form-outline label {
                position: absolute;
                top: -0.75rem;
                left: 0.5rem;
                font-size: 0.75rem;
                color: #666;
            }

            .form-check-input {
                margin-right: 0.5rem;
            }

            .error-message {
                font-size: 0.875rem;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                color: #fff;
                padding: 0.5rem 1rem;
                border-radius: 0.25rem;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #004085;
            }
        </style>
    </head>
    <body>
        <jsp:include page="./header.jsp" />  
        <div class="container" style="padding-top: 200px;">
            
        <form action="AddVehicleSuccess" method="post" onsubmit="return saveVehicleInfo()">    
            <div class="fs-5 fw-bold text-419FA3">Thông tin phương tiện  </div>
            <hr class="text-419FA3">
            <div class="input-form">
<!--                <div class="row mb-3">
                    <div class="col-12 col-lg-6">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="sameAsCustomer" ${vehicleOwnerFirstName == firstName?'checked':''} onchange="fillCustomerInfo()"/>
                            <label for="sameAsCustomer" class="form-check-label">Người yêu cầu là chủ phương tiện</label>
                        </div>
                    </div>
                </div>-->
                <input type="hidden" name="customerId" value="${user.id}">
                <div class="col-12 col-lg-4 border-end">
                    <label for="vehicle_type" class="ms-1">Chọn loại xe</label><br>
                    <select id="vehicle_type" name="vehicle_type" class="m-0 p-0" required>
                        <option value="">-- chọn loại xe --</option>

                        <c:forEach items="${listVT}" var="v">
                            <option value="${v.id}" ${motocycleType == v.id?'selected':''}>${v.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="row mb-3">
                    <div class="col-12 col-lg-6">
                        <div class="form-outline" data-mdb-input-init>
                            <input type="text" name="vehicleOwnerFirstName" id="vehicleOwnerFirstName" value="${vehicleOwnerFirstName}" class="form-control" required=""/>
                            <label for="vehicleOwnerFirstName" class="form-label">Họ chủ xe<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message text-danger" id="vehicleOwnerFirstNameError"></span>
                    </div>
                    <div class="col-12 col-lg-6">
                        <div class="form-outline" data-mdb-input-init>
                            <input type="text" name="vehicleOwnerLastName" id="vehicleOwnerLastName" value="${vehicleOwnerLastName}" class="form-control" required=""/>
                            <label for="vehicleOwnerLastName" class="form-label">Tên chủ xe<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message text-danger" id="vehicleOwnerLastNameError"></span>
                    </div>
                </div>
                <div class="row justify-content-center mb-3">
                    <div class="col-12 col-lg-6">
                        <div class="form-outline" data-mdb-input-init>
                            <input type="text" name="vehicleOwnerAddress" id="vehicleOwnerAddress" value="${vehicleOwnerAddress}" class="form-control" required=""/>
                            <label for="vehicleOwnerAddress" class="form-label">Địa chỉ chủ xe<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message text-danger" id="vehicleOwnerAddressError"></span>
                    </div>
                    <div class="col-12 col-lg-6">
                        <div class="form-outline" data-mdb-input-init>
                            <input type="text" name="licensePlate" id="licensePlate" value="${licensePlate}" class="form-control" required=""/>
                            <label for="licensePlate" class="form-label">Biển số xe<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message text-danger" id="licensePlateError"></span>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12 col-lg-6">
                        <div class="form-outline" data-mdb-input-init>
                            <input type="text" name="chassisNumber" id="chassisNumber" value="${chassisNumber}" class="form-control" required=""/>
                            <label for="chassisNumber" class="form-label">Số khung<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message text-danger" id="chassisNumberError"></span>
                    </div>
                    <div class="col-12 col-lg-6">
                        <div class="form-outline" data-mdb-input-init>
                            <input type="text" name="engineNumber" id="engineNumber" value="${engineNumber}" class="form-control" required=""/>
                            <label for="engineNumber" class="form-label">Số máy<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message text-danger" id="engineNumberError"></span>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12 col-lg-12">
                        <div>(<span class="text-danger"> *</span>) Thông tin cần thiết</div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12 col-lg-3">
                        <button type="submit" class="btn btn-primary btn-block" data-mdb-ripple-init onclick="saveVehicleInfo()">Lưu thông tin</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    <script>
        function validateLicensePlate() {
                const licensePlateRegex = /^[0-9]{2}[A-Z][0-9]{1}[0-9]{3,5}$/;
                const licensePlateValue = $("#licensePlate").val().trim();

                if (!licensePlateValue) {
                    $("#licensePlateError").html("Vui lòng nhập biển số xe");
                    return false;
                } else if (!licensePlateRegex.test(licensePlateValue)) {
                    $("#licensePlateError").html("Biển số xe không hợp lệ");
                    return false;
                } else {
                    $("#licensePlateError").html("");
                    return true;
                }
            }
            function validateChassisNumber() {
                const chassisNumberRegex = /^[A-Z0-9]{6,17}$/;
                const chassisNumberValue = $("#chassisNumber").val().trim();

                if (!chassisNumberValue) {
                    $("#chassisNumberError").html("Vui lòng nhập số khung");
                    return false;
                } else if (!chassisNumberRegex.test(chassisNumberValue)) {
                    $("#chassisNumberError").html("Số khung bao gồm 6 đến 17 kí tự A-Z 0-9");
                    return false;
                } else {
                    $("#chassisNumberError").html("");
                    return true;
                }
            }
            function validateEngineNumber() {
                const engineNumberRegex = /^[A-Z0-9]{6,17}$/;
                const engineNumberValue = $("#engineNumber").val().trim();

                if (!engineNumberValue) {
                    $("#engineNumberError").html("Vui lòng nhập số máy");
                    return false;
                } else if (!engineNumberRegex.test(engineNumberValue)) {
                    $("#engineNumberError").html("Số máy từ 6 đến 17 kí tự A-Z 0-9");
                    return false;
                } else {
                    $("#engineNumberError").html("");
                    return true;
                }
            }
            
            function saveVehicleInfo() {
                let isValid = true;

                // Xóa thông báo lỗi cũ
                $(".error-message").html("");
                if (!$("#vehicleOwnerFirstName").val()) {
                    $("#vehicleOwnerFirstNameError").html("Vui lòng nhập họ chủ sở hữu");
                    isValid = false;
                }
                if (!$("#vehicleOwnerLastName").val()) {
                    $("#vehicleOwnerLastNameError").html("Vui lòng nhập tên chủ sở hữu");
                    isValid = false;
                }
                if (!$("#vehicleOwnerAddress").val()) {
                    $("#vehicleOwnerAddressError").html("Vui lòng nhập địa chỉ chủ sở hữu");
                    isValid = false;
                }
                if (!validateLicensePlate()) {
                    isValid = false;
                }
                if (!validateChassisNumber()) {
                    isValid = false;
                }
                if (!validateEngineNumber()) {
                    isValid = false;
                }
                return isValid;
            }
    </script>
</body>
</html>
