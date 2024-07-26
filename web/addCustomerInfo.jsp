<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin người yêu cầu bảo hiểm</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <style>
            .text-419FA3 {
                color: #419FA3;
            }
            .error-message {
                font-size: 0.875rem;
                color: #dc3545;
            }
            .info {
                color: blue;
            }
        </style>
    </head>

    <body>
        <jsp:include page="staffDashboard.jsp"/>
        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start mb-3 px-2"> 
                <div class="fs-3 fw-bold text-info">Tạo hợp đồng</div>
            </div>
            <div class="container" style="width: 700px;">
                <div class="Customer-information m-auto mt-5 mb-5 p-5 shadow " style="width: 100%;">
                    <!--Customer info-->
                    <form id="customerInfoForm">
                        <div class="fs-5 fw-bold text-419FA3">Thông tin người yêu cầu bảo hiểm</div>
                        <hr class="text-419FA3">
                        <div class="input-form mt-4">
                            <div class="row mb-3">
                                <div class="col-12 col-lg-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="text" name="firstName" id="firstName"  class="form-control" />
                                        <label for="firstName" class="form-label">Họ<span class="text-danger"> *</span></label>
                                    </div>
                                    <span class="error-message text-danger" id="firstNameError"></span>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="text" name="lastName" id="lastName"  class="form-control" />
                                        <label for="lastName" class="form-label">Tên<span class="text-danger"> *</span></label>
                                    </div>
                                    <span class="error-message text-danger" id="lastNameError"></span>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-12 col-lg-6">
                                    <select name="gender" id="gender" class="form-select" style="height: 37px;">
                                        <option value="">-- Giới tính --</option>
                                        <option value="true" >Nam</option>
                                        <option value="false">Nữ</option>
                                    </select>
                                    <span class="error-message text-danger" id="genderError"></span>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="date"  name="dob" id="dob" class="form-control" />
                                        <label for="dob" class="form-label">Ngày sinh<span class="text-danger"> *</span></label>
                                    </div>
                                    <span class="error-message text-danger" id="dobError"></span>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-12 col-lg-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="text" name="phoneNumber" id="phoneNumber" class="form-control" />
                                        <label for="phoneNumber" class="form-label">Số điện thoại<span class="text-danger"> *</span></label>
                                    </div>
                                    <span class="error-message text-danger" id="phoneNumberError"></span>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="email" name="email" id="email" class="form-control"/>
                                        <label for="email" class="form-label">Email<span class="text-danger"> *</span></label>
                                    </div>
                                    <span class="error-message text-danger" id="emailError"></span>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-12 col-lg-12">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="text" name="address" id="address"  class="form-control" />
                                        <label for="address" class="form-label">Địa chỉ<span class="text-danger"> *</span></label>
                                    </div>
                                    <span class="error-message text-danger" id="addressError"></span>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-12 col-lg-12">
                                    <div>(<span class="text-danger"> *</span>) Thông tin cần thiết</div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-12 col-lg-4">
                                    <button type="button" class="btn btn-primary btn-block" onclick="saveCustomerInfo()">Lưu thông tin</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!--hien thi thong tin nguoi yeu cau-->
                    <div id="doneCustomerInfoForm" class="mb-5" style="display: none;">
                        <div class="d-flex justify-content-between">
                            <div class="fs-5 fw-bold text-419FA3">Thông tin người yêu cầu bảo hiểm</div>
                            <div></div>
                            <a href="#" id="editCustomerInfo" onclick="editCustomerInfo()" class="text-info">chỉnh sửa <i class="fa-regular fa-pen-to-square fs-5"></i></a>
                        </div>

                        <hr class="text-419FA3">
                        <div class="row mb-3">
                            <div class="col-12 col-lg-6">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-muted">Họ</div>
                                    </div>
                                    <div class="col-4">
                                        <div id="doneFirstName"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-muted">Giới tính</div>
                                    </div>
                                    <div class="col-4">
                                        <div id="doneGender"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12 col-lg-6">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-muted">Tên</div>
                                    </div>
                                    <div class="col-4">
                                        <div id="doneLastName"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-muted">Ngày sinh</div>
                                    </div>
                                    <div class="col-4">
                                        <div id="doneDob"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12 col-lg-6">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-muted text-nowrap">Số điện thoại</div>
                                    </div>
                                    <div class="col-4">
                                        <div id="donePhoneNumber"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-muted">Email</div>
                                    </div>
                                    <div class="col-4">
                                        <div id="doneEmail"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-muted">Địa chỉ</div>
                                    </div>
                                    <div class="col-8">
                                        <div id="doneAddress" class="text-nowrap"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="doneInfo" style="display: none;"></div>
                    </div>
                    <!--vehicle info-->
                    <form id="vehicleInfoForm" style="display: none;">
                        <div class="fs-5 fw-bold text-419FA3">Thông tin phương tiện</div>
                        <hr class="text-419FA3">
                        <div class="input-form">
                            <div class="row mb-3">
                                <div class="col-12 col-lg-6">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sameAsCustomer" ${vehicleOwnerFirstName == firstName?'checked':''} onchange="fillCustomerInfo()"/>
                                        <label for="sameAsCustomer" class="form-check-label">Người yêu cầu là chủ phương tiện</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-12">
                                    <label for="vehicle_type" class="ms-1">Chọn loại xe</label><br>
                                    <select id="vehicle_type" class="form-select" name="vehicle_type" required>
                                        <option value="">-- chọn loại xe --</option>
                                        <c:forEach items="${listVT}" var="v">
                                            <option value="${v.id}" ${motocycleType == v.id?'selected':''}>${v.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
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
                                <div class="col-12 col-lg-4">
                                    <button type="button" class="btn btn-primary btn-block" data-mdb-ripple-init onclick="saveVehicleInfo()">Lưu thông tin</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!--hien thi thong tin phuong tien-->
                    <div id="doneVehicleInfoForm" style="display: none;">
                        <div class="d-flex justify-content-between">
                            <div class="fs-5 fw-bold text-419FA3">Thông tin phương tiện</div>
                            <div></div>
                            <a href="#" id="editVehicleInfo" onclick="editVehicleInfo()" class="text-info">chỉnh sửa <i class="fa-regular fa-pen-to-square fs-5"></i></a>
                        </div>

                        <hr class="text-419FA3">
                        <div class="row mb-3">
                            <div class="col-12 col-lg-6">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-muted">Họ chủ xe</div>
                                    </div>
                                    <div class="col-4">
                                        <div id="doneVehicleOwnerFirstName"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-muted">Biển số xe</div>
                                    </div>
                                    <div class="col-4">
                                        <div id="doneLicensePlate"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12 col-lg-6">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-muted">Tên chủ xe</div>
                                    </div>
                                    <div class="col-4">
                                        <div id="doneVehicleOwnerLastName"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-muted">Số khung</div>
                                    </div>
                                    <div class="col-4">
                                        <div id="doneChassisNumber"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12 col-lg-6">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-muted text-nowrap">Địa chỉ</div>
                                    </div>
                                    <div class="col-8">
                                        <div id="doneVehicleOwnerAddress"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-muted">Số máy</div>
                                    </div>
                                    <div class="col-4">
                                        <div id="doneEngineNumber"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="d-flex justify-content-center mb-5 mt-5">
                    <button type="button" onclick="location.href = 'ListContract'" class="btn btn-lg btn-danger rounded-pill  me-5" data-mdb-ripple-init><i class="fa-solid fa-angle-left me-2"></i>Hủy </button>
                    <button type="button" id="continue" onclick="continueToNextPage()" class="btn btn-lg btn-primary rounded-pill " data-mdb-ripple-init disabled="">Tiếp tục <i class="fa-solid fa-angle-right ms-2"></i></button>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--mdb bootstrap-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <script>
                        let customerInfo = {};
                        let vehicleInfo = {};
                        function validatePhoneNumber() {
                            const phoneNumberRegex = /^[0-9]{10,11}$/;
                            const phoneNumberValue = $("#phoneNumber").val().trim();
                            if (!phoneNumberValue) {
                                $("#phoneNumberError").html("Vui lòng nhập số điện thoại");
                                return false;
                            } else if (!phoneNumberRegex.test(phoneNumberValue)) {
                                $("#phoneNumberError").html("Số điện thoại không hợp lệ");
                                return false;
                            } else {
                                $("#phoneNumberError").html("");
                                return true;
                            }
                        }
                        function validateEmail() {
                            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                            const emailValue = $("#email").val().trim();
                            if (!emailValue) {
                                $("#emailError").html("Vui lòng nhập email");
                                return false;
                            } else if (!emailRegex.test(emailValue)) {
                                $("#emailError").html("Email không hợp lệ");
                                return false;
                            } else {
                                $("#emailError").html("");
                                return true;
                            }
                        }
                        function validateDateOfBirth() {
                            const dobValue = $("#dob").val().trim();
                            const today = new Date();
                            const dob = new Date(dobValue);
                            const age = today.getFullYear() - dob.getFullYear();
                            if (!dobValue) {
                                $("#dobError").html("Vui lòng nhập ngày sinh");
                                return false;
                            } else if (age < 18) {
                                $("#dobError").html("Bạn phải đủ 18 tuổi");
                                return false;
                            } else {
                                $("#dobError").html("");
                                return true;
                            }
                        }
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
                        function continueToNextPage() {
                            var formData = {
                                vehicleType: $('#vehicle_type').val(),
                                firstName: $("#firstName").val(),
                                lastName: $("#lastName").val(),
                                gender: $("#gender").val(),
                                dob: $("#dob").val(),
                                phoneNumber: $("#phoneNumber").val(),
                                email: $("#email").val(),
                                address: $("#address").val(),
                                vehicleOwnerFirstName: $("#vehicleOwnerFirstName").val(),
                                vehicleOwnerLastName: $("#vehicleOwnerLastName").val(),
                                vehicleOwnerAddress: $("#vehicleOwnerAddress").val(),
                                licensePlate: $("#licensePlate").val(),
                                chassisNumber: $("#chassisNumber").val(),
                                engineNumber: $("#engineNumber").val()
                            };
                            $.ajax({
                                type: "POST",
                                url: "addCustomerInfor",
                                data: formData,
                                success: function (response) {
                                    console.log("Yêu cầu đã được gửi tới servlet thành công.");
                                    window.location.href = "addCustomerInfor";
                                },
                                error: function (err) {
                                    console.error("Lỗi trong quá trình gửi yêu cầu tới servlet:", err);
                                }
                            });

                        }

                        function fillCustomerInfo() {
                            if ($("#sameAsCustomer").is(":checked")) {
                                $("#vehicleOwnerFirstName").val(customerInfo.firstName);
                                $("#vehicleOwnerLastName").val(customerInfo.lastName);
                                $("#vehicleOwnerAddress").val(customerInfo.address);
                            } else {
                                $("#vehicleOwnerFirstName").val("");
                                $("#vehicleOwnerLastName").val("");
                                $("#vehicleOwnerAddress").val("");
                            }
                        }
                        function saveCustomerInfo() {

                            let isValid = true;
                            $(".error-message").html("");
                            if (!$("#firstName").val()) {
                                $("#firstNameError").html("Vui lòng nhập họ");
                                isValid = false;
                            }
                            if (!$("#lastName").val()) {
                                $("#lastNameError").html("Vui lòng nhập tên");
                                isValid = false;
                            }
                            if (!$("#gender").val()) {
                                $("#genderError").html("Vui lòng chọn giới tính");
                                isValid = false;
                            }
                            if (!validateDateOfBirth()) {
                                isValid = false;
                            }
                            if (!validatePhoneNumber()) {
                                isValid = false;
                            }
                            if (!validateEmail()) {

                                isValid = false;
                            }
                            if (!$("#address").val()) {
                                $("#addressError").html("Vui lòng nhập địa chỉ");
                                isValid = false;
                            }
                            if (!isValid) {
                                return;
                            }
                            customerInfo = {
                                firstName: $("#firstName").val(),
                                lastName: $("#lastName").val(),
                                gender: $("#gender").val(),
                                dob: $("#dob").val(),
                                phone: $("#phoneNumber").val(),
                                email: $("#email").val(),
                                address: $("#address").val()
                            };
                            $("#doneFirstName").html(customerInfo.firstName);
                            $("#doneLastName").html(customerInfo.lastName);
                            if ($("#gender").val() === "true")
                                $("#doneGender").html('Nam');
                            else
                                $("#doneGender").html('Nữ');
                            const formattedDate = moment(customerInfo.dob).format('DD/MM/YYYY');
                            $("#doneDob").html(formattedDate);
                            $("#doneEmail").html(customerInfo.email);
                            $("#doneAddress").html(customerInfo.address);
                            $("#donePhoneNumber").html(customerInfo.phone);
                            if ($("#doneInfo").html() === "done") {
                                $("#customerInfoForm").hide();
//                    $("#vehicleInfoForm").hide();
                                $("#doneCustomerInfoForm").show();
                                $("#doneVehicleInfoForm").show();
                                $("#editVehicleInfo").show();
                            } else {
                                $("#customerInfoForm").hide();
                                $("#doneCustomerInfoForm").show();
                                $("#vehicleInfoForm").show();
                            }
                            if ($("#sameAsCustomer").is(":checked")) {
                                $("#doneVehicleOwnerFirstName").html($("#firstName").val());
                                $("#doneVehicleOwnerLastName").html($("#lastName").val());
                                $("#doneVehicleOwnerAddress").html($("#address").val());
                            }
                            fillCustomerInfo();
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
                            if (!isValid) {
                                return;
                            }

                            vehicleInfo = {
                                vehicleType: $('#vehicle_type').val(),
                                vehicleOwnerFirstName: $("#vehicleOwnerFirstName").val(),
                                vehicleOwnerLastName: $("#vehicleOwnerLastName").val(),
                                vehicleOwnerAddress: $("#vehicleOwnerAddress").val(),
                                licensePlate: $("#licensePlate").val(),
                                chassisNumber: $("#chassisNumber").val(),
                                engineNumber: $("#engineNumber").val()
                            };
                            console.log(vehicleInfo);
                            $("#doneVehicleOwnerFirstName").html(vehicleInfo.vehicleOwnerFirstName);
                            $("#doneVehicleOwnerLastName").html(vehicleInfo.vehicleOwnerLastName);
                            $("#doneVehicleOwnerAddress").html(vehicleInfo.vehicleOwnerAddress);
                            $("#doneLicensePlate").html(vehicleInfo.licensePlate);
                            $("#doneChassisNumber").html(vehicleInfo.chassisNumber);
                            $("#doneEngineNumber").html(vehicleInfo.engineNumber);
                            //set done
                            $("#doneInfo").html('done');
                            $("#vehicleInfoForm").hide();
                            $("#doneVehicleInfoForm").show();
                            $("#continue").removeAttr("disabled");
                            $("#editCustomerInfo").show();
                        }
                        function editCustomerInfo() {
                            if ($("#doneInfo").html() === "done") {
                                $("#doneCustomerInfoForm").hide();
                                $("#customerInfoForm").show();
                                $("#editVehicleInfo").hide();
                            } else {
                                $("#doneCustomerInfoForm").hide();
                                $("#doneVehicleInfoForm").hide();
                                $("#vehicleInfoForm").hide();
                                $("#customerInfoForm").show();
                            }
                            checkContinue();
                        }
                        function editVehicleInfo() {
                            $("#doneVehicleInfoForm").hide();
                            $("#vehicleInfoForm").show();
                            $("#editCustomerInfo").hide();
                            checkContinue();
                        }
                        function checkContinue() {
                            if ($("#doneCustomerInfoForm").is(":visible") && $("#doneVehicleInfoForm").is(":visible")) {
                                $("#confirm").show();
                                $("#continue").removeAttr("disabled");
                            } else {
                                $("#confirm").hide();
                                $("#continue").attr("disabled", true);
                            }
                        }
        </script>

    </body>
</html>
