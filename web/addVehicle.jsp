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
                display: flex;
                margin: 0;
                padding: 0;
            }

            .dashboard {
                width: 200px; /* Adjust the width as needed */
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                background-color: #f8f9fa;
                border-right: 1px solid #ddd;
                padding: 20px;
                box-sizing: border-box;
            }

            .container {
                margin-left: 200px; /* Adjust this to match the width of the dashboard */
                padding: 50px;
                box-sizing: border-box;
                width: calc(100% - 200px); /* Adjust this to match the width of the dashboard */
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
        <div class="dashboard">
            <jsp:include page="staffDashboard.jsp"/>
        </div>
        <div class="container">
            <form action="AddVehicleSuccess" method="post" onsubmit="return saveVehicleInfo()">    
                <div class="fs-5 fw-bold text-419FA3">Thông tin phương tiện</div>
                <hr class="text-419FA3">
                <div class="input-form">
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
                                <label for="licensePlate" class="form-label">Biển số xe<span class="text-danger"> *</span></
