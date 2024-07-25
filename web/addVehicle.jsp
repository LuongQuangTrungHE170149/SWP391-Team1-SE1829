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
        <title>addVehicle</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f7fa;
            }

            .dashboard {
                width: 200px;
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                background-color: #343a40;
                color: #fff;
                padding: 20px;
                box-sizing: border-box;
            }

            .container {
                margin-left: 220px;
                padding: 40px;
                box-sizing: border-box;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                max-width: 900px;
                margin: 60px auto;
            }

            .fs-5 {
                font-size: 1.5rem;
                margin-bottom: 20px;
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

            .form-outline input, .form-outline select {
                width: 100%;
                padding: 0.75rem;
                border: 1px solid #ccc;
                border-radius: 0.25rem;
                font-size: 1rem;
            }

            .form-outline label {
                position: absolute;
                top: -10px;
                left: 10px;
                font-size: 0.75rem;
                color: #666;
                background-color: #fff;
                padding: 0 5px;
            }

            .error-message {
                font-size: 0.875rem;
                color: #dc3545;
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
                display: inline-block;
                margin-top: 20px;
                transition: background-color 0.3s;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
                margin: 0 -15px;
            }

            .col-12 {
                padding: 0 15px;
                width: 100%;
            }

            .col-lg-4 {
                width: 33.333%;
            }

            .col-lg-6 {
                width: 50%;
            }

            @media (max-width: 768px) {
                .dashboard {
                    width: 100%;
                    height: auto;
                    position: relative;
                    color: #333;
                    background-color: #f8f9fa;
                    border-bottom: 1px solid #ddd;
                }

                .container {
                    margin-left: 0;
                    max-width: 100%;
                }

                .col-lg-4, .col-lg-6 {
                    width: 100%;
                }
            }
        </style>
        <script>
            function saveVehicleInfo() {
                // Validate chassis number
                var chassisNumber = document.getElementById("chassisNumber").value;
                var engineNumber = document.getElementById("engineNumber").value;

                var isValid = true;

                if (chassisNumber.length < 6 || chassisNumber.length > 17) {
                    document.getElementById("chassisNumberError").innerText = "Số khung phải từ 6 đến 17 ký tự.";
                    isValid = false;
                } else {
                    document.getElementById("chassisNumberError").innerText = "";
                }

                if (engineNumber.length < 6 || engineNumber.length > 17) {
                    document.getElementById("engineNumberError").innerText = "Số máy phải từ 6 đến 17 ký tự.";
                    isValid = false;
                } else {
                    document.getElementById("engineNumberError").innerText = "";
                }

                return isValid;
            }
        </script>
    </head>
    <body>
        
        <div class="container">
            <form action="AddVehicleSuccess" method="post" onsubmit="return saveVehicleInfo()">    
                <div class="fs-5 fw-bold text-419FA3">Thông tin phương tiện</div>
                <hr class="text-419FA3">
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
                            <div class="form-outline" data-mdb-input-init>
                                <input type="text" name="chassisNumber" id="chassisNumber" value="${chassisNumber}" class="form-control" required=""/>
                                <label for="chassisNumber" class="form-label">Số khung<span class="text-danger"> *</span></label>
                            </div>
                            <span class="error-message" id="chassisNumberError"></span>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="form-outline" data-mdb-input-init>
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
