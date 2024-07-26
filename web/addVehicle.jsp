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
   

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Điền thông tin phương tiện</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <style>
            .text-419FA3 {
                color: #419FA3;
            }
            .error-message {
                font-size: 0.875rem;
                color: #dc3545;
            }
        </style>

    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>
        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start mb-3 px-2"> 
                <div class="fs-3 fw-bold text-info">Tạo hợp đồng</div>
            </div>
            <div class="m-auto" style="width: 700px; margin-top: 10% !important;">

                <div class="card">
                    <div class="card-body">
                        <form action="AddVehicleSuccess" method="post" onsubmit="return saveVehicleInfo()">    
                            <div class="fs-5 fw-bold text-419FA3">Thông tin phương tiện</div>
                            <hr class="text-419FA3">
                            <div class="input-form">
                                <input type="hidden" name="customerId" value="${user.id}">
                                <div class="col-12 col-lg-12 mb-3">
                                    <label for="vehicle_type" class="ms-1">Chọn loại xe</label><br>
                                    <select id="vehicle_type" class="form-select" name="vehicle_type" required>
                                        <option value="">-- chọn loại xe --</option>
                                        <c:forEach items="${listVT}" var="v">
                                            <option value="${v.id}" ${motocycleType == v.id?'selected':''}>${v.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="row">
                                    <div class="col-12 col-lg-6">
                                        <div class="form-outline mb-3" data-mdb-input-init>
                                            <input class="form-control" type="text" name="vehicleOwnerFirstName" id="vehicleOwnerFirstName" value="${vehicleOwnerFirstName}" required="">
                                            <label class="form-label" for="vehicleOwnerFirstName">Họ chủ xe<span class="text-danger"> *</span></label>
                                        </div>
                                        <span class="error-message" id="vehicleOwnerFirstNameError"></span>
                                    </div>
                                    <div class="col-12 col-lg-6" >
                                        <div class="form-outline mb-3" data-mdb-input-init>
                                            <input class="form-control" type="text" name="vehicleOwnerLastName" id="vehicleOwnerLastName" value="${vehicleOwnerLastName}" required="">
                                            <label class="form-label" for="vehicleOwnerLastName">Tên chủ xe<span class="text-danger"> *</span></label>
                                        </div>
                                        <span class="error-message" id="vehicleOwnerLastNameError"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 col-lg-6">
                                        <div class="form-outline mb-3" data-mdb-input-init>
                                            <input class="form-control" type="text" name="vehicleOwnerAddress" id="vehicleOwnerAddress" value="${vehicleOwnerAddress}" required="">
                                            <label class="form-label" for="vehicleOwnerAddress">Địa chỉ chủ xe<span class="text-danger"> *</span></label>
                                        </div>
                                        <span class="error-message" id="vehicleOwnerAddressError"></span>
                                    </div>
                                    <div class="col-12 col-lg-6">
                                        <div class="form-outline mb-3" data-mdb-input-init>
                                            <input class="form-control" type="text" name="licensePlate" id="licensePlate" value="${licensePlate}" required="">
                                            <label class="form-label" for="licensePlate">Biển số xe<span class="text-danger"> *</span></label>
                                        </div>
                                        <span class="error-message" id="licensePlateError"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 col-lg-6">
                                        <div class="form-outline mb-3" data-mdb-input-init>
                                            <input class="form-control" type="text" name="chassisNumber" id="chassisNumber" value="${chassisNumber}" class="form-control" required=""/>
                                            <label class="form-label" for="chassisNumber" class="form-label">Số khung<span class="text-danger"> *</span></label>
                                        </div>
                                        <span class="error-message" id="chassisNumberError"></span>
                                    </div>
                                    <div class="col-12 col-lg-6">
                                        <div class="form-outline mb-3" data-mdb-input-init>
                                            <input class="form-control" type="text" name="engineNumber" id="engineNumber" value="${engineNumber}" class="form-control" required=""/>
                                            <label class="form-label" for="engineNumber" class="form-label">Số máy<span class="text-danger"> *</span></label>
                                        </div>
                                        <span class="error-message" id="engineNumberError"></span>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary" data-mdb-ripple-init>Thêm phương tiện</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--mdb bootstrap-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
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
    </body>

</html>
